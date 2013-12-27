
module Alembic
  module Xml
    class Error < Record
      attr_accessor :name, :number
      
      def name= v
        @name = "#{v}Error"
      end
      
      def compile_constants
        [
          "define_error #{number}, #{var_name} = Class.new(X11Error)"
        ]
      end
      
    end
  end
end

