
module Alembic
  module Xml
    class Event < Record
      attr_accessor :name, :number, :no_sequence_number, :xge
      
      def name= (name)
        @name = "#{name}Event"
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
      
      def encoder_method ()
        [
          "def encode_#{var_name.snake_case} (#{params.join(", ")})",
          [
            "s = #{number}.chr.encode('BINARY')",
            *fields.flat_map(&:lengther),
            *encoders,
            's = s.ljust(30, "\\0")',
            's[2, 0] = "\\0\\0"',
            "s",
          ],
          "end",
          nil,
        ]
      end
      
      def compile_comments
        [
          "#{var_name.snake_case} (#{params.join(", ")})"
        ]
      end
      
      def compile_constants
        [
          "define_event #{number}, :#{var_name.snake_case}, #{no_sequence_number == 'true'}",
        ]
      end
      
      def struct_definition
        [
          "class #{class_name} < Struct.new(#{struct_params.map{|x|':' + x}.join(", ")})",
          [
            "def event_type",
            [
              ":#{var_name.snake_case}"
            ],
            "end"
          ],
          "end",
          nil
        ]
      end
      
      def struct_params
        fields.flat_map(&:params).compact + ["synthetic"]
      end
      
      def compile_methods
        struct_definition +
        encoder_method +
        decoder_method
      end
      
    end
  end
end

