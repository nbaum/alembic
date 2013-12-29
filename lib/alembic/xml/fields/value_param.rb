
module Alembic
  module Xml
    class ValueParam < List
      
      attr_accessor :value_mask_type, :value_mask_mask, :value_mask_name, :value_list_name
      
      def type
        "CARD32"
      end
      
      alias name value_list_name
      
      def lengther
        [
          "#{value_mask_name}, #{value_list_name} = #{value_mask_mask.snake_case.upcase}.value_param(#{hash_param})"
        ]
      end
      
      def hash_param
        name.gsub(/_list/, '_hash')
      end
      
      def args
        [
          hash_param
        ]
      end
      
      def params
        [
          hash_param + " = {}"
        ]
      end
      
      def hides
        [
          value_mask_name
        ]
      end
      
    end
  end
end

