
require 'alembic/classes/resource'

module Alembic
  include Alembic::Extensions::Xproto
  
  class Cursor < Resource
    
    def destroy
      c.free_cursor(xid)
    end
    
    def recolor (fore_red, fore_green, fore_blue, back_red, back_green, back_blue)
      c.recolor_cursor(xid, fore_red, fore_green, fore_blue, back_red, back_green, back_blue)
    end
    
  end
  
end

