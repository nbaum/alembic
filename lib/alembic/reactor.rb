
module Alembic
  
  class Reactor
    
    attr_reader :connection
    
    def initialize (connection = Alembic::Connection.new)
      @connection = connection
    end
    
    def unhandled_event (event)
      STDERR.puts "No handler for #{event}"
    end
    
    def error_event (event)
      STDERR.puts "Unhandled #{event[:error]}: 0x%08x" % event[:value]
      STDERR.puts "  #{event[:backtrace].join("\n  ")}"
      STDERR.puts
    end
    
    def dispatch_event (event)
      if respond_to?(event[:event_type])
        __send__(event[:event_type], event)
      else
        unhandled_event(event)
      end
    end
    
    def handle_event
      dispatch_event(@connection.next_event)
    end
    
    def run
      handle_event while true
    end
    
  end
  
end

