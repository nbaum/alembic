module Proto
  
  class Scalar
    
    def generate
      "#{type} #{name};"
    end
    
    def argument
      "#{name}"
    end
    
    def format
      case t = Proto.resolve_type(type)
      when "INT8", "BOOL"
        "C"
      when "CARD8", "BYTE"
         "C"
      when "INT16"
        "s"
      when "CARD16"
        "S"
      when "INT32"
        "l"
      when "CARD32", "ID"
        "L"
      else
        "!{#{t}}"
      end
    end
    
    def cat_to_str var = ""
      name = "#{var}#{self.name}"
      case t = Proto.resolve_type(type)
      when "INT8", "BOOL", "CARD8", "BYTE"
        ["target << #{name}.chr"]
      when "INT16", "CARD16"
        ["target << [#{name}].pack('S')"]
      when "INT32", "CARD32", "ID"
        ["target << [#{name}].pack('L')"]
      else
        type = Proto.resolve_type(self.type)
        type.cat_to_str(name)
      end
    end
    
    def io_to_hash var = ""
      name = "#{var}#{self.name}"
      case t = Proto.resolve_type(type)
      when "BOOL"
        ["hash[:#{name}] = io.read(1) != \"\\x00\""]
      when "INT8"
        ["hash[:#{name}] = io.read(1).unpack('c')[0]"]
      when "CARD8", "BYTE"
        ["hash[:#{name}] = io.read(1).unpack('C')[0]"]
      when "INT16"
        ["hash[:#{name}] = io.read(2).unpack('s')[0]"]
      when "CARD16"
        ["hash[:#{name}] = io.read(2).unpack('S')[0]"]
      when "INT32"
        ["hash[:#{name}] = io.read(4).unpack('l')[0]"]
      when "CARD32", "ID"
        ["hash[:#{name}] = io.read(4).unpack('L')[0]"]
      else
        type = Proto.resolve_type(self.type)
        type.cat_to_str(name)
      end
    end
    
  end
  
  class List
    
    def generate
      "#{type} #{name}[#{length}];"
    end
    
    def argument
      "#{name}"
    end
    
    def format
      case t = Proto.resolve_type(type)
      when "INT8", "BOOL", "CARD8", "BYTE"
        "C*"
      when "INT16", "CARD16"
        "S*"
      when "INT32", "CARD32", "ID", "VALUE"
        "L*"
      when "char", "void"
        "a*"
      else
        t.format
      end
    end
    
  end
  
  class Padding
    
    def generate
      "char [#{length}];"
    end
    
    def argument
    end
    
    def format
      "x#{length}"
    end
    
    def cat_to_str var = ""
      ["target << \"#{"\\x00" * length}\""]
    end
    
    def io_to_hash var = ""
      "io.read(#{length})"
    end
    
  end
  
end
