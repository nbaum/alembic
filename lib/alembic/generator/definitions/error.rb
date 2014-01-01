
module Alembic
  module Generator
    class Error < Record
      attr_accessor :name, :number
      
      def name= v
        @name = "#{v}Error"
      end
      
      def compile_constants
        [
          "self.errors << [#{number}, #{var_name.inspect}]"
        ]
      end
      
    end
  end
end

