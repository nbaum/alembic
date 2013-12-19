
class Alembic::XCB::List < Alembic::XCB::Thing
  
  attr_accessor :name, :type, :length, :enum
  
  def unpackable? at_end = false
    at_end and %w"uint CARD32".member?(lookup(type).type)
  end
  
  def unpack_format
    lookup(type).unpack_format + "*"
  end
  
  def unpack_len
    1.0 / 0.0
  end
  
  def unpack_post
    expr = lookup(type).unpack_post(nil)
    if expr.empty?
      []
    else
      ["x.#{name} = x.#{name} ? x.#{name}.map{|x|#{expr}} : []"]
    end
  end
  
  def unpack_arguments
    "*x.#{name}"
  end
  
  def packable? at_end = false
    at_end and lookup(type).packable?
  end
  
  def pack_format
    lookup(type).pack_format + "*"
  end
  
  def pack_arguments
    "*#{name}"
  end
  
  def params
    [name]
  end
  
  def add (xcb, node)
    self.length = xcb.parse(node)
  end
  
  def upcast
    if type == "char" || type == "void" || type == "BYTE"
      s = Alembic::XCB::String.new(xcb)
      s.name = name
      s.length = length
      s
    else
      super
    end
  end
  
  def encoder
    e = lookup(type).encoder("x")
    "#{name}.map{|x|#{e}}"
  end
  
  def decoder
    "x.#{name} = #{length.compile_length}.times.map{#{lookup(type).decoder}}"
  end
  
  def lengther
    if length.is_a?(Alembic::XCB::FieldRef)
      [
        "#{length.name} = #{name}.length"
      ]
    else
      []
    end
  end
  
  def hides
    if length.is_a?(Alembic::XCB::FieldRef)
      [length.name]
    else
      []
    end
  end
  
end

