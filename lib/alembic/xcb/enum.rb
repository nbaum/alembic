
class Alembic::XCB::Enum < Alembic::XCB::Thing
  
  attr_accessor :name, :values
  
  def add (xcb, *nodes)
    self.values ||= {}
    lv = -1
    nodes.each do |node|
      next unless node.name == 'item'
      v = node.locate("^Element")[0]
      case v && v.name
      when nil
        v = lv + 1
      when 'bit'
        v = 1 << v.text.to_i
      when 'value'
        v = v.text.to_i
      end
      self.values[node['name']] = v
      lv = v if v
    end
  end
  
  def compile
    [
      *values.map do |name, value|
        const_name = "#{var_name}_#{name}".snake_case.upcase
        "Alembic::Enumerants::#{const_name} = #{value}"
      end,
      ""
    ]
  end
  
end

