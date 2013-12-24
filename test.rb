require 'alembic/connection'

include Alembic::Extensions::Xproto
c = Alembic::Connection.new

c.setup.roots.each_with_index do |screen, i|
  
  # Set up manager selections.
  unless c.get_selection_owner("WM_S#{i + 1}")
    c.create_window(0, w = c.alloc_window, screen.root, 0, 0, 1, 1, 0, WINDOW_CLASS_INPUT_ONLY, 0, 0)
    c.set_selection_owner(w, "WM_S#{i + 1}", 0)
  end
  
  # Reparenting
  c.change_window_attributes(screen.root, CW_EVENT_MASK, EVENT_MASK_SUBSTRUCTURE_REDIRECT)
  
end

while true
  case e = p(c.next_event)
  when ConfigureRequestEvent
    c.configure_window(e.window, *CONFIG_WINDOW.param(x: e.x, y: e.y, width: e.width, height: e.height, border_width: e.border_width))
    ev = c.encode_configure_notify_event(e.window, e.window, e.sibling, e.x, e.y, e.width, e.height, e.border_width, false)
    c.send_event(true, e.window, EVENT_MASK_STRUCTURE_NOTIFY, ev)
  when MapRequestEvent
    c.map_window(e.window)
  end
end

