
module Retort
  
  class Reactor < Alembic::Reactor
    
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
            Client.find(child)
          end
        end
        # Set up manager selections.
        unless c.get_selection_owner("WM_S#{i + 1}")
          c.create_window(0, w = c.alloc_window, root, 0, 0, 1, 1, 0, WINDOW_CLASS_INPUT_ONLY, 0, 0)
          c.set_selection_owner(w, "WM_S#{i + 1}", 0)
        end
        1.upto(9) do |i|
          c.grab_key true, root, *c.chord_to_keymask("A-#{i}"), GRAB_MODE_ASYNC, GRAB_MODE_ASYNC
          c.grab_key true, root, *c.chord_to_keymask("A-S-#{i}"), GRAB_MODE_ASYNC, GRAB_MODE_ASYNC
        end
      end
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
      Client.find(e[:window]).map()
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
        cl.unmap if cl.workspace == @current_workspace
      end
      @current_workspace = n
      ObjectSpace.each_object(Client) do |cl|
        cl.map if cl.workspace == @current_workspace
      end
    end
    
    def key_press_event (e)
      1.upto(9).each do |i|
        if c.keyevent_matches_chord("A-#{i}", e)
          show_workspace(i)
        elsif c.keyevent_matches_chord("A-S-#{i}", e)
          if f = Client.focused and i != @current_workspace
            f.workspace = i
            f.unmap
          end
        end
      end
    end
    
  end
  
end
