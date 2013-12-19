
class Alembic::XCB::EventCopy < Alembic::XCB::Event
  
  attr_accessor :ref
  
  def upcast
    self
  end
  
  def fields
    return [] unless ref
    xcb.things["#{ref}Event"].fields
  end
  
end

