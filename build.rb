require 'alembic/xcb'

ms = Alembic::XCB::ModuleSet.new
ms.load "xproto"

File.open("lib/alembic/x11/generated/core.rb", "w") do |io|
  io.puts ms['xproto'].compile
end

