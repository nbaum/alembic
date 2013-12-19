# inspired by http://incise.org/tinywm.html

require 'alembic/x11'

include Alembic::Enumerants
include Alembic::X11::Core

c = Alembic::Connection.new

c.setup.roots.each do |screen|
  screen.root.grab_key true, MOD_MASK_1, c.keysym_to_keycode("F1"),
                       GRAB_MODE_ASYNC, GRAB_MODE_ASYNC
  screen.root.grab_button true, EVENT_MASK_BUTTON_PRESS, GRAB_MODE_ASYNC,
                          GRAB_MODE_ASYNC, 0, 0, 1, MOD_MASK_1
  screen.root.grab_button true, EVENT_MASK_BUTTON_PRESS, GRAB_MODE_ASYNC,
                          GRAB_MODE_ASYNC, 0, 0, 2, MOD_MASK_1
end

attr = nil
start = nil

loop do
  case ev = c.next_event
  when KeyPressEvent
    ev.child.configure_window(CONFIG_WINDOW_STACK_MODE, STACK_MODE_ABOVE)
  when ButtonPressEvent
    if ev.child
      ev.child.grab_pointer(true, EVENT_MASK_POINTER_MOTION | EVENT_MASK_BUTTON_RELEASE, GRAB_MODE_ASYNC, GRAB_MODE_ASYNC, 0, 0, ev.time)
      attr = ev.child.get_geometry
      start = ev
    end
  when ButtonReleaseEvent
    c.ungrab_pointer(ev.time)
  when MotionNotifyEvent
    ev = c.skip_events(ev)
    dx = ev.root_x - start.root_x
    dy = ev.root_y - start.root_y
    if start.detail == 1
      start.child.configure_window(CONFIG_WINDOW_X | CONFIG_WINDOW_Y, attr.x + dx, attr.y + dy)
    else
      start.child.configure_window(CONFIG_WINDOW_WIDTH | CONFIG_WINDOW_HEIGHT, [0, attr.width + dx].max, [attr.height + dy, 0].max)
    end
  end
end

