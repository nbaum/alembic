
module Alembic
  module Xml
    class Error < Record
      attr_accessor :name, :number
      
      def name= v
        @name = "#{v}Error"
      end
      
      def compile
        [
          "#{var_name} = Class.new(X11Error)",
          nil,
          "define_error #{number}, #{var_name}",
          nil
        ]
      end
      
    end
  end
end

