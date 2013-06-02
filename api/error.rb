module Proto
  
  class Error
    def generate
      <<EOF
struct #{name}Error {
  #{fields.map(&:generate).join("\n  ")}
};
EOF
    end
  end
  
end

