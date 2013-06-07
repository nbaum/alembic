
module Alembic
  
  Constants = Module.new
    
  module Protocol
    
    class << self
      attr_reader :events, :opcodes
    end
    
    def self.register_event (extension = nil, number, name)
      @events ||= []
      @events[number] ||= name
    end
    
    def self.register_opcode (extension = nil, number, name)
      @opcodes ||= []
      @opcodes[number] ||= name
    end
    
  end
  
end

require 'alembic/protocol/core'
require 'alembic/protocol/patches'
require 'alembic/protocol/xinerama'
require 'alembic/protocol/keysyms'
