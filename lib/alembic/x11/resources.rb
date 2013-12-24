
module Alembic
  class Resource
    attr_reader :connection, :xid
    
    def self.[] (conn, xid)
      return nil if xid == 0
      conn.resources[xid] ||= new(conn, xid)
    end
    
    def self.to_xid (conn, obj)
      case obj
      when Fixnum
        obj
      when Resource
        obj.xid
      when nil  
        0
      else
        raise TypeError, "Can't convert object to XID"
      end
    end
    
    def initialize (conn, xid)
      @connection, @xid = conn, xid
    end
    
    def inspect
      "#<#{self.class.name.split("::")[-1]} 0x%08x>" % [@xid]
    end
    
  end
end

