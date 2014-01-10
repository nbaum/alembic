
module Alembic
  module Generator
    class Error < Record
      attr_accessor :name, :number
      
      def name= v
        @name = "#{v}Error"
      end
      
      def compile_constants
        [
          "register_error #{extension.extension_xname.inspect}, #{number}, #{var_name.inspect}"
        ]
      end
      
    end
  end
end

