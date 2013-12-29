
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
      
      def compile_comments
        [
          "#{var_name.snake_case} (#{params.join(", ")})"
        ]
      end
      
      def selfs
        fields.flat_map do |field|
          if field.respond_to?(:self) and field.self
            [field]
          else
            []
          end
        end
      end
      
      def creates
        fields.each do |field|
          if field.respond_to?(:create) and field.create
            return field.name
          end
        end
        nil
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
              "send_request(s) do |s|",
              reply.compile,
              "end"
            ] : creates ? [
              "send_request(s, #{creates})"
            ] : [
              "send_request(s)"
            ]
          ],
          "end",
          nil,
          "def #{var_name.snake_case} (#{params.join(", ")})",
          [
            *reply ? [
              "#{var_name.snake_case}!(#{args.join(", ")}).wait.value"
            ] : [
              "#{var_name.snake_case}!(#{args.join(", ")}).value"
            ]
          ],
          "end",
          nil
        ]
      end
      
      def compile_class_methods
        selfs.flat_map do |field|
          [
            "class #{lookup(field.type).extension.extension_name || 'Xproto'}::#{lookup(field.type).class_name}",
            [
              "def #{var_name.snake_case} (#{params.-([field.name]).join(", ")})",
              [
                "connection.#{var_name.snake_case}(#{args.map{|x|x == field.name ? 'self' : x}.join(", ")})"
              ],
              "end"
            ],
            "end",
            nil
          ]
        end
      end
      
      def compile_methods
        caller_method
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
          "x = {}",
          *decoders,
          self.return ? "x[:#{self.return}]" : "x",
        ]
      end
      
    end
  end
end

