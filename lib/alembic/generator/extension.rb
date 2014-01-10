require 'ox'

module Alembic
  module Generator
    
    class Extension < Element
      
      attr_accessor :items, :name
      attr_accessor :header
      attr_accessor :extension_xname, :extension_name, :extension_multiword
      attr_accessor :major_version, :minor_version
      
      def initialize (name)
        @items = {}
        @@imports ||= {}
        @name = name
        Primitive.setup_types(self)
        @@imports[name] = self
        import("xproto")
        super(self, Ox.parse(File.read("xcb-proto/src/#{name}.xml")).xcb)
        add Atom.new(self, nil)
        items.values.each(&:post_post_process)
      end
      
      def import name
        @@imports[name] ||= Extension.new(name)
      end
      
      def prefix
        extension_name ? "#{header.capitalize}" : ""
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
        
        doc:        Doc,
        
      }
      
      def compile_types (type, mode)
        items.values.flat_map do |item|
          if type === item
            item.__send__("compile_#{mode}")
          else
            []
          end 
        end
      end
      
      def compile ()
        order = [Import, Request, Enum, Event, Error, Struct, Typedef, XidType]
        code = [
          *compile_types(Import, :requirements),
          nil,
          "module Alembic",
          [
            nil,
            "register_extension #{extension.extension_xname.inspect}",
            nil,
            *order.flat_map do |type|
              [
                *compile_types(type, :comments).map { |x| "# #{x}" },
                nil
              ]
            end,
            nil,
            *order.flat_map do |type|
              [
                *compile_types(type, :constants),
                nil
              ]
            end,
            nil,
            "module Methods",
            [
              nil,
              *order.flat_map do |type|
                [
                  *compile_types(type, :methods),
                  nil
                ]
              end,
            ],
            "end",
          ],
          "end",
        ]
        format(code)
      end
      
      def lookup (name, recurse = true)
        case name
        when /^(.*):(.*)$/
          @@imports[$1].lookup($2, false)
        else
          return items[name] if items[name]
          @@imports.each do |extname, import|
            next if extname == self.name
            r = import.lookup(name, false)
            return r if r
          end if recurse
          nil
        end
      end
      
      def format (code, indent = 0)
        code.map do |segment|
          case segment
          when Array
            format(segment, indent + 2)
          else
            "#{" " * indent}#{segment}"
          end
        end.join("\n").gsub(/(\n +){3,}/, '\1\1')
      end
      
    end
    
  end
end

