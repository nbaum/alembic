
class Alembic::XCB::Struct < Alembic::XCB::Thing
  
  attr_accessor :name
  
  alias type name
  
  include Alembic::XCB::Record
  
  def compile
    struct_definition +
    encoder_method +
    decoder_method
  end
  
end

