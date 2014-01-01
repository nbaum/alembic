
module Alembic
  module Generator
    class Op < Element
      
      attr_accessor :op, :left, :right
      
      def add (left, right)
        @left, @right = left, right
      end
      
      def compile_length
        "(#{left.compile_length} #{op} #{right.compile_length})"
      end
      
      def compile_expr
        "(#{left.compile_expr} #{op} #{right.compile_expr})"
      end
      
    end
  end
end

