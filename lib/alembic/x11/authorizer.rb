require 'socket'

module Alembic
  module X11
    class Authorizer < Hash
      def initialize ()
        io = File.open("#{ENV["HOME"]}/.Xauthority", encoding: "BINARY")
        while io.read(2)
          len = io.read(2).unpack("n")[0]
          host = io.read(len)
          len = io.read(2).unpack("n")[0]
          port = io.read(len).to_i
          len = io.read(2).unpack("n")[0]
          name = io.read(len)
          len = io.read(2).unpack("n")[0]
          data = io.read(len)
          host = "" if host == Socket.gethostname
          self["#{host}:#{port}"] = [name, data]
        end
      ensure
        io.close if io
      end
    end
  end
end

