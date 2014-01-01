
module Alembic
  
  class Connection
    
    module Authentication
      
      def authentication ()
        File.open("#{ENV["HOME"]}/.Xauthority", encoding: "BINARY") do |io|
          while io.read(2)
            len = io.read(2).unpack("n")[0]
            host = io.read(len)
            len = io.read(2).unpack("n")[0]
            port = io.read(len).to_i
            len = io.read(2).unpack("n")[0]
            name = io.read(len)
            len = io.read(2).unpack("n")[0]
            data = io.read(len)
            host = nil if host == Socket.gethostname
            return [name, data] if [host, port] == address
          end
        end
        return nil
      end

    end
    
    include Authentication
    
  end

end

