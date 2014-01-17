
module Alembic
  
  class Connection
    
    module Polyfill
      
      def create_window! (wid, parent, x, y, width, height, visual: 0, klass: WINDOW_CLASS_INPUT_OUTPUT, border_width: 0, depth: 0, **hash)
        super(depth, wid, parent, x, y, width, height, border_width, klass, visual, *value_param(CW, hash))
      end
      
      def create_window (*args)
        super(wid = make_resource(Window), *args)
        wid
      end
      
      def change_window_attributes! (window, **hash)
        super(window, *value_param(CW, hash))
      end
      
      def add_to_save_set! (window)
        change_save_set!(SET_MODE_INSERT, window)
      end
      
      def remove_from_save_set! (window)
        change_save_set!(SET_MODE_DELETE, window)
      end
      
      def add_to_save_set (window)
        change_save_set(SET_MODE_INSERT, window)
      end
      
      def remove_from_save_set (window)
        change_save_set(SET_MODE_DELETE, window)
      end
      
      def reparent_window! (window, parent, x = 0, y = 0)
        super(window, parent, x, y)
      end
      
      def configure_window! (window, **hash)
        super(window, *value_param(CONFIG_WINDOW, hash))
      end
      
      def intern_atom! (name, only_if_exists: false)
        super(only_if_exists, name)
      end
      
      def change_property! (window, property, type, format, data, mode: PROP_MODE_REPLACE)
        data_length = data.length
        case format
        when 16
          data = data.pack("s*")
        when 32
          data = data.pack("l*")
        end
        super(mode, window, property, type, format, data_length, data)
      end
      
      def get_property! (window, property, length, offset = 0, delete: false, type: 0)
        super(delete, window, property, type, offset, length)
      end
      
      def get_property_value (*args, default: nil)
        get_property(*args)[:value] || default
      end
      
      def get_property_reply (s)
        r = super(s)
        r.delete(:value_len)
        case r[:format]
        when 0
          r[:value] = nil
        when 16
          r[:value] = r[:value].unpack("s*")
        when 32
          r[:value] = r[:value].unpack("l*")
        end
        r
      end
      
      def send_event! (destination, mask, type, event, propagate: false)
        event = __send__("encode_#{type}_event_hash", event)
        super(propagate, destination, mask, event)
      end
      
      def grab_pointer! (grab_window, event_mask, mode: GRAB_MODE_ASYNC, pointer_mode: nil, keyboard_mode: nil, confine_to: 0, cursor: 0, owner_events: false, time: 0)
        super(owner_events, grab_window, event_mask, pointer_mode || mode, keyboard_mode || mode, confine_to, cursor, time)
      end
      
      def ungrab_pointer! (time = 0)
        super(time)
      end
      
      def grab_button! (grab_window, chord, event_mask, mode: GRAB_MODE_ASYNC, pointer_mode: nil, keyboard_mode: nil, confine_to: 0, cursor: 0, owner_events: false)
        modifiers, button = decode_button_chord(chord)
        super(owner_events, grab_window, event_mask, pointer_mode || mode, keyboard_mode || mode, confine_to, cursor, button, modifiers)
      end
      
      def ungrab_button! (grab_window, chord)
        modifiers, button = decode_chord(chord)
        super(button, grab_window, modifiers)
      end
      
      def grab_keyboard! (grab_window, mode: GRAB_MODE_ASYNC, pointer_mode: nil, keyboard_mode: nil, owner_events: false, time: 0)
        super(owner_events, grab_window, time, pointer_mode || mode, keyboard_mode || mode)
      end
      
      def ungrab_keyboard! (time = 0)
        super(time)
      end
      
      def grab_key! (grab_window, chord, mode: GRAB_MODE_ASYNC, pointer_mode: nil, keyboard_mode: nil, owner_events: false)
        modifiers, key = decode_key_chord(chord)
        super(owner_events, grab_window, modifiers, key, pointer_mode || mode, keyboard_mode || mode)
      end
      
      def ungrab_key! (grab_window, chord)
        modifiers, key = decode_key_chord(chord)
        super(key, grab_window, modifiers)
      end
      
      # allow_events! (mode, time)
      # grab_server! ()
      # ungrab_server! ()
      # query_pointer! (window)
      # get_motion_events! (window, start, stop)
      # translate_coordinates! (src_window, dst_window, src_x, src_y)
      # warp_pointer! (src_window, dst_window, src_x, src_y, src_width, src_height, dst_x, dst_y)
      
      def set_input_focus! (focus, time = 0, revert_to: INPUT_FOCUS_POINTER_ROOT)
        super(revert_to, focus, time)
      end
      
      # get_input_focus! ()
      # query_keymap! ()
      # open_font! (fid, name)
      # close_font! (font)
      # query_font! (font)
      # query_text_extents! (font, string)
      # list_fonts! (max_names, pattern)
      # list_fonts_with_info! (max_names, pattern)
      # set_font_path! (font)
      # get_font_path! ()
      # create_pixmap! (depth, pid, drawable, width, height)
      # free_pixmap! (pixmap)
      
      def create_gc! (cid, drawable, **hash)
        super(cid, drawable, *value_param(GC, hash))
      end
      
      def change_gc! (gc, **hash)
        super(gc, *value_param(GC, hash))
      end
      
      # copy_gc! (src_gc, dst_gc, value_mask)
      # set_dashes! (gc, dash_offset, dashes)
      # set_clip_rectangles! (ordering, gc, clip_x_origin, clip_y_origin, rectangles)
      # free_gc! (gc)
      # clear_area! (exposures, window, x, y, width, height)
      # copy_area! (src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height)
      # copy_plane! (src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height, bit_plane)
      # poly_point! (coordinate_mode, drawable, gc, points)
      # poly_line! (coordinate_mode, drawable, gc, points)
      # poly_segment! (drawable, gc, segments)
      # poly_rectangle! (drawable, gc, rectangles)
      # poly_arc! (drawable, gc, arcs)
      # fill_poly! (drawable, gc, shape, coordinate_mode, points)
      # poly_fill_rectangle! (drawable, gc, rectangles)
      # poly_fill_arc! (drawable, gc, arcs)
      # put_image! (format, drawable, gc, width, height, dst_x, dst_y, left_pad, depth, data)
      # get_image! (format, drawable, x, y, width, height, plane_mask)
      # poly_text8! (drawable, gc, x, y, items)
      # poly_text16! (drawable, gc, x, y, items)
      # image_text8! (drawable, gc, x, y, string)
      # image_text16! (drawable, gc, x, y, string)
      # create_colormap! (alloc, mid, window, visual)
      # free_colormap! (cmap)
      # copy_colormap_and_free! (mid, src_cmap)
      # install_colormap! (cmap)
      # uninstall_colormap! (cmap)
      # list_installed_colormaps! (window)
      # alloc_color! (cmap, red, green, blue)
      # alloc_named_color! (cmap, name)
      # alloc_color_cells! (contiguous, cmap, colors, planes)
      # alloc_color_planes! (contiguous, cmap, colors, reds, greens, blues)
      # free_colors! (cmap, plane_mask, pixels)
      # store_colors! (cmap, items)
      # store_named_color! (flags, cmap, pixel, name)
      # query_colors! (cmap, pixels)
      # lookup_color! (cmap, name)
      # create_cursor! (cid, source, mask, fore_red, fore_green, fore_blue, back_red, back_green, back_blue, x, y)
      # create_glyph_cursor! (cid, source_font, mask_font, source_char, mask_char, fore_red, fore_green, fore_blue, back_red, back_green, back_blue)
      # free_cursor! (cursor)
      # recolor_cursor! (cursor, fore_red, fore_green, fore_blue, back_red, back_green, back_blue)
      # query_best_size! (klass, drawable, width, height)
      # query_extension! (name)
      # list_extensions! ()
      # change_keyboard_mapping! (keycode_count, first_keycode, keysyms_per_keycode, keysyms)
      # get_keyboard_mapping! (first_keycode, count)
      
      def change_keyboard_control! (**hash)
        super(*value_param(KB, hash))
      end
      
      # get_keyboard_control! ()
      # bell! (percent)
      # change_pointer_control! (acceleration_numerator, acceleration_denominator, threshold, do_acceleration, do_threshold)
      # get_pointer_control! ()
      # set_screen_saver! (timeout, interval, prefer_blanking, allow_exposures)
      # get_screen_saver! ()
      # change_hosts! (mode, family, address)
      # list_hosts! ()
      # set_access_control! (mode)
      # set_close_down_mode! (mode)
      # kill_client! (resource)
      # rotate_properties! (window, delta, atoms)
      # force_screen_saver! (mode)
      # set_pointer_mapping! (map)
      # get_pointer_mapping! ()
      # set_modifier_mapping! (keycodes_per_modifier, keycodes)
      # get_modifier_mapping! ()
      # no_operation! ()
      
      def decode_configure_request_event (s)
        e = super(s)
        m = e[:value_mask]
        e.delete(:x) if m & CONFIG_WINDOW_X == 0
        e.delete(:y) if m & CONFIG_WINDOW_Y == 0
        e.delete(:width) if m & CONFIG_WINDOW_WIDTH == 0
        e.delete(:height) if m & CONFIG_WINDOW_HEIGHT == 0
        e.delete(:border_width) if m & CONFIG_WINDOW_BORDER_WIDTH == 0
        e.delete(:sibling) if m & CONFIG_WINDOW_SIBLING == 0
        e.delete(:stack_mode) if m & CONFIG_WINDOW_STACK_MODE == 0
        e
      end
      
      def encode_client_message_event_hash (hash)
        case hash[:format]
        when 32
          hash[:data] = hash[:data].pack("L*")
        when 16
          hash[:data] = hash[:data].pack("S*")
        end
        super(hash)
      end
      
      def encode_client_message_data (s, data)
        data
      end
      
      def decode_client_message_data (s)
        s
      end
      
    end
    
    include Polyfill
    
  end
  
end

