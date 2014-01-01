
module Alembic
  module Generator
    class Atom < Primitive
      attr_accessor :type
      
      def name
        "ATOM"
      end
      
      def pack_arguments (expr)
        "atom(#{expr})"
      end
      
      def unpack_post (expr)
        if expr
          "x[:#{expr}] = find_atom(x[:#{expr}])"
        else
          "find_atom(x)"
        end
      end
      
      def type
        "CARD32"
      end
      
      def encoder expr
        super(pack_arguments(expr))
      end
      
      def decoder
        "find_atom(#{super}, #{class_name.inspect})"
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

