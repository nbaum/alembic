
module Alembic
  module Xml
    class ErrorCopy < Error
      attr_accessor :ref
      
      def ref= v
        @ref = "#{v}Error"
      end
      
      def post_post_process
        self.fields = lookup(ref).fields.dup
      end
      
    end
  end
end

