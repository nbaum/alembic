require 'extlib'

module Alembic
  module Xml
    class Record < Element
      
      attr_accessor :fields
      
      def initialize (*args)
        super(*args)
        self.fields ||= []
      end
      
      def add (*nodes)
        self.fields = nodes
      end
      
      def post_process
        params = self.params
        self.fields = fields.flat_map do |field|
          if field.is_a?(ValueParam) && !all_params.member?(field.value_mask_name)
            [Scalar.new(extension, nil, type: field.value_mask_type, name: field.value_mask_name), field]
          else
            [field]
          end
        end
        self
      end
      
      def hidden_params
        @hidden_params ||= begin
          fields.flat_map do |field|
            field.hides
          end
        end
      end
      
      def all_params
        fields.flat_map(&:params).compact
      end
      
      def params
        fields.flat_map(&:params).reject do |field|
           hidden_params.member?(field)
         end.compact
      end
      
      def args
        fields.flat_map(&:args).reject do |field|
           hidden_params.member?(field)
         end.compact
      end
      
      def encoder expr
        "encode_#{var_name.snake_case}(''.encode('BINARY'), *#{expr})"
      end
      
      def decoder
        "decode_#{var_name.snake_case}(s)"
      end
      
      def writer_method
        [
          "def write_#{var_name.snake_case} (#{params.join(", ")})",
          [
            "s = ''.encode('BINARY')",
            "encode_#{var_name.snake_case}(#{['s', *params].join(", ")})",
            "write(s)",
          ],
          "end",
          "",
        ]
      end
      
      def reader_method
        [
          "def read_#{var_name.snake_case} ()",
          [
            "decode_#{var_name.snake_case}(read_packet())",
          ],
          "end",
          "",
        ]
      end
      
      def encoders
        r = []
        format, args = "", []
        fields.each_with_index do |field, i|
          if field.packable?(i == fields.length - 1)
            format += field.pack_format
            args += Array(field.pack_arguments)
          else
            r << "s << [#{args.join(", ")}].pack(#{format.inspect})" unless args.empty?
            format, args = "", []
            r << "s << #{field.encoder}"
          end
        end
        r << "s << [#{args.join(", ")}].pack(#{format.inspect})" unless args.empty?
        r
      end
      
      def decoders
        r = []
        format, args, post, len = "", [], [], 0
        [*fields, nil].each_with_index do |field, i|
          if field && field.unpackable?(i == fields.length - 1)
            format += field.unpack_format
            len += field.unpack_len
            post += Array(field.unpack_post)
            args += Array(field.unpack_arguments)
          else
            unless format.empty?
              if args.empty?
                r << "s.slice!(0, #{len})"
              else
                args = args.join(", ")
                args += "," if args.count("*") == 0
                if len < 1.0 / 0.0
                  r << "#{args} = s.slice!(0, #{len}).unpack(#{format.inspect})"
                else
                  r << "#{args} = s.unpack(#{format.inspect})"
                end
              end
              r += post
            end
            format, args, post, len = "", [], [], 0
            r += Array(field.decoder) if field
          end
        end
        r
      end
      
      def encoder_method ()
        [
          "def encode_#{var_name.snake_case} (#{['s', *params].join(", ")})",
          [
            *fields.flat_map(&:lengther),
            *encoders,
            "s",
          ],
          "end",
          nil,
        ]
      end
      
      def decoder_method ()
        [
          "def decode_#{var_name.snake_case} (s)",
          [
            "x = HashWithMethodMissing.new",
            *decoders,
            "x",
          ],
          "end",
          nil,
        ]
      end
      
    end
  end
end

