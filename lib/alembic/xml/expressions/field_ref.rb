
module Alembic
  module Xml
    class FieldRef < Element
      
      attr_accessor :name
      
      def text= (v)
        self.name = v
      end
      
      def to_s
        name
      end
      
      def compile_length
        "x[:#{name}]"
      end
      
    end
  end
end

