
require 'alembic/classes/drawable'

module Alembic
  include Alembic::Extensions::Xproto
  
  class Pixmap < Resource
    
    def destroy
      c.free_pixmap(pixmap)
    end
    
  end
  
end

