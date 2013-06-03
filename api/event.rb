
module Proto
  
  class Event
    
    def reader
      fields = self.fields
      [
        "def decode_#{name.snake_case}_event (string)",
        [
          "io = Alembic::XIO.new(string)",
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
    
    def writer
      fields = self.fields
      fields = [Padding.new(1)] if fields.empty?
      fields[1,0] = [Padding.new(2)]
      args = fields.map(&:name).compact.join(", ")
      [
        "def encode_#{name.snake_case}_event (hash = {})",
        [
          "io = Alembic::XIO.new",
          "io.write_ubyte(#{number})",
          *fields.flat_map do |field|
            if field.name
              field.write("hash[:#{field.name}]")
            else
              field.write
            end
          end,
          "io.string",
        ],
        "end",
        "",
      ]
    end
    
  end
  
end

