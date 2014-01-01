
module Alembic
  module Generator
    class ExprField < Element
      
      attr_accessor :name, :type, :expr
      
      def add (node)
        self.expr = node
      end
      
      def lengther
        []
      end
      
      def params
        []
      end
      
      def args
        params
      end
      
      def encoder
        expr.compile_expr
      end
      
    end
  end
end

