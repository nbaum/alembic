
module Alembic::XCB
  
  class ModuleSet < Hash
    
    def load (name)
      return self[name] if self[name]
      m = Module.new(self)
      m.load("xml/#{name}.xml")
      self[name] = m
      m
    end
    
  end
  
end

