
module Alembic
  module Xml
    class Struct < Record
      
      attr_accessor :name
      
      alias type name
      
      def compile
        struct_definition +
        encoder_method +
        decoder_method
      end
      
    end
  end
end

