module Proto
  
  class Struct
    
    def generate
      <<EOF
struct #{name} {
  #{fields.map(&:generate).join("\n  ")}
};
EOF
    end
    
    def format
      "[#{fields.map(&:format).join}]"
    end
    
    def cat_to_str var
      fields.flat_map do |field|
        field.cat_to_str "#{var}."
      end
    end
    
  end
  
  class Union
    
    def generate
      <<EOF
union #{name} {
  #{fields.map(&:generate).join("\n  ")}
};
EOF
    end
    
    def cat_to_str var
      [
        "deunionize do",
        fields.flat_map do |field|
          field.cat_to_str "#{var}."
        end,
        "end"
      ]
    end
    
  end
  
end

