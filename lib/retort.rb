require 'extlib'
require 'alembic/connection'
require 'alembic/reactor'

include Alembic::Extensions::Xproto

class Alembic::Extensions::Xproto::Window
  attr_accessor :client
end

require 'retort/screen'
require 'retort/reactor'
require 'retort/client'

