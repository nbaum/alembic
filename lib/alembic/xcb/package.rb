
class Alembic::XCB::Package < Alembic::XCB::Thing
  
  attr_accessor :fields
  
  def initialize (_)
    self.fields ||= []
  end
  
  def lengther
    fields.flat_map(&:lengther)
  end
  
  def hides
    fields.flat_map(&:hides)
  end
  
  def params
    fields.flat_map(&:params)
  end
  
  def decoder
    fields.flat_map(&:decoder)
  end
  
  def decoder
    formats = fields.map(&:pack_format)
    arguments = fields.flat_map(&:pack_arguments)
    "[#{arguments.join(", ")}].pack(#{formats.join.inspect})"
  end
  
  def encoder
    formats = fields.map(&:pack_format)
    arguments = fields.flat_map(&:pack_arguments)
    "[#{arguments.join(", ")}].pack(#{formats.join.inspect})"
  end
  
  def add field
    fields << field
  end
  
end

