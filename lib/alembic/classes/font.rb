
require 'alembic/classes/fontable'

module Alembic
  include Alembic::Extensions::Xproto
  
  class Font < Fontable
    
    def destroy
      c.close_font(xid)
    end
    
    private
    
    def root= (window)
      @root = window
    end
    
  end
  
end

