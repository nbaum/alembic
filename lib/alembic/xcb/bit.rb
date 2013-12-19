
class Alembic::XCB::Bit < Alembic::XCB::Thing
  
  attr_accessor :value
  
  def text= (v)
    self.value = 1 << v.to_i
  end
  
  def to_s
    value.inspect
  end
  
end

