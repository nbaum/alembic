require 'ox'

class Ox::Element
  def to_s (indent = "")
    s = ""
    s += indent
    s += "#{name}"
    attributes.each do |name, value|
      s += " #{name}=#{value.inspect}"
    end
    locate("^Text").each do |node|
      s += " " + node.inspect
    end
    locate("^Element").each do |node|
      s += "\n" + node.to_s(indent + "  ")
    end
    s
  end
end

