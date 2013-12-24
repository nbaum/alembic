
=begin

Screen = Struct.new(:root, :x, :y, :width, :height)

c.query_extension("RANDR")

screens = []
clients = []

class Client
  attr_reader :child, :frame
  
  def initialize (child)
    @child = child
  end
  
  def x11
    child.connection
  end
  
  def get_name
    x11.get_property(false, @child, "_NET_WM_NAME", 0, 0, 80)
  end
  
end

c.setup.roots.each_with_index do |screen, i|
  p c.get_selection_owner("WM_S#{i + 1}").owner
  screens += c.randr_get_screen_resources(screen.root).crtcs.map do |crtc|
    ci = c.randr_get_crtc_info(crtc, 0)
    Screen.new(screen.root, ci.x, ci.y, ci.width, ci.height)
  end
  c.query_tree(screen.root).children.each do |window|
    unless c.get_window_attributes(window).override_redirect
      clients << client = Client.new(window)
      p client.get_name
    end
  end
  #c.grab_key true, screen.root, *c.chord_to_keymask("A-F1"), GRAB_MODE_ASYNC, GRAB_MODE_ASYNC
  #c.grab_button true, screen.root, EVENT_MASK_BUTTON_PRESS, GRAB_MODE_ASYNC, GRAB_MODE_ASYNC, 0, 0, *c.chord_to_buttonmask("A-1")
  #c.grab_button true, screen.root, EVENT_MASK_BUTTON_PRESS, GRAB_MODE_ASYNC, GRAB_MODE_ASYNC, 0, 0, *c.chord_to_buttonmask("A-2")
end

p clients

attr = nil
start = nil

loop do
  case ev = c.next_event
  when KeyPressEvent
    c.configure_window(ev.child, CONFIG_WINDOW_STACK_MODE, STACK_MODE_ABOVE)
  when ButtonPressEvent
    if ev.child
      c.grab_pointer(true, ev.child, EVENT_MASK_POINTER_MOTION | EVENT_MASK_BUTTON_RELEASE, GRAB_MODE_ASYNC, GRAB_MODE_ASYNC, 0, 0, ev.time)
      attr = c.get_geometry ev.child
      start = ev
    end
  when ButtonReleaseEvent
    c.ungrab_pointer(ev.time)
  when MotionNotifyEvent
    ev = c.skip_events(ev)
    dx = ev.root_x - start.root_x
    dy = ev.root_y - start.root_y
    if start.detail == 1
      c.configure_window(start.child, CONFIG_WINDOW_X | CONFIG_WINDOW_Y, attr.x + dx, attr.y + dy)
    else
      c.configure_window(start.child, CONFIG_WINDOW_WIDTH | CONFIG_WINDOW_HEIGHT, [0, attr.width + dx].max, [0, attr.height + dy].max)
    end
  end
end

=end
