require 'stringio'

module Alembic
  
  class XIO < StringIO
    
    def initialize (str = "".encode("BINARY"))
      super(str)
    end
    
    def read_bool
      read(1) != "\0"
    end
    
    def read_byte
      read(1).unpack("c")[0]
    end
    
    def read_wyde
      read(2).unpack("s")[0]
    end
    
    def read_tetra
      read(4).unpack("l")[0]
    end
    
    def read_ubyte
      read(1).unpack("C")[0]
    end
    
    def read_uwyde
      read(2).unpack("S")[0]
    end
    
    def read_utetra
      read(4).unpack("L")[0]
    end
    
    def skip n
      read(n)
    end
    
    def write_bool (data)
      write(data ? "\x01" : "\x00")
    end
    
    def write_byte (data)
      write([data].pack("c"))
    end
    
    def write_wyde (data)
      write([data].pack("s"))
    end
    
    def write_tetra (data)
      write([data].pack("l"))
    end
    
    def write_ubyte (data)
      write([data].pack("C"))
    end
    
    def write_uwyde (data)
      write([data].pack("S"))
    end
    
    def write_utetra (data)
      write([data].pack("L"))
    end
    
  end
  
end
