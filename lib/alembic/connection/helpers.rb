
module Alembic
  
  class Connection
    
    module Helpers
      
      def value_param (enum, values)
        mask, list = 0, []
        enum.each do |name, bit|
          next unless values.has_key?(name)
          mask |= bit
          list << values[name]
        end
        [mask, *list]
      end
      
      def find_visuals (root, spec)
        matches = []
        setup[:roots][root][:allowed_depths].each do |depth|
          next if spec[:depth] and depth[:depth] != spec[:depth]
          depth[:visuals].each do |visual|
            match = spec.all? do |key, value|
              key == :depth or visual[key] == value
            end
            matches << visual[:visual_id] if match
          end
        end
        matches
      end
      
      def find_visual (root, spec)
        find_visuals(root, spec)[0]
      end
      
    end
    
    include Helpers
    
  end
  
end

