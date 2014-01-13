
module Alembic
  
  class Atom
    
    attr_reader :connection, :xid
    
    alias to_i xid
    
    def initialize (connection, xid)
      @connection, @xid = connection, xid
    end
    
    def inspect
      "#<%s 0x%08x %s>" % [self.class.name, xid, name]
    end
    
    def name
      @name ||= c.get_atom_name(xid)
    end
    
    def kill_client
      c.kill_client(xid)
    end
    
    def display
      c.display
    end
    
    private
    
    def c
      @connection
    end
    
  end
  
  class Resource
    
    attr_reader :connection, :xid
    
    alias to_i xid
    
    def initialize (connection, xid)
      @connection, @xid = connection, xid
    end
    
    def inspect
      "#<%s 0x%08x>" % [self.class.name, xid]
    end
    
    def kill_client
      c.kill_client(xid)
    end
    
    def display
      c.display
    end
    
    private
    
    def c
      @connection
    end
    
  end
  
end

