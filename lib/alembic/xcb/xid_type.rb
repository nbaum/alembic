
class Alembic::XCB::XidType < Alembic::XCB::Primitive
  
  attr_accessor :name
  
  def class_name
    name.capitalize
  end
  
  def pack_arguments (expr)
    "#{class_name}.to_xid(connection, #{expr})"
  end
  
  def type
    "uint"
  end
  
  def encoder expr
    super(pack_arguments(expr))
  end
  
  def decoder
    "#{class_name}[connection, #{super}]"
  end
  
  def compile
    [
      "#{class_name} = Class.new(#{(@@supertypes[name] || 'Resource').capitalize})"
    ]
  end
  
  def add (xcb, *subtypes)
    @@supertypes ||= {}
    subtypes.each do |subtype|
      @@supertypes[subtype.text] = name
    end
  end
  
end

