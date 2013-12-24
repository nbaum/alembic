
module Alembic
  module Xml
    class Op < Element
      
      attr_accessor :op, :left, :right
      
      def add (left, right)
        @left, @right = left, right
      end
      
      def compile_length
        "(#{left.compile_length} #{op} #{right.compile_length})"
      end
      
    end
  end
end

