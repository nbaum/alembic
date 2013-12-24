
module Alembic
  module Xml
    class Event < Record
      attr_accessor :name, :number, :no_sequence_number, :xge
      
      def post_process
        f = Alembic::Xml::Scalar.new(extension, nil, name: "synthetic", type: "BOOL")
        fields << f
        self
      end
      
      def name= (name)
        @name = "#{name}Event"
      end
      
      def struct_name
        "#{var_name.to_const_string}"
      end
      
      def struct_definition
        [
          "#{struct_name} = Struct.new(#{struct_params.join(", ")})",
          nil
        ]
      end
      
      def encoders
        r = []
        format, args = "", []
        fields[0..-2].each_with_index do |field, i|
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
          "module Methods",
          [
            "def encode_#{var_name.snake_case} (#{params[0..-2].join(", ")})",
            [
              "s = #{number}.chr.encode('BINARY')",
              *fields[0..-2].flat_map(&:lengther),
              *encoders,
              's = s.ljust(30, "\\0")',
              's[2, 0] = "\\0\\0"',
              "s",
            ],
            "end",
          ],
          "end",
          nil,
        ]
      end
      
      def compile
        [
          *struct_definition,
          "define_event #{number}, :#{var_name.snake_case}, #{no_sequence_number == 'true'}",
          nil,
          *encoder_method,
          *decoder_method
        ]
      end
      
    end
  end
end

