
module Alembic
  module Xml
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
      
      def encoder
        "raise('this doesn\\\'t work')"
      end
      
    end
  end
end

