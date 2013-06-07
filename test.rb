Thread.abort_on_exception = true

require 'awesome_print'
require 'alembic'

include Alembic::Constants

class WindowManager < Alembic::Connection
  
  def parse_key_chord str
    *mods, key = str.split("-")
    hmods = {
      "S" => MOD_MASK_SHIFT,
      "C" => MOD_MASK_CONTROL,
      "A" => MOD_MASK_1,
      "W" => MOD_MASK_4,
      "M" => MOD_MASK_1,
    }
    mods = mods.map{|mod|hmods[mod]}.reduce(&:|)
    code = @keysyms[key][0]
    [mods, code]
  end
  
  def parse_mouse_chord str
    *mods, button = str.split("-")
    hmods = {
      "S" => MOD_MASK_SHIFT,
      "C" => MOD_MASK_CONTROL,
      "A" => MOD_MASK_1,
      "W" => MOD_MASK_4,
      "M" => MOD_MASK_1,
    }
    mods = mods.map{|mod|hmods[mod]}.reduce(&:|)
    code = button.to_i
    [code, mods]
  end
  
  def setup
    super
    @screen = roots[0]
    @root = @screen[:root]
    @active_frame_pixel = alloc_color(@screen[:default_colormap], 0xffff, 0x4444, 0x2222)[:pixel]
    @frame_text_pixel = alloc_color(@screen[:default_colormap], 0xffff, 0xffff, 0xffff)[:pixel]
    @inactive_frame_pixel = alloc_color(@screen[:default_colormap], 0x8888, 0x8888, 0x8888)[:pixel]
    @desktop_pixel = alloc_color(@screen[:default_colormap], 0x4444, 0x6666, 0x8888)[:pixel]
    @current_desktop = get_property(false, @root, "_NET_CURRENT_DESKTOP")
    query_tree(@root)[:children].each do |wid|
      #Client.new(wid)
    end
    @cursor_font = genxid
    open_font(@cursor_font, "cursor")
    @cursor = genxid
    create_glyph_cursor(@cursor, @cursor_font, @cursor_font, 68, 68 + 1, 0x0, 0x0, 0x0, -1, -1, -1)
    change_window_attributes(@root, event_mask: EVENT_MASK_SUBSTRUCTURE_REDIRECT,
                                    cursor: @cursor,
                                    background_pixel: @desktop_pixel);
    clear_area(true, @root, 0, 0, -1, -1)
    grab_key(true, @root, *parse_key_chord("M-Return"), GRAB_MODE_ASYNC, GRAB_MODE_ASYNC)
    grab_key(true, @root, *parse_key_chord("M-c"), GRAB_MODE_ASYNC, GRAB_MODE_ASYNC)
    grab_key(true, @root, *parse_key_chord("M-q"), GRAB_MODE_ASYNC, GRAB_MODE_ASYNC)
    grab_key(true, @root, *parse_key_chord("M-f"), GRAB_MODE_ASYNC, GRAB_MODE_ASYNC)
    grab_key(true, @root, *parse_key_chord("M-m"), GRAB_MODE_ASYNC, GRAB_MODE_ASYNC)
    grab_key(true, @root, *parse_key_chord("M-r"), GRAB_MODE_ASYNC, GRAB_MODE_ASYNC)
    grab_key(true, @root, *parse_key_chord("M-t"), GRAB_MODE_ASYNC, GRAB_MODE_ASYNC)
    grab_key(true, @root, *parse_key_chord("M-comma"), GRAB_MODE_ASYNC, GRAB_MODE_ASYNC)
    grab_key(true, @root, *parse_key_chord("M-period"), GRAB_MODE_ASYNC, GRAB_MODE_ASYNC)
    10.times do |i|
      grab_key(true, @root, *parse_key_chord("M-#{i}"), GRAB_MODE_ASYNC, GRAB_MODE_ASYNC)
      grab_key(true, @root, *parse_key_chord("M-S-#{i}"), GRAB_MODE_ASYNC, GRAB_MODE_ASYNC)
      grab_key(true, @root, *parse_key_chord("M-C-#{i}"), GRAB_MODE_ASYNC, GRAB_MODE_ASYNC)
    end
    grab_button(true, @root, EVENT_MASK_BUTTON_RELEASE | EVENT_MASK_POINTER_MOTION, GRAB_MODE_ASYNC, GRAB_MODE_ASYNC, 0, 0, *parse_mouse_chord("M-1"))
    grab_button(true, @root, EVENT_MASK_BUTTON_RELEASE | EVENT_MASK_POINTER_MOTION, GRAB_MODE_ASYNC, GRAB_MODE_ASYNC, 0, 0, *parse_mouse_chord("M-3"))
    grab_button(true, @root, EVENT_MASK_BUTTON_RELEASE | EVENT_MASK_POINTER_MOTION, GRAB_MODE_ASYNC, GRAB_MODE_ASYNC, 0, 0, *parse_mouse_chord("M-4"))
    grab_button(true, @root, EVENT_MASK_BUTTON_RELEASE | EVENT_MASK_POINTER_MOTION, GRAB_MODE_ASYNC, GRAB_MODE_ASYNC, 0, 0, *parse_mouse_chord("M-5"))
  end
  
end

wm = WindowManager.new

wm.setup

wm.handle :error do |err|
  puts "#{err.class}: #{err}"
  exit 1
end

wm.handle :configure_request do |ev|
  e = wm.encode_configure_notify_event(ev.merge(event: ev[:window], above_sibling: ev[:sibling])).ljust(32, "\0")
  wm.configure_window ev[:window], x: ev[:x], y: ev[:y], width: ev[:width], height: ev[:height]
  wm.send_event false, ev[:window], EVENT_MASK_STRUCTURE_NOTIFY, e
end

wm.handle :map_request do |ev|
  wm.map_window(ev[:window])
end

wm.event_loop

