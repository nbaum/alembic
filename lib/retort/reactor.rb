
module Retort
  
  class Reactor < Alembic::Reactor
    
    attr_accessor :current_workspace
    
    def post_init
      @screens = []
      @current_workspace = 1
      c.query_extension("RANDR")
      c.setup[:roots].each_with_index do |screen, i|
        root = screen[:root]
        # Get RandR screens
        @screens << c.randr_get_screen_resources(root)[:crtcs].map do |crtc|
          ci = c.randr_get_crtc_info(crtc, 0)
          Screen.new(root, ci[:x], ci[:y], ci[:width], ci[:height])
        end
        # Reparenting
        c.change_window_attributes(root, *CW.param(event_mask: EVENT_MASK_SUBSTRUCTURE_REDIRECT))
        # Initialize existing clients
        c.query_tree(root)[:children].each do |child|
          wa = c.get_window_attributes(child)
          unless wa[:override_redirect] or wa[:class] == WINDOW_CLASS_INPUT_ONLY
            cl = Client.find(child)
            #cl.configure(x: 0, y: 0)
          end
        end
        # Set up manager selections.
        unless c.get_selection_owner("WM_S#{i + 1}")
          c.create_window(0, w = c.alloc_window, root, 0, 0, 1, 1, 0, WINDOW_CLASS_INPUT_ONLY, 0, 0)
          c.set_selection_owner(w, "WM_S#{i + 1}", 0)
        end
        1.upto(9) do |i|
          c.grab_key true, root, *c.chord_to_keymask("M-#{i}"), GRAB_MODE_ASYNC, GRAB_MODE_ASYNC
          c.grab_key true, root, *c.chord_to_keymask("M-S-#{i}"), GRAB_MODE_ASYNC, GRAB_MODE_ASYNC
          c.grab_key true, root, *c.chord_to_keymask("M-C-#{i}"), GRAB_MODE_ASYNC, GRAB_MODE_ASYNC
        end
        c.grab_key true, root, *c.chord_to_keymask("M-q"), GRAB_MODE_ASYNC, GRAB_MODE_ASYNC
        c.grab_key true, root, *c.chord_to_keymask("M-c"), GRAB_MODE_ASYNC, GRAB_MODE_ASYNC
        c.grab_key true, root, *c.chord_to_keymask("M-d"), GRAB_MODE_ASYNC, GRAB_MODE_ASYNC
        c.grab_key true, root, *c.chord_to_keymask("M-h"), GRAB_MODE_ASYNC, GRAB_MODE_ASYNC
      end
      c.open_font(@cursor_font = c.alloc_font, "cursor")
      c.create_glyph_cursor(@cursor = c.alloc_cursor, @cursor_font, @cursor_font, 68, 69, 0xFFFF, 0xFFFF, 0xFFFF, 0x0000, 0x0000, 0x0000)
      c.setup[:roots].each_with_index do |screen, i|
        c.change_window_attributes(screen[:root], CW_CURSOR, @cursor.xid)
      end
    rescue => e
      puts e
      puts e.backtrace
    end
    
    def create_notify_event (e)
    end
    
    def destroy_notify_event (e)
      if client = e[:window].client
        client.destroy
      end
    end
    
    def map_notify_event (e)
    end
    
    def unmap_notify_event (e)
      if client = e[:window].client
        client.unmap
      end
    end
    
    def expose_event (e)
      Client.find(e[:window]).render_frame
    end
    
    def reparent_notify_event (e)
    end
    
    def configure_notify_event (e)
    end
    
    def client_message_event (e)
      p e
    end
    
    def property_notify_event (e)
      if prop = c.get_property(false, e[:window], e[:atom], 0, 0, 80)
        prop[:property] = e[:atom]
        Client.find(e[:window]).handle_property(prop[:property].name, prop[:type].name, prop[:value])
      end
    end
    
    def configure_request_event (e)
      Client.find(e[:window]).configure(e)
    end
    
    def map_request_event (e)
      Client.find(e[:window]).map
    end
    
    def button_press_event (e)
      Client.find(e[:event]).button_press(e)
    end
    
    def button_release_event (e)
      Client.find(e[:event]).button_release(e)
    end
    
    def motion_notify_event (e)
      Client.find(e[:event]).motion_notify(e)
    end
    
    def enter_notify_event (e)
      Client.find(e[:event]).enter_notify(e)
    end
    
    def show_workspace (n)
      return if @current_workspace == n
      ObjectSpace.each_object(Client) do |cl|
        cl.change_workspaces([], [], n)
      end
      @current_workspace = n
    end
    
    def key_release_event (e)
    end
    
    def key_press_event (e)
      if c.keyevent_matches_chord("M-q", e)
        exit
      elsif c.keyevent_matches_chord("M-c", e)
        if f = Client.focused
          f.delete(e)
        end
      elsif c.keyevent_matches_chord("M-d", e)
        if f = Client.focused
          f.undecorated = !f.undecorated
        end
      elsif c.keyevent_matches_chord("M-h", e)
        if f = Client.focused
          f.unmap
        end
      else
        1.upto(9).each do |i|
          if c.keyevent_matches_chord("M-#{i}", e)
            show_workspace(i)
          elsif c.keyevent_matches_chord("M-S-#{i}", e)
            if f = Client.focused and i != @current_workspace
              f.change_workspaces([i], [@current_workspace], @current_workspace)
            end
          elsif c.keyevent_matches_chord("M-C-#{i}", e)
            if f = Client.focused
              if f.workspaces.member?(i)
                f.change_workspaces([], [i], @current_workspace)
              else
                f.change_workspaces([i], [], @current_workspace)
              end
            end
          end
        end
      end
    end
    
  end
  
end

