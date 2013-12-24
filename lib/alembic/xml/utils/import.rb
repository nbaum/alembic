
module Alembic
  module Xml
    class Import < Element
      
      attr_accessor :text
      
      def name
        text
      end
      
      def post_process
        extension.import text
        self
      end
      
      def compile
        [
          "include Alembic::Extensions::#{text.capitalize}",
          nil
        ]
      end
      
    end
  end
end

