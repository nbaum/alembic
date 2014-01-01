
module Alembic
  module Generator
    class Value < Element
      
      attr_accessor :value
      
      def text= (v)
        self.value = v.to_i
      end
      
      def succ
        self.class.new(@extension).tap do |v|
          v.value = self.value + 1
        end
      end
      
      def to_s
        value.inspect
      end
      
      def compile_length
        value.inspect
      end
      
      def compile_expr
        value.inspect
      end
      
    end
  end
end

