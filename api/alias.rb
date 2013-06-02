module Proto
  class Alias
    def generate
      "typedef #{base} #{name};"
    end
  end
end

