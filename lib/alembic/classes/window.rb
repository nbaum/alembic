
require 'alembic/classes/drawable'

module Alembic
  include Alembic::Extensions::Xproto
  
  class Window < Drawable
    
    def on_expose (event)
    end
    
    def create_window (type, x, y, width, height, depth: 0, border_width: 0, klass: 0, visual: 0, **args)
      c.create_window(depth, w = c.make_resource(type), xid, x, y, width, height, border_width, klass, visual, *c.value_param(CW, args))
      w
    end
    
    def change_attributes (**args)
      c.change_window_attributes(xid, *c.value_param(CW, args))
    end
    
    def attributes ()
      c.get_window_attributes(xid)
    end
    
    def destroy ()
      c.destroy_window(xid)
    end
    
    def destroy_under ()
      c.destroy_subwindows(xid)
    end
    
    def add_to_save_set ()
      c.change_save_set(SET_MODE_INSERT, xid)
    end
    
    def remove_from_save_set ()
      c.change_save_set(SET_MODE_DELETE, xid)
    end
    
    def reparent (parent, x, y)
      c.reparent_window(xid, parent, x, y)
    end
    
    def parent= (parent)
      reparent(parent, 0, 0)
    end
    
    def map ()
      c.map_window(xid)
    end
    
    def unmap ()
      c.unmap_window(xid)
    end
    
    def map_under ()
      c.map_subwindows(xid)
    end
    
    def unmap_under ()
      c.unmap_subwindows(xid)
    end
    
    def change_geometry (**args)
      c.configure_window(xid, *c.value_param(CONFIG_WINDOW, args))
    end
    
    def geometry ()
      geom = c.get_geometry(xid)
      @root ||= geom[:root]
      geom
    end
    
    def raise ()
      c.circulate_window(CIRCULATE_RAISE_LOWEST, xid)
    end
    
    def lower ()
      c.circulate_window(CIRCULATE_LOWER_HIGHEST, xid)
    end
    
    def children ()
      qt = c.query_tree(xid)
      qt[:children].each do |c|
        c.__send__("root=", qt[:root])
      end
    end
    
    def parent ()
      c.query_tree(xid)[:parent]
    end
    
    def root ()
      @root ||= c.query_tree(xid)[:root]
    end
    
    def get_property (name, length = 20, offset: 0, type: 0)
      prop = c.get_property(false, xid, name, type, offset, length)
      return nil unless prop[:type]
      prop
    end
    
    def change_property (mode, name, data, format = nil, type = nil)
      format ||= String === data ? 8 : 32
      type ||= String === data ? "STRING" : "CARDINAL"
      case format
      when 32
        data_len = data.length
        data = data.pack("L*")
      when 16
        data_len = data.length
        data = data.pack("S*")
      when 8
        data = data.to_s
        data_len = data.bytesize
      end
      c.change_property(mode, xid, name, type, format, data_len, data)
    end
    
    def set_property (name, data, format = nil, type = nil)
      change_property(PROP_MODE_REPLACE, name, data, type, format)
    end
    
    def append_property (name, data, format = nil, type = nil)
      change_property(PROP_MODE_APPEND, name, data, type, format)
    end
    
    def prepend_property (name, data, format = nil, type = nil)
      change_property(PROP_MODE_PREPEND, name, data, type, format)
    end
    
    def delete_property ()
      c.delete_property(xid, name)
    end
    
    def properties ()
      c.list_properies(xid)
    end
    
    def send_event (event_mask: 0, propagate: false, **event)
      event = c.__send__("encode_#{event[:event_type]}_hash", event)
      c.send_event(propagate, xid, event_mask, event)
    end
    
    def grab_pointer (owner_events, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, time)
      c.grab_pointer(owner_events, xid, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, time)
    end
    
    def grab_button (owner_events, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, button, modifiers)
      c.grab_button(owner_events, xid, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, button, modifiers)
    end
    
    def ungrab_button (button, modifiers)
      c.ungrab_button(button, xid, modifiers)
    end
    
    def grab_keyboard (owner_events, time, pointer_mode, keyboard_mode)
      c.grab_keyboard(owner_events, xid, time, pointer_mode, keyboard_mode)
    end
    
    def grab_key (owner_events, key, modifiers, pointer_mode, keyboard_mode)
      c.grab_key(owner_events, xid, modifiers, key, pointer_mode, keyboard_mode)
    end
    
    def ungrab_key (key, modifiers)
      c.ungrab_key(key, xid, modifiers)
    end
    
    def query_pointer ()
      c.query_pointer(xid)
    end
    
    def get_motion_events (start, stop)
      c.get_motion_events(xid, start, stop)
    end
    
    def translate_coordinates_to (dst_window, src_x, src_y)
      c.translate_coordinates(xid, dst_window, src_x, src_y)
    end
    
    def translate_coordinates_from (src_window, src_x, src_y)
      c.translate_coordinates(src_window, xid, src_x, src_y)
    end
    
    def warp_pointer_by (dx, dy)
      c.warp_pointer(0, 0, 0, 0, 0, 0, dx, dy)
    end
    
    def warp_pointer_to (x, y)
      c.warp_pointer(0, xid, 0, 0, 0, 0, x, y)
    end
    
    def focus (time = 0)
      c.set_input_focus(INPUT_FOCUS_POINTER_ROOT, xid, time)
    end
    
    def clear_area (exposures, x, y, width, height)
      c.clear_area(exposures, xid, x, y, width, height)
    end
    
    def create_colormap (alloc, visual)
      c.create_colormap(alloc, c = c.make_resource(Colormap), xid, visual)
      c
    end
    
    def list_installed_colormaps ()
      c.list_installed_colormaps(xid)
    end
    
    private
    
    def root= (window)
      @root = window
    end
    
  end
  
end

