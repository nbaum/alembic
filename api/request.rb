module Proto
  
  class Request
    def generate
      fields = self.fields
      fields = [Padding.new(1)] if fields.empty?
      fields[1,0] = [Padding.new(2)]
      [
        "def #{name.snake_case}_request (#{["target", *fields.map(&:argument)].compact.join(", ")})",
        [
          "target << \"\\x%02d\"" % [opcode],
          *fields.flat_map(&:cat_to_str).compact
        ],
        "end"
      ]
    end
    def generate
      fields = self.fields
      fields = [Padding.new(1)] if fields.empty?
      fields[1,0] = [Padding.new(2)]
      targets = fields.map(&:argument).compact
      format = fields.map(&:format).join
      rfields = self.reply
      rfields = [Padding.new(1)] if rfields.empty?
      rfields[1,0] = [Padding.new(2)]
      rtargets = rfields.map(&:argument).compact
      rformat = rfields.map(&:format).join
      a = [
        "def #{name.snake_case} (#{targets.join(", ")})",
        [
          "args = [#{opcode}, #{targets.join(", ")}]",
          "request(args.pack(#{("C" + format).inspect}))",
          *if self.reply.empty?
            []
          else
            [
              "#{rtargets.join(", ")} = reply.unpack(#{rformat.inspect})",
              "{",
              rtargets.map do |t|
                "#{t}: #{t},"
              end,
              "}",
            ]
          end
        ],
        "end",
      ]
    end
  end
  
end

