
module Alembic
  
  module Xml
    
    class Extension < Element
      
      attr_accessor :items, :name
      attr_accessor :header
      attr_accessor :extension_xname, :extension_name
      attr_accessor :major_version, :minor_version
      
      def initialize (name)
        @items = {}
        @@imports ||= {}
        @name = name
        Primitive.setup_types(self)
        @@imports[name] = self
        import("xproto")
        super(self, Ox.parse(File.read("xml/#{name}.xml")).xcb)
        items.values.each(&:post_post_process)
      end
      
      def import name
        @@imports[name] ||= Extension.new(name)
      end
      
      def prefix
        extension_name ? "#{name.capitalize}" : ""
      end
      
      def add (*items)
        items.each do |item|
          self.items[item.name] = item
        end
      end
      
      def element_class (node)
        ELEMENT_CLASSES[node.name.to_sym]
      end
      
      ELEMENT_CLASSES = {
        
        import:     Import,
        
        struct:     Struct,
        event:      Event,
        eventcopy:  EventCopy,
        union:      Union,
        error:      Error,
        errorcopy:  ErrorCopy,
        request:    Request,
        reply:      Reply,
        
        xidtype:    XidType,
        xidunion:   XidType,
        typedef:    Typedef,
        
        field:      Scalar,
        pad:        Pad,
        enum:       Enum,
        list:       List,
        valueparam: ValueParam,
        exprfield:  ExprField,
        fd:         FileDescriptor,
        
        fieldref:   FieldRef,
        op:         Op,
        value:      Value,
        
        doc:        false,
        
      }
      
      def compile ()
        code = items.values.flat_map do |item|
          item.compile
        end
        code = [
          "module Alembic",
          [
            "module Extensions",
            [
              "module #{extension_name || 'Xproto'}",
              [
                "extend Alembic::ExtensionMethods",
                nil,
                "extension_xname #{extension_xname.inspect}",
                nil,
                "module Methods",
                "end",
                nil,
                *code,
              ],
              "end",
            ],
            "end",
          ],
          "end"
        ]
        format(code)
      end
      
      def lookup (name, recurse = true)
        return items[name] if items[name]
        @@imports.each do |extname, import|
          next if extname == self.name
          r = import.lookup(name, false)
          return r if r
        end if recurse
        nil
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
      
    end
    
  end
  
end
