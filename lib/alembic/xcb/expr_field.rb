
class Alembic::XCB::ExprField < Alembic::XCB::Thing
  
  attr_accessor :name, :type, :expr
  
  def add (xcb, node)
    self.expr = xcb.parse(node)
  end
  
  def lengther
    []
  end
  
  def params
    []
  end
  
  def encoder
    lookup(type).encoder(expr)
  end
  
end

