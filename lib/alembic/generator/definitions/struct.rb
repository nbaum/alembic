
module Alembic
  module Generator
    class Struct < Record
      
      attr_accessor :name
      
      alias type name
      
      def compile_methods
        [
          "# :nodoc:",
          *encoder_method,
          "# :nodoc:",
          *decoder_method,
        ]
      end
      
    end
  end
end

