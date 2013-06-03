module Proto
  
  class Prim
    
    def read ()
      ["io.read_#{type.downcase}"]
    end
    
    def write (var)
      ["io.write_#{type.downcase}(#{var.gsub("class", "klass")})"]
    end
    
  end
  
  class Scalar
    
    def read ()
      Proto.resolve_type(type).read()
    end
    
    def write (var = name)
      Proto.resolve_type(type).write(var)
    end
    
  end
  
  class List
    
    def write (var = name)
      case t = Proto.resolve_type(type)
      when "char", "void"
        [
          "io.write(#{var.to_s})"
        ]
      else
        [
          "#{var}.each do |item|",
          t.write("item"),
          "end",
        ]
      end
    end
    
    def read (*args)
      case Proto.resolve_type(type)
      when "char", "void"
        ["io.read(hash[:#{length}])"]
      else
        [
          if Integer === length
            "#{length}.times.map do"
          else
            "hash[:#{length}].times.map do"
          end,
          Proto.resolve_type(type).read(*args),
          "end"
        ]
      end
    end
    
  end
  
  class Padding
    
    def argument
      []
    end
    
    def name
      nil
    end
    
    def write (var = nil)
      "io.write(#{("\0" * length).inspect})"
    end
    
    def read
      ["io.skip(#{length})"]
    end
    
  end
  
end
