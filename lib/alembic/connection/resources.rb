require 'socket'

module Alembic
  
  class Connection
    
    module Resources
      
      def initialize
        @resources = {}
        @atoms = {}
        super
      end
      
      def atom (name)
        if name === nil
          0
        elsif String === name
          atom = @atoms[name] ||= intern_atom(name)
          atom.to_i
        else
          name.to_i
        end
      end
      
      def find_atom (xid)
        return nil if xid == 0
        @atoms[xid] ||= Atom.new(self, xid)
      end
      
      def find_resource (xid, type)
        return nil if xid == 0
        type = Alembic.const_get(type) unless Module === type 
        @resources[xid] ||= type.new(self, xid)
      end
      
      def forget_resource (xid)
        xid = xid.to_i
        @resources.delete(xid)
      end
      
      def make_resource (type)
        find_resource(allocate_xid, type)
      end
      
      private
      
      def allocate_xid
        synchronize do
          xid = @next_xid ||= 0
          raise "Ran out of resource IDs" if xid == setup[:resource_id_base]
          @next_xid += 1
          xid & setup[:resource_id_mask] | setup[:resource_id_base]
        end
      end
      
    end
    
    include Resources
    
  end
  
end

