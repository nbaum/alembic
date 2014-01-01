
require 'alembic/reactor'

module Alembic
  include Alembic::Extensions::Xproto
  
  class Display < Reactor
    
    def expose_event (event)
      event[:window].on_expose(event)
    end
    
    def roots
      c.setup[:roots].map{|x|x[:root]}
    end
    
    def open_font (name)
      c.open_font(f = c.make_resource(Font), name)
      f
    end
    
    def list_fonts (max_names, pattern = "*")
      c.list_fonts(max_names, pattern)
    end
    
    def list_fonts_with_info (max_names, pattern = "*")
      c.list_fonts_with_info(max_names, pattern)
    end
    
    def set_font_path (font)
      c.set_font_path(font)
    end
    
    def get_font_path ()
      c.get_font_path()
    end

    def ungrab_pointer (time = 0)
      c.ungrab_pointer(time)
    end
    
    def change_active_pointer_grab (cursor, time = 0, event_mask)
      c.change_active_pointer_grab(cursor, time, event_mask)
    end
    
    def ungrab_keyboard (time = 0)
      c.ungrab_keyboard(time)
    end
    
    def allow_events (mode, time = 0)
      c.allow_events(mode, time)
    end
    
    def grab_server ()
      c.grab_server()
    end
    
    def ungrab_server ()
      c.ungrab_server()
    end
    
    def get_input_focus ()
      c.get_input_focus()
    end
    
    def query_keymap ()
      c.query_keymap()
    end
    
    def create_cursor (source, mask, fore_red, fore_green, fore_blue, back_red, back_green, back_blue, x, y)
      c.create_cursor(cid = c.make_resource(Cursor), source, mask, fore_red, fore_green, fore_blue, back_red, back_green, back_blue, x, y)
      cid
    end
    
    def create_glyph_cursor (source_font, mask_font, source_char, mask_char, fore_red, fore_green, fore_blue, back_red, back_green, back_blue)
      c.create_glyph_cursor(cid = c.make_resource(Cursor), source_font, mask_font, source_char, mask_char, fore_red, fore_green, fore_blue, back_red, back_green, back_blue)
      cid
    end
    
    def query_extension (name)
      c.query_extension(name)
    end
    
    def list_extensions ()
      c.list_extensions
    end
    
    def change_keyboard_mapping (keycode_count, first_keycode, keysyms_per_keycode, keysyms)
      c.change_keyboard_mapping(keycode_count, first_keycode, keysyms_per_keycode, keysyms)
    end
    
    def get_keyboard_mapping (first_keycode, count)
      c.get_keyboard_mapping(first_keycode, count)
    end
    
    def change_keyboard_control (value_mask, value_list)
      c.change_keyboard_control(value_mask, value_list)
    end
    
    def get_keyboard_control ()
      c.get_keyboard_control()
    end
    
    def bell (percent)
      c.bell(percent)
    end
    
    def change_pointer_control (acceleration_numerator, acceleration_denominator, threshold, do_acceleration, do_threshold)
      c.change_pointer_control(acceleration_numerator, acceleration_denominator, threshold, do_acceleration, do_threshold)
    end
    
    def get_pointer_control ()
      c.get_pointer_control()
    end
    
    def set_screen_saver (timeout, interval, prefer_blanking, allow_exposures)
      c.set_screen_saver(timeout, interval, prefer_blanking, allow_exposures)
    end
    
    def get_screen_saver ()
      c.get_screen_saver()
    end
    
    def change_hosts (mode, family, address)
      c.change_hosts(mode, family, address)
    end
    
    def list_hosts ()
      c.list_hosts()
    end
    
    def set_access_control (mode)
      c.set_access_control(mode)
    end
    
    def set_close_down_mode (mode)
      c.set_close_down_mode(mode)
    end
    
    def force_screen_saver (mode)
      c.force_screen_saver(mode)
    end
    
    def set_pointer_mapping (map)
      c.set_pointer_mapping(map)
    end
    
    def get_pointer_mapping ()
      c.get_pointer_mapping()
    end
    
    def set_modifier_mapping (keycodes_per_modifier, keycodes)
      c.set_modifier_mapping(keycodes_per_modifier, keycodes)
    end
    
    def get_modifier_mapping ()
      c.get_modifier_mapping()
    end
    
    def no_operation ()
      c.no_operation()
    end
    
    private
    
    def c
      @connection
    end
    
  end
  
end

