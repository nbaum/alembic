
module Alembic
  module Generator
    class Import < Element
      
      attr_accessor :text
      
      def name
        text
      end
      
      def post_process
        extension.import text
        self
      end
      
      def compile_requirements
        [
          "require 'alembic/protocol/#{text}'"
        ]
      end
      
    end
  end
end

