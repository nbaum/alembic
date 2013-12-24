Thread.abort_on_exception = true

require 'stringio'
require 'thread'
require 'socket'
require 'pp'

module Alembic

  Error = Class.new(Exception)
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
  
  class Connection
    include X11::Core
    prepend X11::Polyfill
    
    attr_accessor :seq, :display
    
    def initialize
      @display = ENV["DISPLAY"]
      if @display =~ /^:(\d+)$/
        @host = nil
        @port = $1.to_i
      elsif @display =~ /^([^:]+):(\d+)$/
        @host = $1
        @port = 6000 + $2.to_i
      else
        raise "Couldn't parse $DISPLAY"
      end
      if @host
        @socket = TCPSocket.open(@host, @port)
      else
        @socket = UNIXSocket.open("/tmp/.X11-unix/X#{@port}")
      end
      @id = 0
      @seq = 0
      @events = []
      @requests = {}
      @event_monitor = Monitor.new
      @event_condition = @event_monitor.new_cond
      setup
      start_event_loop
      get_keyboard_mapping(setup.min_keycode, setup.max_keycode - setup.min_keycode)
    end
    
    def write string
      @socket.write string
    end
    
    def read length
      r = @socket.read length
      r
    end
    
    def parse (file)
      {}.tap do |displays|
        io = StringIO.new(file)
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
          displays["#{host}:#{port}"] = [name, data]
        end
      end
    end
    
    def authority
      @authority ||= parse File.read("#{ENV["HOME"]}/.Xauthority", encoding: "BINARY")
    end
    
    Errors = [ RequestError, ValueError, WindowError, PixmapError, AtomError, CursorError, FontError, MatchError, DrawableError, AccessError, AllocError, ColormapError, GContextError, IDChoiceError, NameError, LengthError, ImplementationError ]
    
    def pad str
      str += " " * (-str.length & 3)
    end
    
    def resources
      @@resources ||= {}
    end
    
    def connection
      self
    end
    
    def events
      @events ||= []
    end
    
    def skip_events event
      loop do
        if ne = check_event(event.class)
          event = ne
        else
          return event
        end
      end
    end
    
    def check_event type = nil
      next_event(type, false)
    end
    
    def next_event type = nil, wait = true
      @event_monitor.synchronize do
        loop do
          if type
            @events.each_with_index do |ev, idx|
              if type === ev
                @events.delete_at(idx)
                return ev
              end
            end
          else
            return @events.pop unless @events.empty?
          end
          if wait
            @event_condition.wait
            next
          else
            return false
          end
        end
      end
    end
    
    def requests
      @requests ||= {}
    end
    
    def start_event_loop
      Thread.new do
        event_loop
      end
    end
    
    def event_loop
      loop do
        code = read(1).ord
        p code
        case code
        when 1
          extra, seq, len = read(7).unpack('aSL')
          data = extra + read(24 + len * 4)
          q = requests[seq]
          if q
            q.push([true, data])
          else
            raise "unused reply"
          end
        when 0
          data = read(31)
          q = requests[seq]
          if q
            q.push([false, data])
          else
            raise "unused error"
          end
        else
          et = X11.event_types[code & 0x7f]
          synth = code & 0x80 == 0x80 ? 1.chr : 0.chr
          if !et
            read(31)
          elsif et[1]
            record_event __send__(et[0], read(31) + synth)
          else
            detail, _ = read(3).unpack('aS')
            record_event __send__(et[0], detail + read(28) + synth)
          end
        end
      end
    end
    
    def record_event (event)
      @event_monitor.synchronize do
        events << event
        @event_condition.broadcast
      end
    end
    
    def read_reply (seq)
      requests[seq] = q = Queue.new
      state, *data = q.pop
      if state
        return data[0]
      else
        raise *data
      end
    end
    
    def genid
      id = @id
      raise "Ran out of resource IDs" if id == setup.resource_id_base
      @id += 1
      id & setup.resource_id_mask | setup.resource_id_base
    end
    
    def setup
      @setup ||= begin
        auth = authority[ENV["DISPLAY"]]
        auth = ["", ""] unless auth
        write pad encode_setup_request "".encode("BINARY"), 0x426c, 11, 0, auth[0], auth[1]
        header = read(8)
        state, len = header.unpack('Cx5S')
        case state
        when 0, 2
          decode_setup_failed(header + read(len * 4))
        when 1
          decode_setup(header + read(len * 4))
        end
      end
    end
    
  end
  
end

