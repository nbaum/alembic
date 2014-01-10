
module Alembic
  module Generator
    class Primitive < Element
      attr_accessor :type
      
      def initialize (ext, node)
        super(ext, node)
      end
      
      def self.setup_types (extension)
        e = extension
        %w"BOOL BYTE CARD8 CARD16 CARD32 INT8 INT16 INT32 float double".each do |name|
          e.items[name] = Primitive.new(self, nil).tap{|p|p.type = name}
        end
      end
      
      def unpackable?
        true
      end
      
      def unpack_format
        pack_format
      end
      
      def unpack_len
        {
          "BOOL"   => 1,
          "BYTE"   => 1,
          "CARD8"  => 1,
          "CARD16" => 2,
          "CARD32" => 4,
          "INT8"   => 1,
          "INT16"  => 2,
          "INT32"  => 4,
          "float"  => 4,
          "double" => 8,
        }[type] || raise(type.inspect)
      end
      
      def unpack_arguments (expr)
        "x[:#{expr}]"
      end
      
      def unpack_post (expr)
        {
          "BOOL"   => ["x[:#{expr}] = x[:#{expr}] != 0"],
        }[type] || []
      end
      
      def packable?
        true
      end
      
      def pack_format
        {
          "BOOL"   => "C",
          "BYTE"   => "C",
          "CARD8"  => "C",
          "CARD16" => "S",
          "CARD32" => "L",
          "INT8"   => "c",
          "INT16"  => "s",
          "INT32"  => "l",
          "float"  => "F",
          "double" => "D"
        }[type] || raise(type.inspect)
      end
      
      def pack_arguments (expr)
        {
          "BOOL"   => "#{expr} ? 1 : 0",
        }[type] || expr
      end
      
      def packer expr, type
        "[#{expr}].pack(#{type.inspect})"
      end
      
      def unpacker type, len
        "s.slice!(0, #{len}).unpack(#{type.inspect})[0]"
      end
      
      def encoder expr
        packer(pack_arguments(expr), pack_format)
      end
      
      def decoder
        unpacker(unpack_format, unpack_len)
      end
      
    end
  end
end

