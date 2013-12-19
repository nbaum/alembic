
class Alembic::XCB::Request < Alembic::XCB::Thing
  
  attr_accessor :name, :opcode, :combine_adjacent, :reply, :this
  
  include Alembic::XCB::Record
  
  def upcast
    reply.name = "#{name}Reply" if reply
    super
  end
  
  def add (xcb, *nodes)
    reply, fields = nodes.partition do |node|
      node.name == "reply"
    end
    super(xcb, *fields)
    self.reply = xcb.parse(reply[0]) unless reply.empty?
  end
  
  def struct_args
    fields.map(&:name).compact.map{|n|":#{n}"}
  end
  
  def encoder_method
    r = super
    r[1][0, 0] = "s << #{opcode}"
    r[1][-1, 0] = [
      "s << ' ' * (-(s.length + 2) & 3)",
      "s[2, 0] = [(s.length + 2) / 4].pack('S')",
    ]
    r
  end
  
  def caller_method
    [
      "def #{var_name.snake_case} (#{params.join(", ")})",
      [
        "s = #{opcode}.chr.encode('BINARY')",
        *fields.flat_map(&:lengther),
        *encoders,
        "s << ' ' * (-(s.length + 2) & 3)",
        "s[2, 0] = [(s.length + 2) / 4].pack('S')",
        "write(s)",
        "connection.seq += 1",
      ] + (reply ? [
        *reply.compile
      ] : []),
      "end",
      "",
    ]
  end
  
  def this_field
    return nil unless this
    real_fields.each do |field|
      return field if field.name == this
    end
    return
  end
  
  def this_method
    [
      "class #{this_field.type.capitalize}",
      [
        "def #{var_name.snake_case} (#{params.reject{|x|x==this}.join(", ")})",
        [
          "@conn.#{var_name.snake_case}(#{params.map{|x|x==this ? "self" : x}.join(", ")})"
        ],
        "end",
      ],
      "end",
      "",
    ]
  end
  
  def compile
    (reply ? reply.struct_definition : []) + caller_method + (this_field ? this_method : [])
  end
  
end

