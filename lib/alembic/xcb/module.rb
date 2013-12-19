
module Alembic::XCB
  
  class Module
    
    attr_accessor :things, :header, :extension_xname, :extension_name
    attr_accessor :major_version, :minor_version
    attr_accessor :set, :imports
    
    def name
      extension_name || "Core"
    end
    
    Types = {
      "xcb"        => Module,
      "xidtype"    => XidType,
      "xidunion"   => XidType,
      "eventcopy"  => EventCopy,
      "errorcopy"  => ErrorCopy,
      "field"      => Scalar,
      "fieldref"   => FieldRef,
      "doc"        => false,
      "valueparam" => ValueParam,
      "exprfield"  => ExprField,
    }
    
    def initialize (set)
      @set = set
      @things = {}
      @things["BOOL"]   = Primitive.new(self, "bool")
      @things["BYTE"]   = Primitive.new(self, "ubyte")
      @things["CARD8"]  = Primitive.new(self, "ubyte")
      @things["CARD16"] = Primitive.new(self, "ushort")
      @things["CARD32"] = Primitive.new(self, "uint")
      @things["INT8"]   = Primitive.new(self, "byte")
      @things["INT16"]  = Primitive.new(self, "short")
      @things["INT32"]  = Primitive.new(self, "int")
      @imports = [@set['xproto']].compact
    end
    
    def lookup (name)
      return things[name] if things[name]
      @imports.each do |import|
        r = import.lookup(name)
        return r if r
      end
      nil
    end
    
    def parse (node, t = nil)
      unless t
        t = Types[node.name]
        t = Alembic::XCB.const_get(node.name.capitalize) if t.nil?
        return nil unless t
        t = t.new(self)
      end
      node.attributes.each do |name, value|
        name = name.to_s.gsub("-", "_")
        t.send("#{name}=", value)
      end
      children = node.locate("^Element")
      t.add self, *children unless children.empty?
      t.text = node.text if node.text
      t.upcast
    end
    
    def upcast
      self
    end
    
    def add xcb, *nodes
      nodes.compact.each do |node|
        v = xcb.parse(node)
        @things[v.name] = v if v
      end
    end
    
    def load (path)
      parse(Ox.parse(File.read(path)).locate('xcb')[0], self)
    end
    
    def format (code, indent = 0)
      code.map do |segment|
        case segment
        when Array
          format(segment, indent + 2)
        else
          "#{" " * indent}#{segment}"
        end
      end.join("\n")
    end
    
    def compile ()
      mod = extension_name || 'Core'
      code = things.values.flat_map { |t| t.compile }.compact
      code = [
        "module Alembic::X11",
        [
          "module #{mod}",
          [
            "extend Alembic::X11::Module",
            "",
            *code,
          ],
          "end",
        ],
        "end",
      ]
      format(code)
    end
    
  end
  
end

