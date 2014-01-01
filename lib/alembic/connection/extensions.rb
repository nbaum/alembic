
module Alembic
  
  class Connection
    
    module Extensions
      
      attr_accessor :events
      attr_accessor :errors
      attr_accessor :opcodes
      
      def initialize ()
        @events = {}
        @errors = {}
        @opcodes = {}
        load_extension
        super
      end
      
      def load_extension (name = nil)
        first_event, first_error, opcode = 0, 0, nil
        if mod = Alembic::Extensions.registry[name]
          extend mod.const_get("Methods")
          mod.events.each do |number, *data|
            events[number + first_event] = data
          end
          mod.errors.each do |number, *data|
            errors[number + first_event] = data
          end
          opcodes[name] = opcode if opcode
        else
          raise "Extension #{name} not found."
        end
      end
      
    end
    
    include Extensions
    
  end
  
end

