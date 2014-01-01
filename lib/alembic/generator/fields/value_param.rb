
module Alembic
  module Generator
    class ValueParam < List
      
      attr_accessor :value_mask_type, :value_mask_mask, :value_mask_name, :value_list_name
      
      def type
        "CARD32"
      end
      
      alias name value_list_name
      
      def pack_arguments
        "*#{name}.map(&:to_i)"
      end
      
    end
  end
end

