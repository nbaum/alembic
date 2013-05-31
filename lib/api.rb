module Connection::GeneratedAPI

  def create_window (depth, wid, parent, x, y, width, height, border_width, klass, visual, value_mask, value_list)
    req "CCSLLssSSSSLL[L]", 1, depth, 0, wid, parent, x, y, width, height, border_width, klass, visual, value_mask, value_list
  end

  def change_window_attributes (window, value_mask, value_list)
    req "Cp1SLL[L]", 2, 0, window, value_mask, value_list
  end

  def get_window_attributes (window)
    req "Cp1SL", 3, 0, window
    reply "<backing_store>C<visual>L<class>S<bit_gravity>C<win_gravity>C<backing_planes>L<backing_pixel>L<save_under>C<map_is_installed>C<map_state>C<override_redirect>C<colormap>L<all_event_masks>L<your_event_mask>L<do_not_propagate_mask>Sp2"
  end

  def destroy_window (window)
    req "Cp1SL", 4, 0, window
  end

  def destroy_subwindows (window)
    req "Cp1SL", 5, 0, window
  end

  def change_save_set (mode, window)
    req "CCSL", 6, mode, 0, window
  end

  def reparent_window (window, parent, x, y)
    req "Cp1SLLss", 7, 0, window, parent, x, y
  end

  def map_window (window)
    req "Cp1SL", 8, 0, window
  end

  def map_subwindows (window)
    req "Cp1SL", 9, 0, window
  end

  def unmap_window (window)
    req "Cp1SL", 10, 0, window
  end

  def unmap_subwindows (window)
    req "Cp1SL", 11, 0, window
  end

  def configure_window (window, value_mask, value_list)
    req "Cp1SLp2S[L]", 12, 0, window, value_mask, value_list
  end

  def circulate_window (direction, window)
    req "CCSL", 13, direction, 0, window
  end

  def get_geometry (drawable)
    req "Cp1SL", 14, 0, drawable
    reply "<depth>C<root>L<x>s<y>s<width>S<height>S<border_width>Sp2"
  end

  def query_tree (window)
    req "Cp1SL", 15, 0, window
"children_len"
    reply "p1<root>L<parent>L<children_len>Sp14<children>[3L]"
  end

  def intern_atom (only_if_exists, name_len, name)
    req "CCSSp2a", 16, only_if_exists, 0, name_len, name
    reply "p1<atom>L"
  end

  def get_atom_name (atom)
    req "Cp1SL", 17, 0, atom
"name_len"
    reply "p1<name_len>Sp22<name>a1"
  end

  def change_property (mode, window, property, type, format, data_len, data)
    req "CCSLLLCp3La", 18, mode, 0, window, property, type, format, data_len, data
  end

  def delete_property (window, property)
    req "Cp1SLL", 19, 0, window, property
  end

  def get_property (delete, window, property, type, long_offset, long_length)
    req "CCSLLLLL", 20, delete, 0, window, property, type, long_offset, long_length
"value_lenformat"
    reply "<format>C<type>L<bytes_after>L<value_len>Lp12<value>a"
  end

  def list_properties (window)
    req "Cp1SL", 21, 0, window
"atoms_len"
    reply "p1<atoms_len>Sp22<atoms>[1L]"
  end

  def set_selection_owner (owner, selection, time)
    req "Cp1SLLL", 22, 0, owner, selection, time
  end

  def get_selection_owner (selection)
    req "Cp1SL", 23, 0, selection
    reply "p1<owner>L"
  end

  def convert_selection (requestor, selection, target, property, time)
    req "Cp1SLLLLL", 24, 0, requestor, selection, target, property, time
  end

  def send_event (propagate, destination, event_mask, event)
    req "CCSLLa", 25, propagate, 0, destination, event_mask, event
  end

  def grab_pointer (owner_events, grab_window, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, time)
    req "CCSLSCCLLL", 26, owner_events, 0, grab_window, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, time
    reply "<status>C"
  end

  def ungrab_pointer (time)
    req "Cp1SL", 27, 0, time
  end

  def grab_button (owner_events, grab_window, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, button, modifiers)
    req "CCSLSCCLLCp1S", 28, owner_events, 0, grab_window, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, button, modifiers
  end

  def ungrab_button (button, grab_window, modifiers)
    req "CCSLSp2", 29, button, 0, grab_window, modifiers
  end

  def change_active_pointer_grab (cursor, time, event_mask)
    req "Cp1SLLSp2", 30, 0, cursor, time, event_mask
  end

  def grab_keyboard (owner_events, grab_window, time, pointer_mode, keyboard_mode)
    req "CCSLLCCp2", 31, owner_events, 0, grab_window, time, pointer_mode, keyboard_mode
    reply "<status>C"
  end

  def ungrab_keyboard (time)
    req "Cp1SL", 32, 0, time
  end

  def grab_key (owner_events, grab_window, modifiers, key, pointer_mode, keyboard_mode)
    req "CCSLSCCCp3", 33, owner_events, 0, grab_window, modifiers, key, pointer_mode, keyboard_mode
  end

  def ungrab_key (key, grab_window, modifiers)
    req "CCSLSp2", 34, key, 0, grab_window, modifiers
  end

  def allow_events (mode, time)
    req "CCSL", 35, mode, 0, time
  end

  def grab_server ()
    req "Cp1S", 36, 0
  end

  def ungrab_server ()
    req "Cp1S", 37, 0
  end

  def query_pointer (window)
    req "Cp1SL", 38, 0, window
    reply "<same_screen>C<root>L<child>L<root_x>s<root_y>s<win_x>s<win_y>s<mask>Sp2"
  end

  def get_motion_events (window, start, stop)
    req "Cp1SLLL", 39, 0, window, start, stop
"events_len"
    reply "p1<events_len>Lp20<events>[1{<time>L<x>s<y>s}]"
  end

  def translate_coordinates (src_window, dst_window, src_x, src_y)
    req "Cp1SLLss", 40, 0, src_window, dst_window, src_x, src_y
    reply "<same_screen>C<child>L<dst_x>s<dst_y>s"
  end

  def warp_pointer (src_window, dst_window, src_x, src_y, src_width, src_height, dst_x, dst_y)
    req "Cp1SLLssSSss", 41, 0, src_window, dst_window, src_x, src_y, src_width, src_height, dst_x, dst_y
  end

  def set_input_focus (revert_to, focus, time)
    req "CCSLL", 42, revert_to, 0, focus, time
  end

  def get_input_focus ()
    req "Cp1S", 43, 0
    reply "<revert_to>C<focus>L"
  end

  def query_keymap ()
    req "Cp1S", 44, 0
""
    reply "p1<keys>[c]"
  end

  def open_font (fid, name_len, name)
    req "Cp1SLSp2a", 45, 0, fid, name_len, name
  end

  def close_font (font)
    req "Cp1SL", 46, 0, font
  end

  def query_font (font)
    req "Cp1SL", 47, 0, font
"properties_len"
"char_infos_len"
    reply "p1<min_bounds>{<lsb>s<rsb>s<cw>s<a>s<d>s<attr>S}p4<max_bounds>{<lsb>s<rsb>s<cw>s<a>s<d>s<attr>S}p4<min_char_or_byte2>S<max_char_or_byte2>S<default_char>S<properties_len>S<draw_direction>C<min_byte1>C<max_byte1>C<all_chars_exist>C<font_ascent>s<font_descent>s<char_infos_len>L<properties>[6{<name>L<value>L}]<char_infos>[13{<lsb>s<rsb>s<cw>s<a>s<d>s<attr>S}]"
  end

  def query_text_extents (odd_length, font, string)
    req "CCSL[S]", 48, odd_length, 0, font, string
    reply "<draw_direction>C<font_ascent>s<font_descent>s<overall_ascent>s<overall_descent>s<overall_width>l<overall_left>l<overall_right>l"
  end

  def list_fonts (max_names, pattern_len, pattern)
    req "Cp1SSSa", 49, 0, max_names, pattern_len, pattern
"names_len"
    reply "p1<names_len>Sp22<names>[1A]"
  end

  def list_fonts_with_info (max_names, pattern_len, pattern)
    req "Cp1SSSa", 50, 0, max_names, pattern_len, pattern
"properties_len"
"name_len"
    reply "<name_len>C<min_bounds>{<lsb>s<rsb>s<cw>s<a>s<d>s<attr>S}p4<max_bounds>{<lsb>s<rsb>s<cw>s<a>s<d>s<attr>S}p4<min_char_or_byte2>S<max_char_or_byte2>S<default_char>S<properties_len>S<draw_direction>C<min_byte1>C<max_byte1>C<all_chars_exist>C<font_ascent>s<font_descent>s<replies_hint>L<properties>[7{<name>L<value>L}]<name>a1"
  end

  def set_font_path (font_qty, font)
    req "Cp1SSp2[A]", 51, 0, font_qty, font
  end

  def get_font_path ()
    req "Cp1S", 52, 0
"path_len"
    reply "p1<path_len>Sp22<path>[1A]"
  end

  def create_pixmap (depth, pid, drawable, width, height)
    req "CCSLLSS", 53, depth, 0, pid, drawable, width, height
  end

  def free_pixmap (pixmap)
    req "Cp1SL", 54, 0, pixmap
  end

  def create_gc (cid, drawable, value_mask, value_list)
    req "Cp1SLLL[L]", 55, 0, cid, drawable, value_mask, value_list
  end

  def change_gc (gc, value_mask, value_list)
    req "Cp1SLL[L]", 56, 0, gc, value_mask, value_list
  end

  def copy_gc (src_gc, dst_gc, value_mask)
    req "Cp1SLLL", 57, 0, src_gc, dst_gc, value_mask
  end

  def set_dashes (gc, dash_offset, dashes_len, dashes)
    req "Cp1SLSS[c]", 58, 0, gc, dash_offset, dashes_len, dashes
  end

  def set_clip_rectangles (ordering, gc, clip_x_origin, clip_y_origin, rectangles)
    req "CCSLss[[ssSS]]", 59, ordering, 0, gc, clip_x_origin, clip_y_origin, rectangles
  end

  def free_gc (gc)
    req "Cp1SL", 60, 0, gc
  end

  def clear_area (exposures, window, x, y, width, height)
    req "CCSLssSS", 61, exposures, 0, window, x, y, width, height
  end

  def copy_area (src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height)
    req "Cp1SLLLssssSS", 62, 0, src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height
  end

  def copy_plane (src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height, bit_plane)
    req "Cp1SLLLssssSSL", 63, 0, src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height, bit_plane
  end

  def poly_point (coordinate_mode, drawable, gc, points)
    req "CCSLL[[ss]]", 64, coordinate_mode, 0, drawable, gc, points
  end

  def poly_line (coordinate_mode, drawable, gc, points)
    req "CCSLL[[ss]]", 65, coordinate_mode, 0, drawable, gc, points
  end

  def poly_segment (drawable, gc, segments)
    req "Cp1SLL[[ssss]]", 66, 0, drawable, gc, segments
  end

  def poly_rectangle (drawable, gc, rectangles)
    req "Cp1SLL[[ssSS]]", 67, 0, drawable, gc, rectangles
  end

  def poly_arc (drawable, gc, arcs)
    req "Cp1SLL[[ssSSss]]", 68, 0, drawable, gc, arcs
  end

  def fill_poly (drawable, gc, shape, coordinate_mode, points)
    req "Cp1SLLCCp2[[ss]]", 69, 0, drawable, gc, shape, coordinate_mode, points
  end

  def poly_fill_rectangle (drawable, gc, rectangles)
    req "Cp1SLL[[ssSS]]", 70, 0, drawable, gc, rectangles
  end

  def poly_fill_arc (drawable, gc, arcs)
    req "Cp1SLL[[ssSSss]]", 71, 0, drawable, gc, arcs
  end

  def put_image (format, drawable, gc, width, height, dst_x, dst_y, left_pad, depth, data)
    req "CCSLLSSssCCp2a", 72, format, 0, drawable, gc, width, height, dst_x, dst_y, left_pad, depth, data
  end

  def get_image (format, drawable, x, y, width, height, plane_mask)
    req "CCSLssSSL", 73, format, 0, drawable, x, y, width, height, plane_mask
"length"
    reply "<depth>C<visual>Lp20<data>a"
  end

  def poly_text8 (drawable, gc, x, y, items)
    req "Cp1SLLssa", 74, 0, drawable, gc, x, y, items
  end

  def poly_text16 (drawable, gc, x, y, items)
    req "Cp1SLLssa", 75, 0, drawable, gc, x, y, items
  end

  def image_text8 (string_len, drawable, gc, x, y, string)
    req "CCSLLssa", 76, string_len, 0, drawable, gc, x, y, string
  end

  def image_text16 (string_len, drawable, gc, x, y, string)
    req "CCSLLss[S]", 77, string_len, 0, drawable, gc, x, y, string
  end

  def create_colormap (alloc, mid, window, visual)
    req "CCSLLL", 78, alloc, 0, mid, window, visual
  end

  def free_colormap (cmap)
    req "Cp1SL", 79, 0, cmap
  end

  def copy_colormap_and_free (mid, src_cmap)
    req "Cp1SLL", 80, 0, mid, src_cmap
  end

  def install_colormap (cmap)
    req "Cp1SL", 81, 0, cmap
  end

  def uninstall_colormap (cmap)
    req "Cp1SL", 82, 0, cmap
  end

  def list_installed_colormaps (window)
    req "Cp1SL", 83, 0, window
"cmaps_len"
    reply "p1<cmaps_len>Sp22<cmaps>[1L]"
  end

  def alloc_color (cmap, red, green, blue)
    req "Cp1SLSSSp2", 84, 0, cmap, red, green, blue
    reply "p1<red>S<green>S<blue>Sp2<pixel>L"
  end

  def alloc_named_color (cmap, name_len, name)
    req "Cp1SLSp2a", 85, 0, cmap, name_len, name
    reply "p1<pixel>L<exact_red>S<exact_green>S<exact_blue>S<visual_red>S<visual_green>S<visual_blue>S"
  end

  def alloc_color_cells (contiguous, cmap, colors, planes)
    req "CCSLSS", 86, contiguous, 0, cmap, colors, planes
"pixels_len"
"masks_len"
    reply "p1<pixels_len>S<masks_len>Sp20<pixels>[1L]<masks>[2L]"
  end

  def alloc_color_planes (contiguous, cmap, colors, reds, greens, blues)
    req "CCSLSSSS", 87, contiguous, 0, cmap, colors, reds, greens, blues
"pixels_len"
    reply "p1<pixels_len>Sp2<red_mask>L<green_mask>L<blue_mask>Lp8<pixels>[1L]"
  end

  def free_colors (cmap, plane_mask, pixels)
    req "Cp1SLL[L]", 88, 0, cmap, plane_mask, pixels
  end

  def store_colors (cmap, items)
    req "Cp1SL[[LSSSCp]]", 89, 0, cmap, items
  end

  def store_named_color (flags, cmap, pixel, name_len, name)
    req "CCSLLSp2a", 90, flags, 0, cmap, pixel, name_len, name
  end

  def query_colors (cmap, pixels)
    req "Cp1SL[L]", 91, 0, cmap, pixels
"colors_len"
    reply "p1<colors_len>Sp22<colors>[1{<red>S<green>S<blue>Sp2}]"
  end

  def lookup_color (cmap, name_len, name)
    req "Cp1SLSp2a", 92, 0, cmap, name_len, name
    reply "p1<exact_red>S<exact_green>S<exact_blue>S<visual_red>S<visual_green>S<visual_blue>S"
  end

  def create_cursor (cid, source, mask, fore_red, fore_green, fore_blue, back_red, back_green, back_blue, x, y)
    req "Cp1SLLLSSSSSSSS", 93, 0, cid, source, mask, fore_red, fore_green, fore_blue, back_red, back_green, back_blue, x, y
  end

  def create_glyph_cursor (cid, source_font, mask_font, source_char, mask_char, fore_red, fore_green, fore_blue, back_red, back_green, back_blue)
    req "Cp1SLLLSSSSSSSS", 94, 0, cid, source_font, mask_font, source_char, mask_char, fore_red, fore_green, fore_blue, back_red, back_green, back_blue
  end

  def free_cursor (cursor)
    req "Cp1SL", 95, 0, cursor
  end

  def recolor_cursor (cursor, fore_red, fore_green, fore_blue, back_red, back_green, back_blue)
    req "Cp1SLSSSSSS", 96, 0, cursor, fore_red, fore_green, fore_blue, back_red, back_green, back_blue
  end

  def query_best_size (klass, drawable, width, height)
    req "CCSLSS", 97, klass, 0, drawable, width, height
    reply "p1<width>S<height>S"
  end

  def query_extension (name_len, name)
    req "Cp1SSp2a", 98, 0, name_len, name
    reply "p1<present>C<major_opcode>C<first_event>C<first_error>C"
  end

  def list_extensions ()
    req "Cp1S", 99, 0
"names_len"
    reply "<names_len>Cp24<names>[1A]"
  end

  def change_keyboard_mapping (keycode_count, first_keycode, keysyms_per_keycode, keysyms)
    req "CCSCCp2[L]", 100, keycode_count, 0, first_keycode, keysyms_per_keycode, keysyms
  end

  def get_keyboard_mapping (first_keycode, count)
    req "Cp1SCC", 101, 0, first_keycode, count
"length"
    reply "<keysyms_per_keycode>Cp24<keysyms>[L]"
  end

  def change_keyboard_control (value_mask, value_list)
    req "Cp1SL[L]", 102, 0, value_mask, value_list
  end

  def get_keyboard_control ()
    req "Cp1S", 103, 0
""
    reply "<global_auto_repeat>C<led_mask>L<key_click_percent>C<bell_percent>C<bell_pitch>S<bell_duration>Sp2<auto_repeats>[c]"
  end

  def bell (percent)
    req "CcS", 104, percent, 0
  end

  def change_pointer_control (acceleration_numerator, acceleration_denominator, threshold, do_acceleration, do_threshold)
    req "Cp1SsssCC", 105, 0, acceleration_numerator, acceleration_denominator, threshold, do_acceleration, do_threshold
  end

  def get_pointer_control ()
    req "Cp1S", 106, 0
    reply "p1<acceleration_numerator>S<acceleration_denominator>S<threshold>Sp18"
  end

  def set_screen_saver (timeout, interval, prefer_blanking, allow_exposures)
    req "Cp1SssCC", 107, 0, timeout, interval, prefer_blanking, allow_exposures
  end

  def get_screen_saver ()
    req "Cp1S", 108, 0
    reply "p1<timeout>S<interval>S<prefer_blanking>C<allow_exposures>Cp18"
  end

  def change_hosts (mode, family, address_len, address)
    req "CCSCp1Sa", 109, mode, 0, family, address_len, address
  end

  def list_hosts ()
    req "Cp1S", 110, 0
"hosts_len"
    reply "<mode>C<hosts_len>Sp22<hosts>[2{<family>Cp1<address_len>Sa2}]"
  end

  def set_access_control (mode)
    req "CCS", 111, mode, 0
  end

  def set_close_down_mode (mode)
    req "CCS", 112, mode, 0
  end

  def kill_client (resource)
    req "Cp1SL", 113, 0, resource
  end

  def rotate_properties (window, atoms_len, delta, atoms)
    req "Cp1SLSs[L]", 114, 0, window, atoms_len, delta, atoms
  end

  def force_screen_saver (mode)
    req "CCS", 115, mode, 0
  end

  def set_pointer_mapping (map_len, map)
    req "CCS[c]", 116, map_len, 0, map
    reply "<status>C"
  end

  def get_pointer_mapping ()
    req "Cp1S", 117, 0
"map_len"
    reply "<map_len>Cp24<map>[1c]"
  end

  def set_modifier_mapping (keycodes_per_modifier, keycodes)
    req "CCS[c]", 118, keycodes_per_modifier, 0, keycodes
    reply "<status>C"
  end

  def get_modifier_mapping ()
    req "Cp1S", 119, 0
"keycodes_per_modifier"
    reply "<keycodes_per_modifier>Cp24<keycodes>[1c]"
  end

  def no_operation ()
    req "Cp1S", 127, 0
  end

end
