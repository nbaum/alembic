
require 'alembic/classes/drawable'

module Alembic
  include Alembic::Extensions::Xproto
  
  class Fontable < Resource
    
    def query_font ()
      c.query_font(xid)
    end
    
    def query_text_extents (string)
      c.query_text_extents(xid, string)
    end
    
    private
    
    def root= (window)
      @root = window
    end
    
  end
  
end

