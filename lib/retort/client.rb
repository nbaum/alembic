
module Retort
  
  class Client
    
    attr_accessor :child, :frame, :workspace
    
    def self.focused
      @@focused
    end
    
    def self.find (window)
      window.client || Client.new(window)
    end
    
    def initialize (child)
      @@focused ||= nil
      @child = child
      @child.client = self
      @attrs = c.get_window_attributes(child)
      @geom = c.get_geometry(child)
      @geom[:border_width] = 3
      @workspace = 1
      c.create_window(0, @frame = c.alloc_window, @geom[:root], @geom[:x], @geom[:y], @geom[:width], @geom[:height], @geom[:border_width], WINDOW_CLASS_INPUT_OUTPUT, 0, *CW.param(border_pixel: 0x444488, override_redirect: true))
      @frame.client = self
      c.change_window_attributes(@frame, *CW.param(event_mask: EVENT_MASK_BUTTON_PRESS | EVENT_MASK_EXPOSURE | EVENT_MASK_ENTER_WINDOW | EVENT_MASK_SUBSTRUCTURE_NOTIFY | EVENT_MASK_SUBSTRUCTURE_REDIRECT))
      c.change_window_attributes(@child, *CW.param(event_mask: EVENT_MASK_PROPERTY_CHANGE | EVENT_MASK_SUBSTRUCTURE_NOTIFY))
      c.change_save_set(SET_MODE_INSERT, child)
      c.reparent_window(child, @frame, 0, 0)
      configure
      map() if @attrs[:map_state] == MAP_STATE_VIEWABLE
      c.list_properties(child).each do |prop|
        val = c.get_property(false, child, prop, 0, 0, 80)
        handle_property prop.name, val[:type].name, val[:value]
      end
      c.create_gc(@gc = c.alloc_gcontext, frame, 0)
      c.grab_button true, frame, EVENT_MASK_BUTTON_PRESS, GRAB_MODE_ASYNC, GRAB_MODE_ASYNC, 0, 0, *c.chord_to_buttonmask("A-1")
      c.grab_button true, frame, EVENT_MASK_BUTTON_PRESS, GRAB_MODE_ASYNC, GRAB_MODE_ASYNC, 0, 0, *c.chord_to_buttonmask("A-3")
      c.grab_button true, frame, EVENT_MASK_BUTTON_PRESS, GRAB_MODE_ASYNC, GRAB_MODE_ASYNC, 0, 0, *c.chord_to_buttonmask("A-4")
      c.grab_button true, frame, EVENT_MASK_BUTTON_PRESS, GRAB_MODE_ASYNC, GRAB_MODE_ASYNC, 0, 0, *c.chord_to_buttonmask("A-5")
    end
    
    def configure (e = {})
      e = @geom.merge(e)
      @geom[:x] = e[:x]
      @geom[:y] = e[:y]
      @geom[:width] = e[:width]
      @geom[:height] = e[:height]
      c.configure_window(child, *CONFIG_WINDOW.param(@geom.merge(x: 0, y: 20, border_width: 0)))
      c.configure_window(frame, *CONFIG_WINDOW.param(@geom.merge(height: @geom[:height] + 20)))
      c.send_event(false, child, EVENT_MASK_STRUCTURE_NOTIFY, c.encode_configure_notify_event(child, child, 0, @geom[:x], @geom[:y] + 20, @geom[:width], @geom[:height], 1, false))
      map()
    end
    
    def destroy
      c.unmap_window(frame)
      c.destroy_window(frame)
      child.client = nil
    end
    
    def map
      c.map_window(child)
      c.map_window(frame)
      c.change_property(PROP_MODE_REPLACE, child, "WM_STATE", "WM_STATE", 32, [1, 0])
    end
    
    def unmap
      c.unmap_window(frame)
      c.unmap_window(child)
      c.delete_property(child, "WM_STATE")
    end
    
    def frame_title
      "#{@name}"
    end
    
    def render_frame
      if @@focused == self
        c.change_gc(@gc, GC_FOREGROUND, 0x444488)
        c.change_gc(@gc, GC_BACKGROUND, 0x444488)
        c.poly_fill_rectangle(@frame, @gc, [[0, 0, @geom[:width], @geom[:height]]])
        c.change_gc(@gc, GC_FOREGROUND, 0xffffff)
        c.image_text8(@frame, @gc, 2, 12, frame_title)
        c.change_window_attributes(frame, *CW.param(border_pixel: 0x444488))
      else
        c.change_gc(@gc, GC_FOREGROUND, 0xCCCCCC)
        c.change_gc(@gc, GC_BACKGROUND, 0xCCCCCC)
        c.poly_fill_rectangle(@frame, @gc, [[0, 0, @geom[:width], @geom[:height]]])
        c.change_gc(@gc, GC_FOREGROUND, 0x333333)
        c.image_text8(@frame, @gc, 2, 12, frame_title)
        c.change_window_attributes(frame, *CW.param(border_pixel: 0xCCCCCC))
      end
    end
    
    def button_press (e)
      if e[:detail] == 1 or e[:detail] == 3
        c.grab_pointer(true, child, EVENT_MASK_POINTER_MOTION | EVENT_MASK_BUTTON_RELEASE, GRAB_MODE_ASYNC, GRAB_MODE_ASYNC, 0, 0, e[:time])
        @move_event = e
        @move_geom = @geom.dup
      elsif e[:detail] == 4
        c.configure_window(frame, CONFIG_WINDOW_STACK_MODE, STACK_MODE_BELOW)
      elsif e[:detail] == 5
        c.configure_window(frame, CONFIG_WINDOW_STACK_MODE, STACK_MODE_ABOVE)
      end
    end
    
    def button_release (e)
      c.ungrab_pointer(e[:time])
    end
    
    def motion_notify (e)
      c.grab_pointer(true, frame, EVENT_MASK_POINTER_MOTION | EVENT_MASK_BUTTON_RELEASE, GRAB_MODE_ASYNC, GRAB_MODE_ASYNC, 0, 0, e[:time])
      e = c.skip_events(e)
      dx = e[:root_x] - @move_event[:root_x]
      dy = e[:root_y] - @move_event[:root_y]
      if @move_event[:detail] == 1
        configure(x: @move_geom[:x] + dx, y: @move_geom[:y] + dy)
      else
        configure(width: [0, @move_geom[:width] + dx].max, height: [0, @move_geom[:height] + dy].max)
      end
    end
    
    def atom (name)
      Atom.to_xid(c, name)
    end
    
    def focus (e = nil)
      return if @@focused == self
      if f = @@focused
        @@focused = nil
        f.render_frame
      end
      if @protocols.member?("WM_TAKE_FOCUS") and e
        c.send_event(false, child, 0, c.encode_client_message_event(32, child, "WM_PROTOCOLS", [atom("WM_TAKE_FOCUS"), e[:time]]))
      else
        c.set_input_focus(INPUT_FOCUS_PARENT, child, 0);
      end
      @@focused = self
      render_frame
    end
    
    def enter_notify (e)
      focus(e)
    end
    
    def handle_property (name, type, value)
      #puts name
      case name
      when "WM_PROTOCOLS"
        @protocols = value.map{|x|Atom[c, x].name}
      when "WM_NORMAL_HINTS"
        @normal_hints = value
      when "WM_HINTS"
        @hints = value
      when "WM_NAME"
        @name = value
        render_frame
      when "WM_CLASS"
        @class = value.unpack("Z*Z*")
      when "WM_COMMAND"
        @command = value
      when "WM_LOCALE_NAME"
        @locale = value
      when "WM_ICON_NAME"
        @icon_name = value
      when "WM_WINDOW_ROLE"
        @role = value
      when "WM_CLIENT_MACHINE"
        @machine = value
      when "WM_CLIENT_LEADER"
        @leader = value
      when "WM_TRANSIENT_FOR"
        @owner = value
      when "WM_STATE"
      when "XdndAware"
      when /^_NET_WM_/
        # Ignore for now
      when /^_GTK_/
        # Ignore indefinitely
      else
        p [name, value]
      end
    end
    
  private
    
    def c
      child.connection
    end
    
  end
  
end

