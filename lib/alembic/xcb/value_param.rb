
class Alembic::XCB::ValueParam < Alembic::XCB::List
  
  attr_accessor :value_mask_type, :value_mask_name, :value_list_name, :enum
  
  def type
    "CARD32"
  end
  
  alias name value_list_name
  
  def lengther
    []
  end
  
end

