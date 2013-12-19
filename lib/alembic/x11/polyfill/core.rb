
module Alembic::X11::Core
  
  class Window
    
    attr_accessor :root
    
    def get_name
      prop = get_property(false, "WM_NAME", 0, 0, 255)
      case [prop.type.get_atom_name, prop.format]
      when ["STRING", 8]
        prop.value
      else
        prop.value
      end if prop.type
    end
    
  end
  
  class Atom
    attr_accessor :name
    
    def name= name
      @name = name
      Atom.names[name] = self
    end
    
    def self.names
      @names ||= {}
    end
    
    def inspect
      "Atom:#{name ? name.inspect : id}"
    end
    
    def self.to_xid (connection, obj)
      if obj.is_a?(String)
        if atom = names[obj]
          atom.id
        else
          xid = connection.intern_atom(false, obj)
          names[obj] = xid
          xid.id
        end
      else
        super(connection, obj)
      end
    end
  
  end
  
end

