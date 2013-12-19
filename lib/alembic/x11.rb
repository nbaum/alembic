module Alembic; end
module Alembic::Enumerants; end
module Alembic::X11
  
  def self.event_types
    @event_types ||= {}
  end

  def self.register_event number, method, no_seq
    event_types[number] = [method, no_seq]
  end
  
end

require 'alembic/x11/resource'
require 'alembic/x11/generated'
require 'alembic/x11/polyfill'
require 'alembic/x11/connection'
require 'alembic/x11/keysyms'

