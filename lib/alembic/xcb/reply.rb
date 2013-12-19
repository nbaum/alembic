
class Alembic::XCB::Reply < Alembic::XCB::Thing
  
  attr_accessor :name, :return
  
  include Alembic::XCB::Record
  
  def decoder_method
    [
      "s = read_reply(connection.seq)",
      "x = #{name}.new",
      *decoders,
      self.return ? "x.#{self.return}" : "x",
    ]
  end
  
  def compile
    decoder_method
  end
  
end

