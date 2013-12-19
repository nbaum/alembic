
class Alembic::XCB::Error < Alembic::XCB::Thing
  attr_accessor :name, :number
  include Alembic::XCB::Record
  def name= v
    @name = "#{v}Error"
  end
end

