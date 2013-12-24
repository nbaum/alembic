
module Alembic

  class << self
    attr_accessor :extensions
  end
  
  self.extensions = {}
  
  module ExtensionMethods
    
    def extension_xname (name)
      @name = name
      Alembic.extensions[name] = self
    end
    
    def events ()
      @events ||= {}
    end
    
    def define_event (number, name, no_sequence_number)
      self.events[number] = [name, no_sequence_number]
    end
    
    def errors ()
      @errors ||= {}
    end
    
    def define_error (number, name)
      self.errors[number] = name
    end
    
  end
end

