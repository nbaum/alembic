require 'socket'
require 'stringio'

module Alembic
  module Constants
  end
  module Protocol
    class << self
      attr_reader :events, :opcodes
    end
    def self.register_event (extension = nil, number, name)
      @events ||= []
      @events[number] ||= name
    end
    def self.register_opcode (extension = nil, number, name)
      @opcodes ||= []
      @opcodes[number] ||= name
    end
  end
end

require 'alembic/protocol/core'
require 'alembic/protocol/patches'
require 'alembic/protocol/xinerama'

module Alembic
  
  class Error < Exception
    def initialize value, opcode
      super("#{Protocol.opcodes[opcode]}: 0x%08x" % [value])
    end
  end
  
  RequestError = Class.new(Error)
  ValueError = Class.new(Error)
  WindowError = Class.new(Error)
  PixmapError = Class.new(Error)
  AtomError = Class.new(Error)
  CursorError = Class.new(Error)
  FontError = Class.new(Error)
  MatchError = Class.new(Error)
  DrawableError = Class.new(Error)
  AccessError = Class.new(Error)
  AllocError = Class.new(Error)
  ColormapError = Class.new(Error)
  GContextError = Class.new(Error)
  IDChoiceError = Class.new(Error)
  NameError = Class.new(Error)
  LengthError = Class.new(Error)
  ImplementationError = Class.new(Error)
  
  ERRORS =  [nil, RequestError, ValueError, WindowError, PixmapError, AtomError,
             CursorError, FontError, MatchError, DrawableError, AccessError, 
             AllocError, ColormapError, GContextError, IDChoiceError, 
             NameError, LengthError, ImplementationError]
  
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
      if data
        write("\x01")
      else
        write("\x00")
      end
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
  
  class Connection
    
    include Protocol::Core
    include Protocol::Xinerama
    include Protocol::Patches
    include Constants
    
    attr_reader :roots, :data
    
    def write *args
      @socket.write *args
    end
    
    def read *args
      @socket.read *args
    end
    
    def genxid
      @xid ||= 0
      xid = @xid * (@xid_mask & -@xid_mask) | @xid_base
      @xid += 1
      xid
    end

    def initialize
      @events = []
      #@socket = TCPSocket.new('localhost', 6001)
      @socket = UNIXSocket.new('/tmp/.X11-unix/X0')
      write [0x426C, 11, 0, 0, 0].pack("SSSSSx2")
      result, _, _, len = read(8).unpack("Cx1SSS")
      @data = read_setup(XIO.new("DEADBEEF" + read(len * 4)))
      @xid_mask = @data[:resource_id_mask]
      @xid_base = @data[:resource_id_base]
      @roots = @data[:roots].map{|r|r[:root]}
    end
    
    def request
      io = XIO.new
      yield io
      r = io.string
      r << "\0" * (-r.length & 3)
      r[2, 2] = [r.length / 4].pack("S")
      write(r)
      nil
    end
    
    class Promise
      
      def initialize value
        @value = value
      end
      
      def wait
        @value
      end
      
    end
    
    def wait (&block)
      c = read(1)
      case c.ord
      when 0
        code, seq, datum, _, opcode = read(31).unpack("CSLSCx21")
        raise ERRORS[code].new(datum, opcode)
      when 1
        extra, seq, len = read(7).unpack("CSL")
        Promise.new(yield XIO.new(extra.chr + read(len * 4 + 24)))
      else
        @events << __send__("decode_#{Protocol.events[c.ord]}_event", p(read(31)))
        nil
      end
    end
    
    def reply (&block)
      while true
        if r = wait(&block)
          return r
        end
      end
    end
    
    def do_event event
      p event
    end
    
    def do_events block = false
      wait if block and @events.empty?
      until @events.empty?
        do_event(@events.shift)
      end
    end
    
  end
  
end
