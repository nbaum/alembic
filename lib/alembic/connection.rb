
module Alembic
  
  def self.events ()
    @@events ||= {}
  end
  
  def self.errors ()
    @@errors ||= {}
  end
  
  def self.register_extension (name)
    events[name] = {}
    errors[name] = {}
  end
  
  def self.register_event (extension, number, *data)
    events[extension][number] = data
  end
  
  def self.register_error (extension, number, *data)
    errors[extension][number] = data
  end
  
end

require 'alembic/extension'
require 'alembic/protocol/xproto'

require 'alembic/connection/base'
require 'alembic/connection/extensions'
require 'alembic/connection/network'
require 'alembic/connection/authentication'
require 'alembic/connection/setup'
require 'alembic/connection/codec'
require 'alembic/connection/messages'
require 'alembic/connection/events'
require 'alembic/connection/resources'
require 'alembic/connection/helpers'
require 'alembic/connection/polyfill'
require 'alembic/connection/chords'
require 'alembic/connection/cursors'
require 'alembic/connection/randr'

