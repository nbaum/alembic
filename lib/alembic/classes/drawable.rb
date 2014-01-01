
require 'alembic/classes/resource'

module Alembic
  include Alembic::Extensions::Xproto
  
  class Drawable < Resource
    
    def geometry ()
      c.get_geometry(xid)
    end
    
    def create_pixmap (depth, width, height)
      c.create_pixmap(depth, p = c.make_resource(Pixmap), xid, width, height)
      p
    end
    
    def create_gc (**args)
      c.create_gc(gc = c.make_resource(GContext), xid, *c.value_param(Extensions::Xproto::GC, args))
      gc
    end
    
    def get_image (format, x, y, width, height, plane_mask)
      c.get_image(format, drawable, x, y, width, height, plane_mask)
    end
    
    def best_cursor_size (width, height)
      c.query_best_size(QUERY_SHAPE_OF_LARGEST_CURSOR, xid, width, height)
    end
    
    def best_tile_size (width, height)
      c.query_best_size(QUERY_SHAPE_OF_FASTEST_TILE, xid, width, height)
    end
    
    def best_stipple_size (width, height)
      c.query_best_size(QUERY_SHAPE_OF_FASTEST_STIPPLE, xid, width, height)
    end
    
    def rotate_properties (delta, atoms)
      c.rotate_properties(xid, delta, atoms)
    end
    
    def paint (gc = nil, &block)
      gc ||= @gc ||= create_gc
      Painting.new(c, self, gc).tap(&block)
    end
    
  end
  
end

