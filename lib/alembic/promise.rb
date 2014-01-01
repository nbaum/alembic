
module Alembic
  
  class Promise
    
    def initialize (connection, method, reply, backtrace)
      extend MonitorMixin
      @connection, @method, @reply, @backtrace = connection, method, reply, backtrace[1..-1]
      @signal = new_cond
    end
    
    def inspect
      "#<Promise #{@method.inspect} #{backtrace[0].inspect}>"
    end
    
    def succeed (data)
      data = @connection.__send__("#{@method}_reply", data) if @reply
      resolve true, data
    end
    
    def fail ((error), value)
      resolve false, error, value
    end
    
    def wait
      synchronize do
        @signal.wait if @resolution.nil?
      end
      if @resolution
        return @data[0]
      else
        raise ServerError.error_class(@data[0]), @data[1]
      end
    end
    
    def abandon
      synchronize do
        alert(*@data) if @resolution and !@method
        @resolution = true
        nil
      end
    end
    
    private
    
    def alert (error, value)
      @connection.queue_event(event_type: "error_event", error: error, value: value, backtrace: @backtrace)
    end
    
    def resolve (resolution, *data)
      synchronize do
        if @resolution
          alert(*data) unless resolution
        else
          @resolution = resolution
          @data = data
          @signal.broadcast
        end
      end
    end
    
  end
  
end

