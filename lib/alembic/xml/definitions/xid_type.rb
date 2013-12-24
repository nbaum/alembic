
module Alembic
  module Xml
    class XidType < Primitive
      attr_accessor :name, :already_compiled
      
      def class_name
        name.capitalize
      end
      
      def pack_arguments (expr)
        "#{class_name}.to_xid(self, #{expr})"
      end
      
      def unpack_post (expr)
        if expr
          "x.#{expr} = #{class_name}[self, x.#{expr}]"
        else
          "#{class_name}[self, x]"
        end
      end
      
      def type
        "CARD32"
      end
      
      def encoder expr
        super(pack_arguments(expr))
      end
      
      def decoder
        "#{class_name}[self, #{super}]"
      end
      
      def compile
        return [] if already_compiled
        self.already_compiled = true
        if st = @@supertypes[name]
          st.compile
        else
          []
        end + [
          "#{class_name} = Class.new(#{(st ? st.name.capitalize : 'Resource')})",
          nil,
          "module Methods",
          [
            "def alloc_#{class_name.snake_case} ()",
            [
              "#{class_name}.new(self, alloc_xid)"
            ],
            "end",
          ],
          "end",
        ]
      end
      
      def add_nodes (subtypes)
        @@supertypes ||= {}
        subtypes.each do |subtype|
          @@supertypes[subtype.text] = self
        end
      end
      
    end
  end
end

