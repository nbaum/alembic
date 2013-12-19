
class Alembic::XCB::Typedef < Alembic::XCB::Thing
  
  attr_accessor :oldname, :newname
  
  alias name newname
  alias type oldname
  
  def unpackable?
    lookup(oldname).unpackable?
  end
  
  def unpack_format
    lookup(oldname).unpack_format
  end
  
  def unpack_post (expr)
    lookup(oldname).unpack_post(expr)
  end
  
  def unpack_len
    lookup(oldname).unpack_len
  end
  
  def unpack_arguments (expr)
    lookup(oldname).unpack_arguments(expr)
  end
  
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

