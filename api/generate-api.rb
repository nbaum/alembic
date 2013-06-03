require 'nokogiri'
require 'extlib'
require 'strscan'
require 'pp'

module Proto
  
  Struct  = ::Struct.new(:name, :fields)
  Scalar  = ::Struct.new(:name, :type, :mask, :enum)
  Padding = ::Struct.new(:length)
  List    = ::Struct.new(:name, :type, :length)
  Event   = ::Struct.new(:name, :fields, :number)
  Alias   = ::Struct.new(:name, :base)
  Enum    = ::Struct.new(:name, :values)
  Union   = ::Struct.new(:name, :fields)
  Error   = ::Struct.new(:name, :fields, :number)
  Request = ::Struct.new(:name, :fields, :opcode, :reply)
  Prim    = ::Struct.new(:name, :type)
  
  require 'struct'
  require 'alias'
  require 'enum'
  require 'error'
  require 'event'
  require 'request'
  require 'types'
  
  attr_reader :things
  
  def initialize
    @things = {}
    @things["BOOL"] = Prim.new("BOOL",     "bool")
    @things["BYTE"] = Prim.new("BYTE",     "byte")
    @things["CARD8"] = Prim.new("CARD8",   "ubyte")
    @things["INT8"] = Prim.new("INT8",     "byte")
    @things["CARD16"] = Prim.new("CARD16", "uwyde")
    @things["INT16"] = Prim.new("INT16",   "wyde")
    @things["CARD32"] = Prim.new("CARD32", "utetra")
    @things["INT32"] = Prim.new("INT32",   "tetra")
    @things["ID"] = Alias.new("ID", "CARD32")
    @things["VALUE"] = Alias.new("VALUE", "CARD32")
  end
  
  attr_accessor :extension, :xname
  
  def import path, types_only = false
    xml = Nokogiri::XML(File.read(path))
    @extension ||= xml.xpath("/xcb")[0]['extension-name']
    @xname ||= xml.xpath("/xcb")[0]['extension-xname']
    ext = xml.xpath("/xcb")[0]['extension-name']
    ext &&= "#{ext}_"
    ext ||= ""
    xml.xpath('/xcb/*').each do |xml|
      case xml.name
      when 'import'
        import "xml/#{xml.text}.xml", true
      when 'struct'
        things[xml['name']] = s = Struct.new(xml['name'], [])
        xml.xpath('*').each do |xml|
          case xml.name
          when 'doc'
          when 'field'
            s.fields << Scalar.new(xml['name'], xml['type'], xml['mask'], xml['enum'])
          when 'pad'
            s.fields << Padding.new(xml['bytes'].to_i)
          when 'list'
            len = xml.xpath('.//fieldref').text
            len = xml.xpath('.//value').text.to_i if len.empty?
            s.fields << List.new(xml['name'], xml['type'], len)
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
            s.fields << Scalar.new(xml['name'], xml['type'], xml['mask'], xml['enum'])
          when 'pad'
            s.fields << Padding.new(xml['bytes'].to_i)
          when 'list'
            len = xml.xpath('.//fieldref').text
            len = xml.xpath('.//value').text.to_i if len.empty?
            s.fields << List.new(xml['name'], xml['type'], len)
          else
            puts "Don't know what to do with #{xml.name}"
          end
        end
      when 'xidtype', 'xidunion'
        things[xml['name']] = Alias.new(xml['name'], 'ID')
      when 'typedef'
        things[xml['newname']] = Alias.new(xml['newname'], xml['oldname'])
      when 'enum'
        next if types_only
        things[xml['name']] = e = Enum.new(xml['name'], {})
        xml.xpath('item').each do |xml|
          val = xml.xpath('./value').text
          if val.empty?
            val = xml.xpath('./bit').text
            val = 1 << val.to_i unless val.empty?
          end
          e.values[xml['name']] = val.to_i
        end
      when 'event'
        next if types_only
        things[xml['name']] = e = Event.new(ext + xml['name'], [], xml['number'])
        xml.xpath('*').each do |xml|
          case xml.name
          when 'doc'
          when 'field'
            e.fields << Scalar.new(xml['name'], xml['type'], xml['mask'], xml['enum'])
          when 'pad'
            e.fields << Padding.new(xml['bytes'].to_i)
          when 'list'
            len = xml.xpath('.//fieldref').text
            len = xml.xpath('.//value').text.to_i if len.empty?
            e.fields << List.new(xml['name'], xml['type'], len)
          else
            puts "Don't know what to do with #{xml.name}"
          end
        end
      when 'eventcopy'
        next if types_only
        things[xml['name']] = Event.new(xml['name'], things[xml['ref']].fields, xml['number'])
      when 'error'
        next if types_only
        things[xml['name']] = e = Error.new(xml['name'], [], xml['number'])
        xml.xpath('*').each do |xml|
          case xml.name
          when 'doc'
          when 'field'
            e.fields << Scalar.new(xml['name'], xml['type'], xml['mask'], xml['enum'])
          when 'pad'
            e.fields << Padding.new(xml['bytes'].to_i)
          when 'list'
            len = xml.xpath('.//fieldref').text
            len = xml.xpath('.//value').text.to_i if len.empty?
            e.fields << List.new(xml['name'], xml['type'], len)
          else
            puts "Don't know what to do with #{xml.name}"
          end
        end
      when 'errorcopy'
        next if types_only
        things[xml['name']] = Error.new(xml['name'], things[xml['ref']].fields, xml['number'])
      when 'request'
        next if types_only
        things[xml['name']] = e = Request.new(ext + xml['name'], [], xml['opcode'], reply = [])
        xml.xpath('*').each do |xml|
          case xml.name
          when 'doc'
          when 'field', 'exprfield'
            e.fields << Scalar.new(xml['name'], xml['type'], xml['mask'], xml['enum'])
          when 'valueparam'
            e.fields << Scalar.new(xml['value-mask-name'], xml['value-mask-type'])
            e.fields << List.new(xml['value-list-name'], 'VALUE', nil)
          when 'pad'
            e.fields << Padding.new(xml['bytes'].to_i)
          when 'list'
            len = xml.xpath('.//fieldref').text
            len = xml.xpath('.//value').text.to_i if len.empty?
            e.fields << List.new(xml['name'], xml['type'], len)
          when 'exprfield'
            e.fields << Scalar.new(xml['name'], xml['type'])
          when 'reply'
            xml.xpath('*').each do |xml|
              case xml.name
              when 'doc'
              when 'field'
                reply << Scalar.new(xml['name'], xml['type'], xml['mask'], xml['enum'])
              when 'pad'
                reply << Padding.new(xml['bytes'].to_i)
              when 'list'
                len = xml.xpath('.//fieldref').text
                len = xml.xpath('.//value').text.to_i if len.empty?
                reply << List.new(xml['name'], xml['type'], len)
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
  end
  
  def resolve_type type
    while @things[type]
      case @things[type]
      when Alias
        type = @things[type].base
      when Struct, Union, Prim
        return @things[type]
      else
        raise @things[type].inspect
      end
    end
    type
  end
  
  def format *xs
    xs.map do |x|
      if Array === x
        "  " + x.map{|y|format(y)}.join("\n").split("\n").join("\n  ")
      else
        x
      end
    end.join("\n")
  end
  
  extend self
  initialize
  import ARGV[0]
  
  @things.delete("CHAR2B")
  
  puts "module Alembic; end"
  puts "module Alembic::Protocol; end"
  puts "module Alembic::Protocol::#{@extension || 'Core'}"
  puts
  
  things.each do |name, t|
    case t
    when Enum
      t.values.each_with_index do |(name, value), i|
        value ||= i
        puts "  Alembic::Constants::#{t.name.snake_case.upcase}_#{name.snake_case.upcase} = #{value}"
      end
      puts
      puts "  Alembic::Constants::#{t.name.snake_case.pluralize.upcase} = {"
      t.values.each_with_index do |(name, value), i|
        value ||= i
        puts "    #{value} => #{name.snake_case.upcase.inspect},"
      end
      puts "  }"
      puts
    when Event
      puts format(t.writer)
      puts
      puts format(t.reader)
      puts
      puts "  Alembic::Protocol.register_event #{@xname.inspect}, #{t.number}, :#{t.name.snake_case}"
      puts
    when Request
      puts format(t.writer)
      puts
      puts "  Alembic::Protocol.register_opcode #{@xname.inspect}, #{t.opcode}, :#{t.name.snake_case}"
      puts
    end
  end
  
  unless @extension
    puts format(@things["Setup"].reader)
    puts
  end
  
  puts "end"
  
end

