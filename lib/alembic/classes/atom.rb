
require 'alembic/classes/resource'

module Alembic
  include Alembic::Extensions::Xproto
  
  class Atom < Resource
    
    def name ()
      @name ||= c.get_atom_name(xid)
    end
    
    def inspect
      "#<Atom:0x%08x #{name}>" % [xid]
    end
    
    def selection_owner= (owner, time = 0)
      c.set_selection_owner(owner, xid, time)
    end
    
    def selection_owner ()
      c.get_selection_owner(xid)
    end
    
    # convert_selection (requestor, selection, target, property, time)
    
  end
  
end

