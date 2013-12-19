
class Alembic::XCB::Op < Alembic::XCB::Thing
  
  attr_accessor :op, :left, :right
  
  def add (xcb, left, right)
    self.left = xcb.parse(left)
    self.right = xcb.parse(right)
  end
  
  def to_s
    "(#{left}#{op}#{right})"
  end
  
  def compile_length
    "(#{left.compile_length}#{op}#{right.compile_length})"
  end
  
end

