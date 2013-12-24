
module Alembic
  module Xml
    class List < Element
      
      attr_accessor :name, :type, :length, :enum
      
      def post_process
        if type == "char" || type == "void" || type == "BYTE"
          Alembic::Xml::String.new(extension, nil, name: name, length: length)
        else
          super
        end
      end
      
      def add (node)
        self.length = node
      end
      
      def unpackable? at_end = false
        at_end and %w"uint CARD32".member?(lookup(type).type)
      end
      
      def unpack_format
        lookup(type).unpack_format + "*"
      end
      
      def unpack_len
        1.0 / 0.0
      end
      
      def unpack_post
        expr = lookup(type).unpack_post(nil)
        if expr.empty?
          []
        else
          ["x.#{name} = x.#{name} ? x.#{name}.map{|x|#{expr}} : []"]
        end
      end
      
      def unpack_arguments
        "*x.#{name}"
      end
      
      def packable? at_end = false
        at_end and lookup(type).packable?
      end
      
      def pack_format
        lookup(type).pack_format + "*"
      end
      
      def pack_arguments
        "*#{name}"
      end
      
      def params
        [name]
      end
      
      def encoder
        e = lookup(type).encoder("x")
        "#{name}.map{|x|#{e}}"
      end
      
      def decoder
        if lookup(type).type == "CARD8"
          "x.#{name} = s.slice!(0..#{length.compile_length}).unpack('C*')"
        elsif lookup(type).type == "CARD16"
          "x.#{name} = s.slice!(0..2*(#{length.compile_length})).unpack('S*')"
        elsif lookup(type).type == "CARD32"
          "x.#{name} = s.slice!(0..4*(#{length.compile_length})).unpack('L*')"
        else
          "x.#{name} = #{length.compile_length}.times.map{#{lookup(type).decoder}}"
        end
      end
      
      def lengther
        if length.is_a?(Alembic::Xml::FieldRef)
          [
            "#{length.name} = #{name}.length"
          ]
        else
          []
        end
      end
      
      def hides
        if length.is_a?(Alembic::Xml::FieldRef)
          [length.name]
        else
          []
        end
      end
      
    end
  end
end

