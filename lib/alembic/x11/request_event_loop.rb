Thread.abort_on_exception = true

module Alembic
  
  class Ticket
    attr_reader :stack
    
    def initialize (conn, block, stack)
      @block = block
      @conn = conn
      @stack = stack
      @queue = Queue.new
    end
    
    def wait
      @conn.get_selection_owner!(1) unless @block
      state, value = @queue.pop
      if state
        value
      else
        raise value, value.message, caller[1..-1]
      end
    end
    
    def fail (data)
      @queue.push [false, data]
    end
    
    def succeed (data)
      data = @block.(data) if @block
      @queue.push [true, data]
    end
    
  end
  
  module RequestEventLoop
    
    def initialize (display)
      @sequence_no = 1
      @tickets = {}
      @tickets.extend MonitorMixin
      @event_monitor = Monitor.new
      @event_condition = @event_monitor.new_cond
      @event_queue = []
      start_event_loop
      super
    end
    
    def skip_events event
      loop do
        if ne = check_event(event[:event_type])
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
            @event_queue.each_with_index do |ev, idx|
              if type == ev[:event_type]
                @event_queue.delete_at(idx)
                return ev
              end
            end
          else
            return @event_queue.pop unless @event_queue.empty?
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
    
    def start_event_loop
      Thread.new do
        event_loop
      end
    end
    
    def record_event (event)
      @event_monitor.synchronize do
        @event_queue << event
        @event_condition.broadcast
      end
    end
    
    def sweep_tickets (maxseq)
      @tickets.synchronize do
        @tickets.keys.each do |seq|
          break if seq > maxseq
          ticket = @tickets.delete(seq)
          ticket.succeed(true)
        end
      end
    end
    
    def event_loop
      loop do
        code = read(1).ord
        case code & 0x7f
        when 1
          extra, seq, len = read(7).unpack('aSL')
          data = extra + read(24 + len * 4)
          q = @tickets.synchronize do
            @tickets.delete(seq)
          end
          sweep_tickets(seq - 1)
          q.succeed(data) if q
        when 0
          code, seq = read(3).unpack("CS")
          data = read(28)
          q = @tickets.synchronize do
            @tickets.delete(seq)
          end
          sweep_tickets(seq - 1)
          if q
            q.fail(errors[code].new(data.inspect))
          else
            puts "Unhandled #{errors[code]}"
          end
        else
          name, no_sequence_number = events[code & 0x7f]
          synth = code & 0x80 == 0x80
          ev = nil
          if !name
            read(31)
          elsif no_sequence_number
            ev = __send__("decode_#{name}", read(31))
          else
            detail, _ = read(3).unpack('aS')
            ev = __send__("decode_#{name}", detail + read(28))
          end
          if ev
            ev[:synthetic] = synth
            ev[:event_type] = name
            record_event ev
          end
        end
      end
    end
    
    def send_request (data, &block)
      sync = true
      data = pad(data, 2)
      data[2, 0] = [(data.length + 2) / 4].pack("S")
      t = Ticket.new(self, block, caller[0])
      @tickets.synchronize do
        if @sequence_no == 0xFFFF and !block
          get_selection_owner!(1)
        end
        @tickets[@sequence_no] = t
        @sequence_no = (@sequence_no + 1) % 0x10000
      end
      write(data)
      t
    end
    
  end
end

