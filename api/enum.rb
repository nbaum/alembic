module Proto
  
  class Enum
    def generate
      <<EOF
enum #{name} {
  #{values.keys.join(",\n  ")}
};
EOF
    end
  end
  
end

