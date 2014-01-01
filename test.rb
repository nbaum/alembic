$: << "lib"

require 'alembic/errors'
require 'alembic/connection'
require 'alembic/reactor'

require 'alembic/classes'

include Alembic::Extensions::Xproto

d = Alembic::Display.new

class Frame < Alembic::Window
  
  def on_expose (event)
    paint do |p|
      p.change(foreground: 0xDDDDDD)
      p.poly_fill_rectangle([[0, 0, 400, 300]])
      p.change(foreground: 0xEEEEEE)
      p.poly_segment([[0, 0, 0, 299], [0, 0, 399, 0]])
      p.change(foreground: 0xCCCCCC)
      p.poly_segment([[399, 299, 0, 299], [399, 299, 399, 0]])
    end
  end
  
end

class Button < Alembic::Window
  
  def rectangle (p, x1, y1, x2, y2, highlight, shadow = nil, bevel: false)
    b = bevel ? 1 : 0
    p.change(foreground: highlight)
    p.poly_segment([[x1, y1+b, x1, y2-b], [x1+b, y1, x2-b, y1]])
    p.change(foreground: shadow) if shadow
    p.poly_segment([[x2-b, y2, x1+b, y2], [x2, y2-b, x2, y1+b]])
  end
  
  def on_expose (event)
    w, h = 50, 20
    @font ||= display.open_font("-*-helvetica-bold-r-*-*-12-*")
    paint do |p|
      p.change(foreground: 0xDDDDDD, background: 0xDDDDDD, font: @font)
      p.poly_fill_rectangle([[0, 0, w, h]])
      rectangle(p, 0, 0, w - 1, h - 1, 0x999999, 0x666666, bevel: true)
      rectangle(p, 1, 1, w - 2, h - 2, 0xFFFFFF, 0x999999)
      p.change(foreground: 0x333333)
      e = p.query_text_extents("Hello")
      p.image_text8(w / 2 - e[:overall_width] / 2, 20 - (h / 2 - e[:overall_ascent] / 2), "Hello")
    end
  end
  
end

d.roots.each do |r|
  w = r.create_window(Frame, 100, 100, 400, 300, event_mask: EVENT_MASK_EXPOSURE)
  w.set_property("WM_NAME", "Test")
  b = w.create_window(Button, 100, 100, 50, 20, event_mask: EVENT_MASK_EXPOSURE)
  w.map
  w.map_under
end

d.run

