Thread.abort_on_exception = true

require 'socket'
require 'alembic/promise'

module Alembic
  
  class Connection
    
    module Events
      
      def initialize
        extend MonitorMixin
        @event_queue = []
        @event_signal = new_cond
        super
      end
      
      def skip_events_like (event)
        loop do
          if ne = check_event(event)
            event = ne
          else
            return event
          end
        end
      end
      
      def check_event (pattern = nil)
        next_event(pattern, false)
      end
      
      def next_event (pattern = nil, wait = true)
        synchronize do
          while true
            if pattern
              @event_queue.each_with_index do |ev, idx|
                if pattern.all? do |key, value| value === ev[key] end
                  @event_queue.delete_at(idx)
                  return ev
                end
              end
            else
              return @event_queue.pop unless @event_queue.empty?
            end
            if wait
              @event_signal.wait
              next
            else
              return false
            end
          end
        end
      end
      
      def queue_event (event)
        synchronize do
          @event_queue << event
          @event_signal.broadcast
        end
      end
      
    end
    
    include Events
    
  end
  
end

