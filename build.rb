require 'ox/format'
require 'alembic/xml'

e = Alembic::Xml::Extension.new("xproto")
File.open("lib/alembic/extensions/xproto.rb", "w") do |io|
  io.puts e.compile
end

e = Alembic::Xml::Extension.new("render")
File.open("lib/alembic/extensions/render.rb", "w") do |io|
  io.puts e.compile
end

e = Alembic::Xml::Extension.new("randr")
File.open("lib/alembic/extensions/randr.rb", "w") do |io|
  io.puts e.compile
end

