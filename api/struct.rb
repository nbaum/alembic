module Proto
  
  class Struct
    
    def reader
      fields = self.fields
      [
        "def read_#{name.snake_case} (io)",
        [
          "hash = {}",
          *fields.flat_map do |field|
            if field.name
              a = field.read()
              ["hash[:#{field.name}] = #{a[0]}", *a[1..-1]]
            else
              field.read()
            end
          end,
          "hash",
        ],
        "end",
      ]
    end
    
    def read
      [
        "{}.tap do |hash|",
        fields.flat_map do |field|
          if field.name
            a = field.read()
            ["hash[:#{field.name}] = #{a[0]}", *a[1..-1]]
          else
            field.read()
          end
        end,
        "end"
      ]
    end
    
    def write (var)
      fields.flat_map do |field|
        if field.name
          field.write("#{var}[:#{field.name}]")
        else
          field.write(nil)
        end
      end
    end
    
  end
  
  class Union
    
    def read
      [
        "wildcat do",
        [
          "{}.tap do |hash|",
          fields.flat_map do |field|
            if field.name
              a = field.read()
              ["hash[:#{field.name}] = #{a[0]}", *a[1..-1]]
            else
              field.read()
            end
          end,
          "end"
        ],
        "end",
      ]
    end
    
    def write (var)
      [
        "wildcat do",
        fields.flat_map do |field|
          if field.name
            field.write("#{var}[:#{field.name}]")
          else
            field.write(nil)
          end
        end,
        "end",
      ]
    end
    
  end
  
end

