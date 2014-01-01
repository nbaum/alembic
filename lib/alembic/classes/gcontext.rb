
require 'alembic/classes/fontable'

module Alembic
  include Alembic::Extensions::Xproto
  
  class GContext < Fontable
    
    def change (**args)
      c.change_gc(xid, *c.value_param(Extensions::Xproto::GC, args))
    end
    
    def copy_from (src_gc, value_mask)
      c.copy_gc(src_gc, xid, value_mask)
    end
    
    def copy_to (dst_gc, value_mask)
      c.copy_gc(xid, dst_gc, value_mask)
    end
    
    def set_dashes (dash_offset, dashes)
      c.set_dashes(xid, dash_offset, dashes)
    end
    
    def set_clip_rectangles (ordering, clip_x_origin, clip_y_origin, rectangles)
      c.set_clip_rectangles(ordering, xid, clip_x_origin, clip_y_origin, rectangles)
    end
    
    def destroy
      c.free_gc(xid)
    end
    
  end
  
end

