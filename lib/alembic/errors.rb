
module Alembic
  
  class Error < Exception
    def initialize value, opcode
      super("#{Protocol.opcodes[opcode]}: 0x%08x" % [value])
    end
  end
  
  RequestError = Class.new(Error)
  ValueError = Class.new(Error)
  WindowError = Class.new(Error)
  PixmapError = Class.new(Error)
  AtomError = Class.new(Error)
  CursorError = Class.new(Error)
  FontError = Class.new(Error)
  MatchError = Class.new(Error)
  DrawableError = Class.new(Error)
  AccessError = Class.new(Error)
  AllocError = Class.new(Error)
  ColormapError = Class.new(Error)
  GContextError = Class.new(Error)
  IDChoiceError = Class.new(Error)
  NameError = Class.new(Error)
  LengthError = Class.new(Error)
  ImplementationError = Class.new(Error)
  
  ERRORS =  [nil, RequestError, ValueError, WindowError, PixmapError, AtomError,
             CursorError, FontError, MatchError, DrawableError, AccessError, 
             AllocError, ColormapError, GContextError, IDChoiceError, 
             NameError, LengthError, ImplementationError]

end

