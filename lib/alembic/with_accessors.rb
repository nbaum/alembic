
module Alembic
  
  module HashAccessors

    refine Hash do
      
      def method_missing (key, value = nil)
        if key[-1] == "="
          self[key[0..-2].to_sym] = value
        else
          self[key]
        end
      end
      
    end
    
  end
  
end

