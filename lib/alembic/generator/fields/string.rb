
module Alembic
  module Generator
    class String < Element
      
      attr_accessor :name, :length, :type
      
      def packable? at_end = false
        true
      end
      
      def pack_format
        "A*"
      end
      
      def pack_arguments
        "pad(#{name})"
      end
      
      def params
        [name]
      end
      
      def args
        params
      end
      
      def encoder
        [
          name,
        ]
      end
      
      def decoder
        len = length.compile_length
        [
          "x[:#{name}] = s.slice!(0, #{len})",
        ]
      end
      
      def lengther
        if length.is_a?(FieldRef)
          if type == "CHAR2B"
            [
              "#{name} = #{name}.encode('UTF-16BE').force_encoding('BINARY')",
              "#{length.name} = #{name}.bytesize / 2"
            ]
          else
            [
              "#{name} = #{name}.force_encoding('BINARY')",
              "#{length.name} = #{name}.bytesize"
            ]
          end
        else
          []
        end
      end
      
      def hides
        if length.is_a?(FieldRef)
          [length.name]
        else
          []
        end
      end
      
    end
  end
end

