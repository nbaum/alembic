Thread.abort_on_exception = true

require 'socket'
require 'alembic/promise'

module Alembic
  
  class Connection
    
    module Messages
      
      def initialize
        extend MonitorMixin
        @promises = []
        @first_sequence_no = 1
        @next_sequence_no = 1
        super
      end
      
      def join
        thread.join
      end
      
      private
      
      def update_promises (seq, event = false)
        synchronize do
          @first_sequence_no.upto(seq - 1) do |i|
            @promises[i].succeed(true)
            @promises[i] = nil
          end
          if event
            @first_sequence_no = seq
            nil
          else
            @first_sequence_no = seq + 1
            r = @promises[seq]
            @promises[seq] = nil
            r
          end
        end
      end
      
      def handle_message
        code = read(1).ord
        case code & 0x7F
        when 0
          code, seq, value = read(31).unpack("CSL")
          if promise = update_promises(seq)
            promise.fail(errors[code], value)
          else
            abort "Unexpected error"
          end
        when 1
          extra, seq, len = read(7).unpack("aSL")
          data = extra + read(24 + len * 4)
          if promise = update_promises(seq)
            promise.succeed(data)
          else
            abort "Unexpected reply"
          end
        else
          name, sequence_number = events[code & 0x7F]
          data = read(31)
          return if !name
          event = if sequence_number
            extra, seq, data = data.unpack('aSa*')
            __send__("decode_#{name}", extra + data)
          else
            __send__("decode_#{name}", data)
          end
          event[:synthetic] = code & 0x80 == 0x80
          event[:event_type] = name.gsub(/_event$/, '')
          queue_event event
        end
      end
      
      def thread
        @thread ||= Thread.new do
          message_loop
        end
      end
      
      def message_loop
        while true
          handle_message
        end
      end
      
      def send_request (data, method, reply = nil)
        get_selection_owner(1) if @next_sequence_no == 0xFFFF and !reply
        @promises[@next_sequence_no] = promise = Promise.new(self, method, reply, caller)
        data = pad(data, 2)
        data[2, 0] = [(data.length + 2) / 4].pack("S")
        write(data)
        @next_sequence_no = (@next_sequence_no + 1) & 0xFFFF
        promise
      end
      
    end
    
    include Messages
    
  end
  
end

