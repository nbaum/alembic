
module Alembic
  include Alembic::Extensions::Xproto
  
  class Painting
    
    attr_reader :drawable, :gc
    
    def initialize (connection, drawable, gc)
      @connection, @drawable, @gc = connection, drawable, gc
    end
    
    def change (**args)
      c.change_gc(gc, *c.value_param(Extensions::Xproto::GC, args))
    end
    
    def query_text_extents (text)
      c.query_text_extents(gc, text)
    end
    
    def copy_area (src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height)
      c.copy_area(src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height)
    end
    
    def copy_plane (src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height, bit_plane)
      c.copy_plane(src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height, bit_plane)
    end
    
    def poly_point (coordinate_mode, points)
      c.poly_point(coordinate_mode, drawable, gc, points)
    end
    
    def poly_line (coordinate_mode, points)
      c.poly_line(coordinate_mode, drawable, gc, points)
    end
    
    def poly_segment (segments)
      c.poly_segment(drawable, gc, segments)
    end
    
    def poly_rectangle (rectangles)
      c.poly_rectangle(drawable, gc, rectangles)
    end
    
    def poly_arc (arcs)
      c.poly_arc(drawable, gc, arcs)
    end
    
    def fill_poly (shape, coordinate_mode, points)
      c.fill_poly(drawable, gc, shape, coordinate_mode, points)
    end
    
    def poly_fill_rectangle (rectangles)
      c.poly_fill_rectangle(drawable, gc, rectangles)
    end
    
    def poly_fill_arc (arcs)
      c.poly_fill_arc(drawable, gc, arcs)
    end
    
    def put_image (format, width, height, dst_x, dst_y, left_pad, depth, data)
      c.put_image(format, drawable, gc, width, height, dst_x, dst_y, left_pad, depth, data)
    end
    
    def get_image (format, x, y, width, height, plane_mask)
      c.get_image(format, drawable, x, y, width, height, plane_mask)
    end
    
    def poly_text8 (x, y, items)
      c.poly_text8(drawable, gc, x, y, items)
    end
    
    def poly_text16 (x, y, items)
      c.poly_text16(drawable, gc, x, y, items)
    end
    
    def image_text8 (x, y, string)
      c.image_text8(drawable, gc, x, y, string)
    end
    
    def image_text16 (x, y, string)
      c.image_text16(drawable, gc, x, y, string)
    end
    
    private
    
    def c
      @connection
    end
    
  end
  
end

