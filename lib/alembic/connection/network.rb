require 'socket'

module Alembic
  
  class Connection
    
    module Network
      
      def address
        @address ||= begin
          case @display
          when /^:(\d+)(\.\d+)?$/
            host = nil
            port = $1.to_i
          when /^([^:]+):(\d+)(\.\d+)?$/
            host = $1
            port = 6000 + $2.to_i
          else
            abort "Bad DISPLAY: #{@display}"
          end
          [host, port]
        end
      end
      
      def socket ()
        @socket ||= begin
          host, port = address
          if host
            TCPSocket.open(host, port)
          else
            UNIXSocket.open("/tmp/.X11-unix/X#{port}")
          end
        end
      end
      
      def write (data)
        socket.write(data)
      end
      
      def read (len)
        socket.read(len)
      end
      
    end
    
    include Network
    
  end
  
end

