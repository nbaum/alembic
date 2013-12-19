
class Alembic::XCB::Primitive < Alembic::XCB::Thing
  
  attr_accessor :type
  
  def initialize (xcb, type = nil)
    super(xcb)
    @type = type
  end
  
  def unpackable?
    true
  end
  
  def unpack_format
    pack_format
  end
  
  def unpack_len
    {
      "bool"   => 1,
      "ubyte"  => 1,
      "ushort" => 2,
      "uint"   => 4,
      "byte"   => 1,
      "short"  => 2,
      "int"    => 4
    }[type] || raise(type)
  end
  
  def unpack_arguments (expr)
    "x.#{expr}"
  end
  
  def unpack_post (expr)
    {
      "bool"   => ["x.#{expr} = x.#{expr} != 0"],
    }[type] || []
  end
  
  def packable?
    true
  end
  
  def pack_format
    {
      "bool"   => "C",
      "ubyte"  => "C",
      "ushort" => "S",
      "uint"   => "L",
      "byte"   => "c",
      "short"  => "s",
      "int"    => "l"
    }[type] || raise(type)
  end
  
  def pack_arguments (expr)
    {
      "bool"   => "#{expr} ? 1 : 0",
    }[type] || expr
  end
  
  def packer expr, type
    "[#{expr}].pack(#{type.inspect})"
  end
  
  def unpacker type, len
    "s.slice!(0, #{len}).unpack(#{type.inspect})[0]"
  end
  
  def encoder expr
    case type
    when "bool"
      packer("#{expr} ? 1 : 0", 'C')
    when "ubyte"
      packer(expr, 'C')
    when "ushort"
      packer(expr, 'S')
    when "uint"
      packer(expr, 'L')
    when "byte"
      packer(expr, 'c')
    when "short"
      packer(expr, 's')
    when "int"
      packer(expr, 'l')
    else
      raise type
    end
  end
  
  def decoder
    case type
    when "bool"
      unpacker('C', 1)
    when "ubyte"
      unpacker('C', 1)
    when "ushort"
      unpacker('S', 2)
    when "uint"
      unpacker('L', 4)
    when "byte"
      unpacker('c', 1)
    when "short"
      unpacker('s', 2)
    when "int"
      unpacker('l', 4)
    else
      raise type
    end
  end
  
end

