
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
      
      def extension_opcode (name = nil)
        (opcodes[name] ||= begin
          load_extension(name)
        end).chr.encode('BINARY')
      end
      
      def load_extension (name = nil)
        first_event, first_error, opcode = 0, 0, nil
        if name
          qe = query_extension(name)
          first_event = qe[:first_event]
          first_error = qe[:first_error]
          opcode = qe[:major_opcode]
        end
        Alembic.events[name].each do |number, data|
          events[number + first_event] = data
        end
        Alembic.errors[name].each do |number, data|
          errors[number + first_event] = data
        end
        opcodes[name] = opcode if opcode
      end
      
    end
    
    include Extensions
    
  end
  
end

