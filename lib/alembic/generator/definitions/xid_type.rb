
module Alembic
  module Generator
    class XidType < Primitive
      attr_accessor :name, :already_compiled
      
      def pack_arguments (expr)
        "#{expr}.to_i"
      end
      
      def unpack_post (expr)
        if expr
          "x[:#{expr}] = find_resource(x[:#{expr}], #{class_name.inspect})"
        else
          "find_resource(x, #{class_name.inspect})"
        end
      end
      
      def type
        "CARD32"
      end
      
      def allocator
        "alloc_#{class_name.snake_case}"
      end
      
      def encoder expr
        super(pack_arguments(expr))
      end
      
      def decoder
        "find_resource(#{super}, #{class_name.inspect})"
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

