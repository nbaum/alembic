
require 'alembic/classes/resource'

module Alembic
  include Alembic::Extensions::Xproto
  
  class Colormap < Resource
    
    def destroy ()
      c.free_colormap(xid)
    end
    
    def install_colormap ()
      c.install_colormap(xid)
    end
    
    def uninstall_colormap ()
      c.uninstall_colormap(xid)
    end
    
    def alloc_color (red, green, blue)
      c.alloc_color(xid, red, green, blue)
    end
    
    def alloc_named_color (name)
      c.alloc_named_color(xid, name)
    end
    
    def alloc_color_cells (contiguous, colors, planes)
      c.alloc_color_cells(contiguous, xid, colors, planes)
    end
    
    def alloc_color_planes (contiguous, colors, reds, greens, blues)
      c.alloc_color_planes(contiguous, xid, colors, reds, greens, blues)
    end
    
    def free_colors (plane_mask, pixels)
      c.free_colors(xid, plane_mask, pixels)
    end
    
    def store_colors (items)
      c.store_colors(xid, items)
    end
    
    def store_named_color (flags, pixel, name)
      c.store_named_color(flags, xid, pixel, name)
    end
    
    def query_colors (pixels)
      c.query_colors(xid, pixels)
    end
    
    def lookup_color (name)
      c.lookup_color(xid, name)
    end
    
  end
  
end

