
class Alembic::XCB::Value < Alembic::XCB::Thing
  
  attr_accessor :value
  
  def text= (v)
    self.value = v.to_i
  end
  
  def succ
    self.class.new(@xcb).tap do |v|
      v.value = self.value + 1
    end
  end
  
  def to_s
    value.inspect
  end
  
  def compile_length
    value.inspect
  end
  
end

