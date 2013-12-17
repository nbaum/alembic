
class Alembic::XCB::Typedef < Alembic::XCB::Thing
  
  attr_accessor :oldname, :newname
  
  alias name newname
  alias type oldname
  
  def packable?
    lookup(oldname).packable?
  end
  
  def pack_format
    lookup(oldname).pack_format
  end
  
  def pack_arguments (expr)
    lookup(oldname).pack_arguments(expr)
  end
  
  def encoder expr
    lookup(oldname).encoder(expr)
  end
  
  def decoder
    lookup(oldname).decoder
  end
  
end

