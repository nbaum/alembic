
module Alembic
  module Xml
    class Request < Record
      
      attr_accessor :name, :opcode, :combine_adjacent, :reply
      
      def post_process
        reply.name = "#{name}Reply" if reply
        super
      end
      
      def add (*nodes)
        reply, fields = nodes.partition do |node|
          Reply === node
        end
        super(*fields)
        self.reply = reply[0] unless reply.empty?
      end
      
      def struct_args
        fields.map(&:name).compact.map{|n|":#{n}"}
      end
      
      def caller_method
        [
          "module Methods",
          [
            "def #{var_name.snake_case}! (#{params.join(", ")})",
            [
              *extension.extension_xname ? [
                "s = opcodes[#{extension.extension_xname.inspect}].chr.encode('BINARY')",
                "s << #{opcode}"
              ] : [
                "s = #{opcode}.chr.encode('BINARY')",
              ],
              *fields.flat_map(&:lengther),
              *encoders,
              *reply ? [
                "send_request(s) do |s|",
                reply.compile,
                "end"
              ] : [
                "send_request(s)"
              ]
            ],
            "end",
            nil,
            "def #{var_name.snake_case} (#{params.join(", ")})",
            [
              "#{var_name.snake_case}!(#{params.join(", ")}).wait"
            ],
            "end",
          ],
          "end",
          nil
        ]
      end
      
      def compile
        (reply ? reply.struct_definition : []) + caller_method
      end
      
    end
  end
end

module Alembic
  module Xml
    class Reply < Record
      
      attr_accessor :name, :return
      
      def post_process
        if params.length == 1
          self.return = params[0]
        end
        self
      end
      
      def compile
        [
          "x = #{var_name}.new",
          *decoders,
          self.return ? "x.#{self.return}" : "x",
        ]
      end
      
    end
  end
end
