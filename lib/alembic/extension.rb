
module Alembic
  
  module Extensions
    class << self
      attr_accessor :registry
    end
    self.registry = {}
  end
  
  module Extension
    
    def self.included (other)
      other.extend(ClassMethods)
      other.events = []
      other.errors = []
    end
    
    module ClassMethods
      attr_accessor :name, :events, :errors
      def name= (name)
        @name = name
        Alembic::Extensions.registry[@name] = self
      end
    end
    
  end
  
end

Dir[File.expand_path("../protocol/*.rb", __FILE__)].each do |path|
  require path
end

