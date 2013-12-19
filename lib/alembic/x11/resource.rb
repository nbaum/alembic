
class Alembic::X11::Resource
  
  attr_accessor :conn, :id
  
  def self.[] (conn, id)
    return nil if id == 0
    conn.resources[id] ||= self.new(conn, id)
  end
  
  def self.to_xid (_, obj)
    case obj
    when self
      obj.id
    when Fixnum
      obj.to_i
    else
      raise TypeError, "Can't convert to #{name.split("::")[-1]} XID: #{obj.inspect}"
    end
  end
  
  def initialize (conn, id)
    @conn = conn
    @id = id
  end
  
  def inspect
    "<##{id}>"
  end
  
  def to_i
    @id
  end
  
end

