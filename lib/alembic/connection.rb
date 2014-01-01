
require 'alembic/extension'
require 'alembic/extensions/xproto'

require 'alembic/connection/extensions'
require 'alembic/connection/network'
require 'alembic/connection/authentication'
require 'alembic/connection/setup'
require 'alembic/connection/codec'
require 'alembic/connection/messages'
require 'alembic/connection/events'
require 'alembic/connection/resources'

module Alembic
  
  class Connection
    
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

