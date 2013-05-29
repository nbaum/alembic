require 'alembic'
require 'socket'
require 'awesome_print'

r = Alembic.condense("L[1CS]", 2, [1, 2, 3, 4])
p r
p Alembic.vaporise("L[1CS]", r)

exit

name, data = "MIT-MAGIC-COOKIE-1", "45f136d93aae134fb53d3ab3acaa1b3a"

socket = TCPSocket.new('localhost', 6001)

r = Alembic.condense("SSSSSp2apap", 0x426C, 11, 0, name.length, data.length, name, data)

socket.write(r)

r = socket.read(8)

result, _, maj, min, len = Alembic.vaporise("CCSSS", r)

r = socket.read(len * 4)

ap Alembic.vaporise("LLLLSSCCCCCCCCp4a5p[8[CCCp5]][7[LLLLLSSSSSSLCCCC[16[Cp1Sp4[2[LCCSLLLp4]]]]]]", r)

