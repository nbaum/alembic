require 'singleton'

module Alembic

  class Reactor
    include Singleton
    
    @@running = false
    
    def run_once
      unless @@running
        run
      end
    end
    
    def post_init
    end
    
    def handle_event
      e = c.next_event
      if respond_to?(e.event_type)
        #puts "handled #{e[:event_type]}"
        __send__(e.event_type, e)
      else
        puts "unhandled #{e.event_type}"
      end
    rescue => e
      STDERR.puts "#{e.class} (#{e.message})\n  #{e.backtrace.join("\n  ")}"
    end
    
    def run
      @@running = true
      @connection = Alembic::Connection.new
      post_init
      while true
        handle_event
      end
    ensure
      @running = false
    end
    
  private
    
    def c
      @connection
    end
    
  end

end

