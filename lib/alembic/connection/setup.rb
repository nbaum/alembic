require 'socket'

module Alembic
  
  class Connection
    
    module Setup
      
      MAGIC = [0x426C, 11, 0]
      
      def setup
        @setup ||= begin
          write(encode_setup_request("", *Alembic::Connection::Setup::MAGIC, *authentication || ["", ""]))
          header = read(8)
          state, len = header.unpack('Cx5S')
          data = header + read(len * 4)
          case state
          when 0
            raise SetupError, decode_setup_failed(data)[:reason]
          when 1
            decode_setup(data)
          when 2
            raise SetupError, decode_setup_authenticate(data)[:reason]
          else
            raise SetupError, "Broken server replied to SetupRequest with 0x%02x" % state
          end
        end
      end
      
    end
    
    include Setup
    
  end
  
end

