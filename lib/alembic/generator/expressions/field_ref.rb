
module Alembic
  module Generator
    class FieldRef < Element
      
      attr_accessor :name
      
      def text= (v)
        self.name = v
      end
      
      def to_s
        name
      end
      
      def compile_length
        "x[:#{name}]"
      end
      
      def compile_expr
        if name == "string_len"
          "string.length"
        else
          name
        end
      end
      
    end
  end
end

