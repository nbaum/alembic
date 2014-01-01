$: << "lib"

require 'alembic/generator'

Alembic::Generator.xml_dir = "xcb-proto/src"

e = Alembic::Generator::Extension.new("xproto")
File.open("lib/alembic/extensions/xproto.rb", "w") do |io|
  io.puts e.compile
end

e = Alembic::Generator::Extension.new("render")
File.open("lib/alembic/extensions/render.rb", "w") do |io|
  io.puts e.compile
end

e = Alembic::Generator::Extension.new("randr")
File.open("lib/alembic/extensions/randr.rb", "w") do |io|
  io.puts e.compile
end

