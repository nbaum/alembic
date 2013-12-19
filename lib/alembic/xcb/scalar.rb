
class Alembic::XCB::Scalar < Alembic::XCB::Thing
  
  attr_accessor :name, :type, :enum, :mask, :altenum
  
  def upcast
    self.name = "klass" if name == "class"
    self
  end
  
  def unpackable? at_end = false
    lookup(type).unpackable?
  end
  
  def unpack_format
    lookup(type).unpack_format
  end
  
  def unpack_post
    lookup(type).unpack_post(name)
  end
  
  def unpack_len
    lookup(type).unpack_len
  end
  
  def unpack_arguments
    lookup(type).unpack_arguments(name)
  end
  
  def packable? at_end = false
    lookup(type).packable?
  end
  
  def pack_format
    lookup(type).pack_format
  end
  
  def pack_arguments
    lookup(type).pack_arguments(name)
  end
  
  def params
    [name]
  end
  
  def encoder
    lookup(type).encoder(name)
  end
  
  def decoder
    "x.#{name} = #{lookup(type).decoder}"
  end
  
  def lengther
    []
  end
  
end

