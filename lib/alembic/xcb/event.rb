
class Alembic::XCB::Event < Alembic::XCB::Thing
  
  attr_accessor :name, :number, :no_sequence_number
  
  include Alembic::XCB::Record
  
  def upcast
    f = Alembic::XCB::Scalar.new(xcb).tap do |s|
      s.name = "synthetic"
      s.type = "BOOL"
    end
    fields << f
    self
  end
  
  def name= (name)
    @name = "#{name}Event"
  end
  
  def compile
    [
      *struct_definition,
      "Alembic::X11.register_event(#{number}, :decode_#{var_name.snake_case}, #{(no_sequence_number != nil).inspect})",
      "",
      *decoder_method,
    ]
  end
  
end

