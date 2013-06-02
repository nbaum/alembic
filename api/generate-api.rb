require 'nokogiri'
require 'extlib'
require 'strscan'
require 'pp'

module Proto
  
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
  end
  
  def import path, types_only = false
    xml = Nokogiri::XML(File.read(path))
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
        next if types_only
        things[xml['name']] = e = Event.new(ext + xml['name'], [], xml['number'])
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
        next if types_only
        things[xml['name']] = Event.new(xml['name'], things[xml['ref']].fields, xml['number'])
      when 'error'
        next if types_only
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
        next if types_only
        things[xml['name']] = Error.new(xml['name'], things[xml['ref']].fields, xml['number'])
      when 'request'
        next if types_only
        things[xml['name']] = e = Request.new(ext + xml['name'], [], xml['opcode'], reply = [])
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
  end
  
  def resolve_type type
    while @things[type]
      case @things[type]
      when Alias
        type = @things[type].base
      when Struct, Union
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
        "  " + x.map{|y|format y}.join("\n").gsub("\n", "\n  ")
      else
        x
      end
    end.join("\n")
  end
  
  extend self
  initialize
  import ARGV[0]
  
  puts "module X11::API"
  puts
  
  things.each do |name, t|
    next unless Request === t #or Event === t
    puts format(t.generate)
    puts
  end
  
  puts "end"
  
end

