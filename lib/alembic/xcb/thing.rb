
class Alembic::XCB::Thing
  
  attr_accessor :xcb
  
  def initialize (xcb)
    @xcb = xcb
  end
  
  def packable? at_end = false
    false
  end
  
  def upcast
    self
  end
  
  def compile
    []
  end
  
  def hides
    []
  end
  
  def var_name
    if xcb.extension_name
      xcb.extension_name + name
    else
      name
    end
  end
  
  def lookup name
    xcb.lookup(name) || raise(name.inspect)
  end
  
end

