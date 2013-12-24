
module Alembic
  module Xml
    class ValueParam < List
      
      attr_accessor :value_mask_type, :value_mask_name, :value_list_name, :enum
      
      def type
        "CARD32"
      end
      
      alias name value_list_name
      
      def params
        [
          "*#{name}"
        ]
      end
      
      def lengther
        []
      end
      
    end
  end
end

