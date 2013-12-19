
class Alembic::XCB::String < Alembic::XCB::Thing
  
  attr_accessor :name, :length
  
  def packable? at_end = false
    true
  end
  
  def pack_format
    "A*"
  end
  
  def pack_arguments
    name
  end
  
  def params
    [name]
  end
  
  def encoder
    [
      name,
    ]
  end
  
  def decoder
    len = length.compile_length
    [
      "x.#{name} = s.slice!(0, #{len})",
    ]
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

