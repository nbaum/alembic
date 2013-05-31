require 'nokogiri'
require 'extlib'
require 'strscan'

class Array
  
  def x_pack! format, r = "".encode("BINARY")
    s = StringScanner.new(format)
    until s.eos? || empty?
      case
      when s.scan(/p(\d*)/)
        r << "\0" * $1.to_i
      when s.scan(/C/)
        r << pop.to_i.chr
      when s.scan(/S/)
        r << [pop.to_i].pack("S>")
      when s.scan(/s/)
        r << [pop.to_i].pack("s>")
      when s.scan(/L/)
        r << [pop.to_i].pack("L>")
      when s.scan(/l/)
        r << [pop.to_i].pack("l>")
      when s.scan(/a/)
        r << pop.to_s
      when s.scan(/A/)
        str = pop.to_s
        r << str.bytesize.chr << str
      when s.scan(/(?<re>\[(?:[^\[\]+]|\g<re>)+\])/)
        as = pop.reverse
        until as.empty?
          as.x_pack!(s.matched[1..-2], r)
        end
      when s.scan(/ /)
      else
        "Boom"
      end
    end
    r
  end
  
  def x_pack format
    reverse.x_pack! format
  end
  
end

module Proto
  
  @things = things = {}
  
  Struct  = ::Struct.new(:name, :fields)
  Scalar  = ::Struct.new(:name, :type)
  Padding = ::Struct.new(:length)
  List    = ::Struct.new(:name, :type, :length)
  Event   = ::Struct.new(:name, :fields, :number)
  Alias   = ::Struct.new(:name, :base)
  Enum    = ::Struct.new(:name, :values)
  Union   = ::Struct.new(:name, :fields)
  Error   = ::Struct.new(:name, :fields, :number)
  Request = ::Struct.new(:name, :fields, :opcode, :reply)
  
  class Request
    def arguments
      fields.reject do |field|
        !field.respond_to?(:name)
      end
    end
  end
  
  Nokogiri::XML(ARGF.read).xpath('/xcb/*').each do |xml|
    case xml.name
    when 'struct'
      things[xml['name']] = s = Struct.new(xml['name'], [])
      xml.xpath('*').each do |xml|
        case xml.name
        when 'doc'
        when 'field'
          s.fields << Scalar.new(xml['name'], xml['type'])
        when 'pad'
          s.fields << Padding.new(xml['bytes'].to_i)
        when 'list'
          s.fields << List.new(xml['name'], xml['type'], xml.xpath('.//fieldref').text)
        else
          puts "Don't know what to do with #{xml.name}"
        end
      end
    when 'union'
      things[xml['name']] = s = Union.new(xml['name'], [])
      xml.xpath('*').each do |xml|
        case xml.name
        when 'doc'
        when 'field'
          s.fields << Scalar.new(xml['name'], xml['type'])
        when 'pad'
          s.fields << Padding.new(xml['bytes'].to_i)
        when 'list'
          s.fields << List.new(xml['name'], xml['type'], xml.xpath('.//fieldref').text)
        else
          puts "Don't know what to do with #{xml.name}"
        end
      end
    when 'xidtype', 'xidunion'
      things[xml['name']] = Alias.new(xml['name'], 'ID')
    when 'typedef'
      things[xml['newname']] = Alias.new(xml['newname'], xml['oldname'])
    when 'enum'
      things[xml['name']] = e = Enum.new(xml['name'], {})
      xml.xpath('item').each do |xml|
          e.values[xml['name']] = xml['value']
      end
    when 'event'
      things[xml['name']] = e = Event.new(xml['name'], [], xml['number'])
      xml.xpath('*').each do |xml|
        case xml.name
        when 'doc'
        when 'field'
          e.fields << Scalar.new(xml['name'], xml['type'])
        when 'pad'
          e.fields << Padding.new(xml['bytes'].to_i)
        when 'list'
          e.fields << List.new(xml['name'], xml['type'], xml.xpath('.//fieldref').text)
        else
          puts "Don't know what to do with #{xml.name}"
        end
      end
    when 'eventcopy'
      things[xml['name']] = Event.new(xml['name'], things[xml['ref']], xml['number'])
    when 'error'
      things[xml['name']] = e = Error.new(xml['name'], [], xml['number'])
      xml.xpath('*').each do |xml|
        case xml.name
        when 'doc'
        when 'field'
          e.fields << Scalar.new(xml['name'], xml['type'])
        when 'pad'
          e.fields << Padding.new(xml['bytes'].to_i)
        when 'list'
          e.fields << List.new(xml['name'], xml['type'], xml.xpath('.//fieldref').text)
        else
          puts "Don't know what to do with #{xml.name}"
        end
      end
    when 'errorcopy'
      things[xml['name']] = Error.new(xml['name'], things[xml['ref']], xml['number'])
    when 'request'
      things[xml['name']] = e = Request.new(xml['name'], [], xml['opcode'], reply = [])
      xml.xpath('*').each do |xml|
        case xml.name
        when 'doc'
        when 'field', 'exprfield'
          e.fields << Scalar.new(xml['name'], xml['type'])
        when 'valueparam'
          e.fields << Scalar.new(xml['value-mask-name'], xml['value-mask-type'])
          e.fields << List.new(xml['value-list-name'], 'VALUE', nil)
        when 'pad'
          e.fields << Padding.new(xml['bytes'].to_i)
        when 'list'
          e.fields << List.new(xml['name'], xml['type'], xml.xpath('.//fieldref').text)
        when 'exprfield'
          e.fields << Scalar.new(xml['name'], xml['type'])
        when 'reply'
          xml.xpath('*').each do |xml|
            case xml.name
            when 'doc'
            when 'field'
              reply << Scalar.new(xml['name'], xml['type'])
            when 'pad'
              reply << Padding.new(xml['bytes'].to_i)
            when 'list'
              reply << List.new(xml['name'], xml['type'], xml.xpath('.//fieldref').text)
            else
              puts "Don't know what to do with #{xml.name}"
              puts xml
              puts
            end
          end
        else
          puts "Don't know what to do with #{xml.name}"
          puts xml
          puts
        end
      end
    else
      puts "Don't know what to do with #{xml.name}"
      puts xml
      puts
    end
  end
  
  @things["ID"] = Alias.new("ID", "CARD32")
  @things["VALUE"] = Alias.new("VALUE", "CARD32")
  @things.delete("STR")
  @things.delete("CHAR2B")
  @things.delete("RECTANGLE")
  @things.delete("POINT")
  @things.delete("SEGMENT")
  @things.delete("ARC")
  @things.delete("COLORITEM")
  @things.delete("TIMECOORD")
  @things.delete("FONTPROP")
  @things.delete("CHARINFO")
  @things.delete("RGB")
  @things.delete("HOST")
  
  def self.resolve_type type
    while @things[type]
      case @things[type]
      when Alias
        type = @things[type].base
      else
        raise @things[type].inspect
      end
    end
    type
  end
  
  things.each do |name, t|
    case t
    when Request
      format, args = "C", [t.opcode.to_i]
      if t.fields.empty?
        t.fields = [Padding.new(1)]
      end
      t.fields.each_with_index do |a, i|
        case a
        when Scalar
          type = resolve_type(a.type)
          args << a.name.gsub("class", "klass")
          case type
          when "BOOL", "BYTE", "CARD8"
            format << "C"
          when "INT8"
            format << "c"
          when "CARD16"
            format << "S"
          when "INT16"
            format << "s"
          when "CARD32"
            format << "L"
          when "INT32"
            format << "l"
          else
            raise type
          end
        when List
          type = resolve_type(a.type)
          args << a.name
          case type
          when "STR"
            format << "[A]"
          when "BYTE"
            format << "a"
          when "CARD8"
            format << "[c]"
          when "CHAR2B"
            format << "[S]"
          when "char", "void"
            format << "a"
          when "CARD32"
            format << "[L]"
          when "RECTANGLE"
            format << "[[ssSS]]"
          when "POINT"
            format << "[[ss]]"
          when "SEGMENT"
            format << "[[ssss]]"
          when "ARC"
            format << "[[ssSSss]]"
          when "COLORITEM"
            format << "[[LSSSCp]]"
          else
            raise type
          end
        when Padding
          format << "p#{a.length}"
        else
          raise a.class.inspect
        end
        if i == 0
          format << "S"
          args << 0
        end
      end
      puts "  def #{t.name.snake_case} (#{args.reject{|a|Fixnum===a}.join(', ')})"
      puts "    req #{format.inspect}, #{args.join(", ")}"
      format, args = "", []
      t.reply.each_with_index do |a, i|
        case a
        when Scalar
          type = resolve_type(a.type)
          format << "<" << a.name << ">"
          args << a.name
          case type
          when "BOOL", "BYTE", "CARD8"
            format << "C"
          when "INT8"
            format << "c"
          when "CARD16"
            format << "S"
          when "INT16"
            format << "s"
          when "CARD32"
            format << "L"
          when "INT32"
            format << "l"
          when "CHARINFO"
            format << "{<lsb>s<rsb>s<cw>s<a>s<d>s<attr>S}"
          else
            raise type
          end
        when List
          type = resolve_type(a.type)
          args << a.name
          n = args.index(a.length)
          n &&= n + 1
          format << "<" << a.name << ">"
          p a.length
          case type
          when "STR"
            format << "[#{n}A]"
          when "BYTE"
            format << "a#{n}"
          when "CARD8"
            format << "[#{n}c]"
          when "CHAR2B"
            format << "[#{n}S]"
          when "char", "void"
            format << "a#{n}"
          when "CARD32"
            format << "[#{n}L]"
          when "RECTANGLE"
            format << "[#{n}{<x>s<y>s<width>S<height>S}]"
          when "POINT"
            format << "[#{n}{<x>s<y>s}]"
          when "SEGMENT"
            format << "[#{n}{<x1>s<y1>s<x2>s<y2>s}]"
          when "ARC"
            format << "[#{n}{<x>s<x>s<width>S<height>S<angle1>s<angle2>s}]"
          when "COLORITEM"
            format << "[#{n}{<pixel>L<red>S<green>S<blue>S<flags>Cp}]"
          when "TIMECOORD"
            format << "[#{n}{<time>L<x>s<y>s}]"
          when "CHARINFO"
            format << "[#{n}{<lsb>s<rsb>s<cw>s<a>s<d>s<attr>S}]"
          when "FONTPROP"
            format << "[#{n}{<name>L<value>L}]"
          when "RGB"
            format << "[#{n}{<red>S<green>S<blue>Sp2}]"
          when "HOST"
            format << "[#{n}{<family>Cp1<address_len>Sa2}]"
          else
            raise type
          end
        when Padding
          format << "p#{a.length}"
        else
          raise a.class.inspect
        end
      end
      if format != ""
        puts "    reply #{format.inspect}"
      end
      puts "  end"
      puts
    else
    end
  end

end

