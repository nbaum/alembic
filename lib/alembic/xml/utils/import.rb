
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
      
      def compile_comments
        [
        ]
      end
      
      def compile_constants
        [
          "include Alembic::Extensions::#{text.capitalize}"
        ]
      end
      
    end
  end
end

