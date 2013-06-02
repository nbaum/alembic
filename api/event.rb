
module Proto
  
  class Event
    def generate
      fields = self.fields
      fields = [Padding.new(1)] if fields.empty?
      fields[1,0] = [Padding.new(2)]
      targets = fields.map(&:argument).compact
      format = fields.map(&:format).join
      [
        "def encode_#{name.snake_case}_event (hash)",
        [
          "format = #{("C" + format).inspect}",
          "args = [#{number}, #{targets.map{|t|"hash[:#{t}]"}.join(", ")}]",
          "args.pack(format)"
        ],
        "end",
        "",
        "def decode_#{name.snake_case}_event (string)",
        [
          "format = #{format.inspect}",
          "#{targets.join(", ")} = string.unpack(format)",
          "{",
          targets.map do |t|
            "#{t}: #{t},"
          end,
          "}",
          #"io = StringIO.new(string)",
          #"hash = {}",
          #*fields.flat_map(&:io_to_hash).compact
        ],
        "end",
        "",
        "register_event #{number}, :#{name.snake_case}",
      ]
    end
  end
  
end

