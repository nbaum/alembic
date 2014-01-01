
module Alembic
  module Generator
    class Struct < Record
      
      attr_accessor :name
      
      alias type name
      
      def compile_methods
        encoder_method +
        decoder_method
      end
      
    end
  end
end

