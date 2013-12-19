
class Alembic::XCB::Import < Alembic::XCB::Thing
  
  attr_accessor :text
  
  def name
    text
  end
  
  def upcast
    xcb.imports << xcb.set.load(text)
    nil
  end
  
end

