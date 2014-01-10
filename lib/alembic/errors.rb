
module Alembic
  
  class Error < ::StandardError 
  end
  
  class SetupError < Error
  end
  
  class ServerError < Error
    
    attr_reader :value
    
    def self.error_class (name)
      if Alembic.const_defined?(name)
        Alembic.const_get(name)
      else
        Alembic.const_set(name, Class.new(self))
      end
    end
    
    def initialize (value)
      @value = value
    end
    
    def message
      "Bad #{self.class.name.gsub(/.*::/, '').gsub(/Error$/, '')} 0x%08x" % value
    end
    
  end
  
end

