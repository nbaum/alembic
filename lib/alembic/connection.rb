require 'socket'
require 'thread'
require 'monitor'

module Alembic
  
  class Connection < Thread
    
    include Protocol::Core
    include Protocol::Xinerama
    include Protocol::Patches
    include Constants
    include MonitorMixin
    
    attr_reader :roots, :data, :requests
      
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
      @handlers = Hash.new do |h, k|
        h[k] = []
      end
      @events = Queue.new
      @socket = TCPSocket.new('localhost', 6001)
      #@socket = UNIXSocket.new('/tmp/.X11-unix/X0')
      write [0x426C, 11, 0, 0, 0].pack("SSSSSx2")
      result, _, _, len = read(8).unpack("Cx1SSS")
      @data = read_setup(XIO.new("DEADBEEF" + read(len * 4)))
      @xid_mask = @data[:resource_id_mask]
      @xid_base = @data[:resource_id_base]
      @roots = @data[:roots]
      @requests = {}
      @seq = 0
      Thread.abort_on_exception = true
      super do
        loop do
          c = read(1)
          case c.ord
          when 0
            code, seq, datum, _, opcode = read(31).unpack("CSLSCx21")
            err = ERRORS[code].new(datum, opcode)
            if p = @requests.delete(seq)
              p.fail(err)
            else
              @events << err
            end
          when 1
            extra, seq, len = read(7).unpack("CSL")
            if p = @requests.delete(seq)
              p.succeed(extra.chr + read(len * 4 + 24))
            end
          else
            hash = __send__("decode_#{Protocol.events[c.ord]}_event", read(31))
            hash[:type] = Protocol.events[c.ord]
            @events << hash
            nil
          end
        end
      end
    end
    
    def setup
      @keymap = Alembic::Keysyms.invert
      @keysyms = {}
      get_keyboard_mapping(@data[:min_keycode], @data[:max_keycode] - @data[:min_keycode])[:keysyms].each_with_index do |kss, kc|
        kss.each do |ks|
          unless ks == 0
            ks = @keymap[ks]
            @keysyms[ks] ||= []
            @keysyms[ks] |= [kc + @data[:min_keycode]]
          end
        end
      end
    end
    
    def request
      io = XIO.new
      result = yield io
      r = io.string
      r << "\0" * (-r.length & 3)
      r[2, 2] = [r.length / 4].pack("S")
      write(r)
      result
    end
    
    class Promise
      
      def initialize conn, seq, block
        @conn = conn
        @seq = seq
        @block = block
        @queue = Queue.new
        conn.requests[seq] = self
      end
      
      def succeed value
        @queue.push [true, value]
      end
      
      def fail error
        @queue.push [false, error]
      end
      
      def wait
        ok, value = @queue.pop
        if ok
          @block ? @block.(XIO.new(value)) : value
        else
          raise value
        end
      end
      
    end
    
    def no_reply ()
    end
    
    def reply (&block)
      Promise.new(self, @seq += 1, block)
    end
    
    def handle event, &block
      @handlers[event].push block
    end
    
    def unhandle event
      @handlers[event].pop
    end
    
    def do_event event
      type = Error === event ? :error : event[:type]
      handlers = @handlers[type]
      if handlers.empty?
        puts "#{type} listened for but unhandled"
      else
        handlers.each do |h|
          break unless h.(event)
        end
      end
    end
    
    def event_loop &block
      loop do
        ev = @events.pop
        if block
          yield ev
        else
          do_event ev
        end
      end
    end
    
  end
  
end

