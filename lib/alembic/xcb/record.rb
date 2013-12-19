require 'extlib'

module Alembic::XCB::Record
  
  attr_accessor :fields, :real_fields
  
  def initialize (xcb)
    super(xcb)
    self.fields ||= []
  end
  
  def upcast
    params = self.params
    self.fields = fields.flat_map do |field|
      if field.is_a?(Alembic::XCB::ValueParam) && !params.member?(field.value_mask_name)
        [ Alembic::XCB::Scalar.new(xcb).tap{|s|s.type = field.value_mask_type; s.name = field.value_mask_name}, field]
      else
        [field]
      end
    end
    self.real_fields = self.fields.dup
    self
  end
  
  def add (xcb, *nodes)
    nodes.each do |node|
      f = xcb.parse(node)
      self.fields << f if f
    end
  end
  
  def hidden_params
    @hidden_params ||= begin
      fields.flat_map do |field|
        field.hides
      end
    end
  end
  
  def params
    fields.flat_map(&:params).reject do |field|
       hidden_params.member?(field)
     end.compact
  end
  
  def struct_params
    fields.flat_map(&:params).map do |param|
      param.to_sym.inspect
    end
  end
  
  def struct_definition
    [
      "#{var_name} = Struct.new(#{struct_params.join(", ")})",
      ""
    ]
  end
  
  def encoder expr
    "encode_#{var_name.snake_case}(#{expr})"
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
    fields.each_with_index do |field, i|
      if field.unpackable?(i == fields.length - 1)
        format += field.unpack_format
        len += field.unpack_len
        post += Array(field.unpack_post)
        args += Array(field.unpack_arguments)
      else
        unless format.empty?
          if args.empty?
            r << "s.slice!(0, #{len})"
          elsif len < 1.0 / 0.0
            r << "#{args.join(", ")} = s.slice!(0, #{len}).unpack(#{format.inspect})"
          else
            r << "#{args.join(", ")} = s.unpack(#{format.inspect})"
          end
          r += post
        end
        format, args, post, len = "", [], [], 0
        r += Array(field.decoder)
      end
    end
    unless format.empty?
      if args.empty?
        r << "s.slice!(0, #{len})"
      elsif len < 1.0 / 0.0
        r << "#{args.join(", ")} = s.slice!(0, #{len}).unpack(#{format.inspect})"
      else
        r << "#{args.join(", ")} = s.unpack(#{format.inspect})"
      end
      r += post
    end
    r
  end
  
  def encoder_method
    [
      "def encode_#{var_name.snake_case} (#{['s', *params].join(", ")})",
      [
        *fields.flat_map(&:lengther),
        *encoders,
        "s",
      ],
      "end",
      "",
    ]
  end
  
  def decoder_method
    [
      "def decode_#{var_name.snake_case} (s)",
      [
        "x = #{name}.new",
        *decoders,
        "x",
      ],
      "end",
      "",
    ]
  end
  
end

