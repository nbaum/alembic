
module Alembic
  module Generator
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
      
      def compile_comments
        [
          "#{var_name.snake_case} (#{params.join(", ")})"
        ]
      end
      
      def caller_method
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
              "send_request(s, :#{var_name.snake_case}, true)",
            ] : [
              "send_request(s, :#{var_name.snake_case}, false)"
            ]
          ],
          "end",
          nil,
          "def #{var_name.snake_case} (#{params.join(", ")})",
          [
            *reply ? [
              "#{var_name.snake_case}!(#{args.join(", ")}).wait"
            ] : [
              "#{var_name.snake_case}!(#{args.join(", ")}).abandon"
            ]
          ],
          "end",
          nil
        ]
      end
      
      def compile_methods
        [
          *caller_method,
          nil,
          *reply ? reply.compile : []
        ]
      end
      
    end
    
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
          "def #{var_name.snake_case} (s)",
          [
            "x = {}",
            *decoders,
            self.return ? "x[:#{self.return}]" : "x",
          ],
          "end",
          ""
        ]
      end
      
    end
  end
end

