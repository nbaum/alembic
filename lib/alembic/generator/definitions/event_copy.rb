
module Alembic
  module Generator
    class EventCopy < Event
      attr_accessor :ref
      
      def ref= v
        @ref = "#{v}Event"
      end
      
      def post_post_process
        self.fields = extension.items[ref].fields.dup
      end
      
    end
  end
end

