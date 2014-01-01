
module Alembic
  module Generator
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
          "def encode_#{var_name.snake_case}_hash (hash)",
          [
            *params.map do |param|
              "#{param} = hash[:#{param}]"
            end,
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
          "self.events << [#{number}, #{var_name.snake_case.inspect}, #{no_sequence_number == 'true'}]",
        ]
      end
      
      def compile_methods
        encoder_method +
        decoder_method
      end
      
    end
  end
end

