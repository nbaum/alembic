require 'alembic/error'

require 'alembic/x11/authorizer'
require 'alembic/x11/extensions'
require 'alembic/x11/resources'
require 'alembic/x11/request_event_loop'
require 'alembic/x11/connection_utils'
require 'alembic/x11/keysyms'
require 'alembic/x11/value_param_helper'

require 'alembic/extensions/xproto'
require 'alembic/extensions/render'
require 'alembic/extensions/randr'

require 'alembic/polyfill/xproto'

module Alembic
  
  class Connection
    
    attr_reader :events, :errors, :resources, :setup, :opcodes, :atoms
    
    include ConnectionUtils
    include RequestEventLoop
    
    def initialize (display = ENV["DISPLAY"])
      @display = display
      @events = {}
      @errors = {}
      @resources = {}
      @opcodes = {}
      @atoms = {}
      @xid = 0
      parse_display
      @auth = X11::Authorizer.new[@display] || ["", ""]
      connect
      load_extension nil, nil, 0, 0
      perform_setup
      super
    end
    
    def decode_enum (value, hash)
      hash[value] || value
    end
    
    def decode_mask (value, hash)
      flags = []
      hash.each do |mask, name|
        next if mask == 0
        if value & mask == mask
          flags << name
          value &= ~mask
        end
      end
      flags << value if value != 0
      flags
    end
    
    def encode_enum (value, hash)
      hash[value] || value
    end
    
    def encode_mask (flags, hash)
      if Array === flags
        value = 0
        hash.each do |mask, name|
          value |= mask if flags.member(name)
        end
        value
      else
        encode_enum(flags, hash)
      end
    end
    
    def alloc_xid
      xid = @xid
      raise "Ran out of resource IDs" if xid == setup[:resource_id_base]
      @xid += 1
      xid & setup[:resource_id_mask] | setup[:resource_id_base]
    end
    
    def load_extension (name, opcode, event, error)
      mod = Alembic.extensions[name]
      extend mod.const_get("Methods")
      mod.events.each do |number, name|
        events[number + event] = name
      end
      mod.errors.each do |number, name|
        errors[number + error] = name
      end
      opcodes[name] = opcode
    end
    
    def parse_display ()
      case @display
      when /^:(\d+)(\.\d+)?$/
        @host = nil
        @port = $1.to_i
      when /^([^:]+):(\d+)(\.\d+)?$/
        @host = $1
        @port = 6000 + $2.to_i
      else
        raise "Problem with DISPLAY string `#{display}'"
      end
      @display = "#{@host}:#{@port}"
    end
    
    def connect ()
      if @host
        @socket = TCPSocket.open(@host, @port)
      else
        @socket = UNIXSocket.open("/tmp/.X11-unix/X#{@port}")
      end
    end
    
    def pad (str, plus = 0)
      str += "\0" * (-(str.length + plus) & 3)
    end
    
    def buffer ()
      "".encode("BINARY")
    end
    
    def write (data)
      @socket.write(data)
    end
    
    def read (length)
      @socket.read(length)
    end
    
    def perform_setup
      write(encode_setup_request(buffer, 0x426c, 11, 0, *@auth))
      header = read(8)
      state, len = header.unpack('Cx5S')
      data = header + read(len * 4)
      case state
      when 0
        raise SetupError, decode_setup_failed(data)[:reason]
      when 2
        raise SetupError, decode_setup_authenticate(data)[:reason]
      when 1
        @setup = decode_setup(data)
      else
        raise SetupError, "Unexpected status byte `0x%02x'" % state
      end
    end
    
  end
  
end

