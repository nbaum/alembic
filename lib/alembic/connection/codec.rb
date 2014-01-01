require 'socket'

module Alembic
  
  class Connection
    
    module Codec
      
      def pad (str, plus = 0)
        str += "\0".encode("BINARY") * (-(str.length + plus) & 3)
      end
      
      def value_param (hash, args)
        mask, params = 0, []
        hash.each do |name, bit|
          if args.has_key?(name)
            mask |= bit
            params << args[name].to_i
          end
        end
        [mask, params]
      end
      
    end
    
    include Codec
    
  end
  
end

