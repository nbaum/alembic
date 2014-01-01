
module Alembic
  module Generator
    class Pad < Element
      
      attr_accessor :bytes
      
      def unpackable? at_end = false
        bytes ? true : false
      end
      
      def unpack_format
        "x#{bytes}"
      end
      
      def unpack_len
        bytes.to_i
      end
      
      def unpack_post
        []
      end
      
      def unpack_arguments
        []
      end
      
      def packable? at_end = false
        bytes ? true : false
      end
      
      def pack_format
        "x#{bytes}"
      end
      
      def pack_arguments
        []
      end
      
      def name
        nil
      end
      
      def params
        []
      end
      
      def args
        params
      end
      
      def encoder
        if bytes
          (' ' * bytes.to_i).inspect
        else
          "' ' * (-s.length & 3)"
        end
      end
      
      def decoder
        "s.slice!(0, #{bytes || 'raise("Can\'t decode this today")'})"
      end
      
      def lengther
        []
      end
      
    end
  end
end

