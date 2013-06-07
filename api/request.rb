module Proto
  
  class Request
    
    def writer
      fields = self.fields
      fields = [Padding.new(1)] if fields.empty? and !Proto.extension
      fields[0, 0] = [Padding.new(2)]
      args = fields.map(&:name).compact.map{|x|x.gsub("class", "klass")}.join(", ")
      rfields = self.reply
      [
        "def #{name.snake_case}_async (#{args})",
        [
          "request do |io|",
          [
            *if Proto.extension
              [
                "io.write_ubyte(extension(#{Proto.xname.inspect}))",
              ]
            else
              []
            end,
            "io.write_ubyte(#{opcode})",
            *fields.flat_map do |field|
              field.write()
            end,
            *if rfields.empty?
              [
                "no_reply"
              ]
            else
              [
                "reply do |io|",
                [
                  "#{name.snake_case}_reply(io)"
                ],
                "end"
              ]
            end
          ],
          "end",
        ],
        "end",
        "",
        * if rfields.empty?
          [
            "def #{name.snake_case} (*args)",
            [
              "#{name.snake_case}_async(*args)"
            ],
            "end",
          ]
        else
          [
            "def #{name.snake_case} (*args)",
            [
              "#{name.snake_case}_async(*args).wait"
            ],
            "end",
            "",
            "def #{name.snake_case}_reply (io)",
            [
              "hash = {}",
              *rfields.flat_map do |field|
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
      ]
    end
    
  end
  
end

