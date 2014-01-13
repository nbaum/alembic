
module Alembic
  
  class Connection
    include Methods
    
    def initialize (display = ENV["DISPLAY"])
      @display = display
      super()
      setup
      thread
    end
    
    def display
      @dpy ||= Display.new(self)
    end
    
  end
  
end

