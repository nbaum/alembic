
module Alembic
  
  register_extension nil
  
  # create_window (depth, wid, parent, x, y, width, height, border_width, klass, visual, value_mask, *value_list)
  # change_window_attributes (window, value_mask, *value_list)
  # get_window_attributes (window)
  # destroy_window (window)
  # destroy_subwindows (window)
  # change_save_set (mode, window)
  # reparent_window (window, parent, x, y)
  # map_window (window)
  # map_subwindows (window)
  # unmap_window (window)
  # unmap_subwindows (window)
  # configure_window (window, value_mask, *value_list)
  # circulate_window (direction, window)
  # get_geometry (drawable)
  # query_tree (window)
  # intern_atom (only_if_exists, name)
  # get_atom_name (atom)
  # change_property (mode, window, property, type, format, data_len, data)
  # delete_property (window, property)
  # get_property (delete, window, property, type, long_offset, long_length)
  # list_properties (window)
  # set_selection_owner (owner, selection, time)
  # get_selection_owner (selection)
  # convert_selection (requestor, selection, target, property, time)
  # send_event (propagate, destination, event_mask, event)
  # grab_pointer (owner_events, grab_window, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, time)
  # ungrab_pointer (time)
  # grab_button (owner_events, grab_window, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, button, modifiers)
  # ungrab_button (button, grab_window, modifiers)
  # change_active_pointer_grab (cursor, time, event_mask)
  # grab_keyboard (owner_events, grab_window, time, pointer_mode, keyboard_mode)
  # ungrab_keyboard (time)
  # grab_key (owner_events, grab_window, modifiers, key, pointer_mode, keyboard_mode)
  # ungrab_key (key, grab_window, modifiers)
  # allow_events (mode, time)
  # grab_server ()
  # ungrab_server ()
  # query_pointer (window)
  # get_motion_events (window, start, stop)
  # translate_coordinates (src_window, dst_window, src_x, src_y)
  # warp_pointer (src_window, dst_window, src_x, src_y, src_width, src_height, dst_x, dst_y)
  # set_input_focus (revert_to, focus, time)
  # get_input_focus ()
  # query_keymap ()
  # open_font (fid, name)
  # close_font (font)
  # query_font (font)
  # query_text_extents (font, string)
  # list_fonts (max_names, pattern)
  # list_fonts_with_info (max_names, pattern)
  # set_font_path (font)
  # get_font_path ()
  # create_pixmap (depth, pid, drawable, width, height)
  # free_pixmap (pixmap)
  # create_gc (cid, drawable, value_mask, *value_list)
  # change_gc (gc, value_mask, *value_list)
  # copy_gc (src_gc, dst_gc, value_mask)
  # set_dashes (gc, dash_offset, dashes)
  # set_clip_rectangles (ordering, gc, clip_x_origin, clip_y_origin, rectangles)
  # free_gc (gc)
  # clear_area (exposures, window, x, y, width, height)
  # copy_area (src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height)
  # copy_plane (src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height, bit_plane)
  # poly_point (coordinate_mode, drawable, gc, points)
  # poly_line (coordinate_mode, drawable, gc, points)
  # poly_segment (drawable, gc, segments)
  # poly_rectangle (drawable, gc, rectangles)
  # poly_arc (drawable, gc, arcs)
  # fill_poly (drawable, gc, shape, coordinate_mode, points)
  # poly_fill_rectangle (drawable, gc, rectangles)
  # poly_fill_arc (drawable, gc, arcs)
  # put_image (format, drawable, gc, width, height, dst_x, dst_y, left_pad, depth, data)
  # get_image (format, drawable, x, y, width, height, plane_mask)
  # poly_text8 (drawable, gc, x, y, items)
  # poly_text16 (drawable, gc, x, y, items)
  # image_text8 (drawable, gc, x, y, string)
  # image_text16 (drawable, gc, x, y, string)
  # create_colormap (alloc, mid, window, visual)
  # free_colormap (cmap)
  # copy_colormap_and_free (mid, src_cmap)
  # install_colormap (cmap)
  # uninstall_colormap (cmap)
  # list_installed_colormaps (window)
  # alloc_color (cmap, red, green, blue)
  # alloc_named_color (cmap, name)
  # alloc_color_cells (contiguous, cmap, colors, planes)
  # alloc_color_planes (contiguous, cmap, colors, reds, greens, blues)
  # free_colors (cmap, plane_mask, pixels)
  # store_colors (cmap, items)
  # store_named_color (flags, cmap, pixel, name)
  # query_colors (cmap, pixels)
  # lookup_color (cmap, name)
  # create_cursor (cid, source, mask, fore_red, fore_green, fore_blue, back_red, back_green, back_blue, x, y)
  # create_glyph_cursor (cid, source_font, mask_font, source_char, mask_char, fore_red, fore_green, fore_blue, back_red, back_green, back_blue)
  # free_cursor (cursor)
  # recolor_cursor (cursor, fore_red, fore_green, fore_blue, back_red, back_green, back_blue)
  # query_best_size (klass, drawable, width, height)
  # query_extension (name)
  # list_extensions ()
  # change_keyboard_mapping (keycode_count, first_keycode, keysyms_per_keycode, keysyms)
  # get_keyboard_mapping (first_keycode, count)
  # change_keyboard_control (value_mask, *value_list)
  # get_keyboard_control ()
  # bell (percent)
  # change_pointer_control (acceleration_numerator, acceleration_denominator, threshold, do_acceleration, do_threshold)
  # get_pointer_control ()
  # set_screen_saver (timeout, interval, prefer_blanking, allow_exposures)
  # get_screen_saver ()
  # change_hosts (mode, family, address)
  # list_hosts ()
  # set_access_control (mode)
  # set_close_down_mode (mode)
  # kill_client (resource)
  # rotate_properties (window, delta, atoms)
  # force_screen_saver (mode)
  # set_pointer_mapping (map)
  # get_pointer_mapping ()
  # set_modifier_mapping (keycodes_per_modifier, keycodes)
  # get_modifier_mapping ()
  # no_operation ()
  
  # key_press_event (detail, time, root, event, child, root_x, root_y, event_x, event_y, state, same_screen)
  # key_release_event (detail, time, root, event, child, root_x, root_y, event_x, event_y, state, same_screen)
  # button_press_event (detail, time, root, event, child, root_x, root_y, event_x, event_y, state, same_screen)
  # button_release_event (detail, time, root, event, child, root_x, root_y, event_x, event_y, state, same_screen)
  # motion_notify_event (detail, time, root, event, child, root_x, root_y, event_x, event_y, state, same_screen)
  # enter_notify_event (detail, time, root, event, child, root_x, root_y, event_x, event_y, state, mode, same_screen_focus)
  # leave_notify_event (detail, time, root, event, child, root_x, root_y, event_x, event_y, state, mode, same_screen_focus)
  # focus_in_event (detail, event, mode)
  # focus_out_event (detail, event, mode)
  # keymap_notify_event (keys)
  # expose_event (window, x, y, width, height, count)
  # graphics_exposure_event (drawable, x, y, width, height, minor_opcode, count, major_opcode)
  # no_exposure_event (drawable, minor_opcode, major_opcode)
  # visibility_notify_event (window, state)
  # create_notify_event (parent, window, x, y, width, height, border_width, override_redirect)
  # destroy_notify_event (event, window)
  # unmap_notify_event (event, window, from_configure)
  # map_notify_event (event, window, override_redirect)
  # map_request_event (parent, window)
  # reparent_notify_event (event, window, parent, x, y, override_redirect)
  # configure_notify_event (event, window, above_sibling, x, y, width, height, border_width, override_redirect)
  # configure_request_event (stack_mode, parent, window, sibling, x, y, width, height, border_width, value_mask)
  # gravity_notify_event (event, window, x, y)
  # resize_request_event (window, width, height)
  # circulate_notify_event (event, window, place)
  # circulate_request_event (event, window, place)
  # property_notify_event (window, atom, time, state)
  # selection_clear_event (time, owner, selection)
  # selection_request_event (time, owner, requestor, selection, target, property)
  # selection_notify_event (time, requestor, selection, target, property)
  # colormap_notify_event (window, colormap, new, state)
  # client_message_event (format, window, type, data)
  # mapping_notify_event (request, first_keycode, count)
  # ge_generic_event ()
  
  VISUAL_CLASS = {:static_gray=>0, :gray_scale=>1, :static_color=>2, :pseudo_color=>3, :true_color=>4, :direct_color=>5}
  VISUAL_CLASS_I = {0=>:static_gray, 1=>:gray_scale, 2=>:static_color, 3=>:pseudo_color, 4=>:true_color, 5=>:direct_color}
  
  VISUAL_CLASS_STATIC_GRAY = 0
  VISUAL_CLASS_GRAY_SCALE = 1
  VISUAL_CLASS_STATIC_COLOR = 2
  VISUAL_CLASS_PSEUDO_COLOR = 3
  VISUAL_CLASS_TRUE_COLOR = 4
  VISUAL_CLASS_DIRECT_COLOR = 5
  
  EVENT_MASK = {:no_event=>0, :key_press=>1, :key_release=>2, :button_press=>4, :button_release=>8, :enter_window=>16, :leave_window=>32, :pointer_motion=>64, :pointer_motion_hint=>128, :button1motion=>256, :button2motion=>512, :button3motion=>1024, :button4motion=>2048, :button5motion=>4096, :button_motion=>8192, :keymap_state=>16384, :exposure=>32768, :visibility_change=>65536, :structure_notify=>131072, :resize_redirect=>262144, :substructure_notify=>524288, :substructure_redirect=>1048576, :focus_change=>2097152, :property_change=>4194304, :color_map_change=>8388608, :owner_grab_button=>16777216}
  EVENT_MASK_I = {0=>:no_event, 1=>:key_press, 2=>:key_release, 4=>:button_press, 8=>:button_release, 16=>:enter_window, 32=>:leave_window, 64=>:pointer_motion, 128=>:pointer_motion_hint, 256=>:button1motion, 512=>:button2motion, 1024=>:button3motion, 2048=>:button4motion, 4096=>:button5motion, 8192=>:button_motion, 16384=>:keymap_state, 32768=>:exposure, 65536=>:visibility_change, 131072=>:structure_notify, 262144=>:resize_redirect, 524288=>:substructure_notify, 1048576=>:substructure_redirect, 2097152=>:focus_change, 4194304=>:property_change, 8388608=>:color_map_change, 16777216=>:owner_grab_button}
  
  EVENT_MASK_NO_EVENT = 0
  EVENT_MASK_KEY_PRESS = 1
  EVENT_MASK_KEY_RELEASE = 2
  EVENT_MASK_BUTTON_PRESS = 4
  EVENT_MASK_BUTTON_RELEASE = 8
  EVENT_MASK_ENTER_WINDOW = 16
  EVENT_MASK_LEAVE_WINDOW = 32
  EVENT_MASK_POINTER_MOTION = 64
  EVENT_MASK_POINTER_MOTION_HINT = 128
  EVENT_MASK_BUTTON1MOTION = 256
  EVENT_MASK_BUTTON2MOTION = 512
  EVENT_MASK_BUTTON3MOTION = 1024
  EVENT_MASK_BUTTON4MOTION = 2048
  EVENT_MASK_BUTTON5MOTION = 4096
  EVENT_MASK_BUTTON_MOTION = 8192
  EVENT_MASK_KEYMAP_STATE = 16384
  EVENT_MASK_EXPOSURE = 32768
  EVENT_MASK_VISIBILITY_CHANGE = 65536
  EVENT_MASK_STRUCTURE_NOTIFY = 131072
  EVENT_MASK_RESIZE_REDIRECT = 262144
  EVENT_MASK_SUBSTRUCTURE_NOTIFY = 524288
  EVENT_MASK_SUBSTRUCTURE_REDIRECT = 1048576
  EVENT_MASK_FOCUS_CHANGE = 2097152
  EVENT_MASK_PROPERTY_CHANGE = 4194304
  EVENT_MASK_COLOR_MAP_CHANGE = 8388608
  EVENT_MASK_OWNER_GRAB_BUTTON = 16777216
  
  BACKING_STORE = {:not_useful=>0, :when_mapped=>1, :always=>2}
  BACKING_STORE_I = {0=>:not_useful, 1=>:when_mapped, 2=>:always}
  
  BACKING_STORE_NOT_USEFUL = 0
  BACKING_STORE_WHEN_MAPPED = 1
  BACKING_STORE_ALWAYS = 2
  
  IMAGE_ORDER = {:lsb_first=>0, :msb_first=>1}
  IMAGE_ORDER_I = {0=>:lsb_first, 1=>:msb_first}
  
  IMAGE_ORDER_LSB_FIRST = 0
  IMAGE_ORDER_MSB_FIRST = 1
  
  MOD_MASK = {:shift=>1, :lock=>2, :control=>4, :"1"=>8, :"2"=>16, :"3"=>32, :"4"=>64, :"5"=>128, :any=>32768}
  MOD_MASK_I = {1=>:shift, 2=>:lock, 4=>:control, 8=>:"1", 16=>:"2", 32=>:"3", 64=>:"4", 128=>:"5", 32768=>:any}
  
  MOD_MASK_SHIFT = 1
  MOD_MASK_LOCK = 2
  MOD_MASK_CONTROL = 4
  MOD_MASK_1 = 8
  MOD_MASK_2 = 16
  MOD_MASK_3 = 32
  MOD_MASK_4 = 64
  MOD_MASK_5 = 128
  MOD_MASK_ANY = 32768
  
  KEY_BUT_MASK = {:shift=>1, :lock=>2, :control=>4, :mod1=>8, :mod2=>16, :mod3=>32, :mod4=>64, :mod5=>128, :button1=>256, :button2=>512, :button3=>1024, :button4=>2048, :button5=>4096}
  KEY_BUT_MASK_I = {1=>:shift, 2=>:lock, 4=>:control, 8=>:mod1, 16=>:mod2, 32=>:mod3, 64=>:mod4, 128=>:mod5, 256=>:button1, 512=>:button2, 1024=>:button3, 2048=>:button4, 4096=>:button5}
  
  KEY_BUT_MASK_SHIFT = 1
  KEY_BUT_MASK_LOCK = 2
  KEY_BUT_MASK_CONTROL = 4
  KEY_BUT_MASK_MOD1 = 8
  KEY_BUT_MASK_MOD2 = 16
  KEY_BUT_MASK_MOD3 = 32
  KEY_BUT_MASK_MOD4 = 64
  KEY_BUT_MASK_MOD5 = 128
  KEY_BUT_MASK_BUTTON1 = 256
  KEY_BUT_MASK_BUTTON2 = 512
  KEY_BUT_MASK_BUTTON3 = 1024
  KEY_BUT_MASK_BUTTON4 = 2048
  KEY_BUT_MASK_BUTTON5 = 4096
  
  WINDOW = {:none=>0}
  WINDOW_I = {0=>:none}
  
  WINDOW_NONE = 0
  
  BUTTON_MASK = {:"1"=>256, :"2"=>512, :"3"=>1024, :"4"=>2048, :"5"=>4096, :any=>32768}
  BUTTON_MASK_I = {256=>:"1", 512=>:"2", 1024=>:"3", 2048=>:"4", 4096=>:"5", 32768=>:any}
  
  BUTTON_MASK_1 = 256
  BUTTON_MASK_2 = 512
  BUTTON_MASK_3 = 1024
  BUTTON_MASK_4 = 2048
  BUTTON_MASK_5 = 4096
  BUTTON_MASK_ANY = 32768
  
  MOTION = {:normal=>0, :hint=>1}
  MOTION_I = {0=>:normal, 1=>:hint}
  
  MOTION_NORMAL = 0
  MOTION_HINT = 1
  
  NOTIFY_DETAIL = {:ancestor=>0, :virtual=>1, :inferior=>2, :nonlinear=>3, :nonlinear_virtual=>4, :pointer=>5, :pointer_root=>6, :none=>7}
  NOTIFY_DETAIL_I = {0=>:ancestor, 1=>:virtual, 2=>:inferior, 3=>:nonlinear, 4=>:nonlinear_virtual, 5=>:pointer, 6=>:pointer_root, 7=>:none}
  
  NOTIFY_DETAIL_ANCESTOR = 0
  NOTIFY_DETAIL_VIRTUAL = 1
  NOTIFY_DETAIL_INFERIOR = 2
  NOTIFY_DETAIL_NONLINEAR = 3
  NOTIFY_DETAIL_NONLINEAR_VIRTUAL = 4
  NOTIFY_DETAIL_POINTER = 5
  NOTIFY_DETAIL_POINTER_ROOT = 6
  NOTIFY_DETAIL_NONE = 7
  
  NOTIFY_MODE = {:normal=>0, :grab=>1, :ungrab=>2, :while_grabbed=>3}
  NOTIFY_MODE_I = {0=>:normal, 1=>:grab, 2=>:ungrab, 3=>:while_grabbed}
  
  NOTIFY_MODE_NORMAL = 0
  NOTIFY_MODE_GRAB = 1
  NOTIFY_MODE_UNGRAB = 2
  NOTIFY_MODE_WHILE_GRABBED = 3
  
  VISIBILITY = {:unobscured=>0, :partially_obscured=>1, :fully_obscured=>2}
  VISIBILITY_I = {0=>:unobscured, 1=>:partially_obscured, 2=>:fully_obscured}
  
  VISIBILITY_UNOBSCURED = 0
  VISIBILITY_PARTIALLY_OBSCURED = 1
  VISIBILITY_FULLY_OBSCURED = 2
  
  PLACE = {:on_top=>0, :on_bottom=>1}
  PLACE_I = {0=>:on_top, 1=>:on_bottom}
  
  PLACE_ON_TOP = 0
  PLACE_ON_BOTTOM = 1
  
  PROPERTY = {:new_value=>0, :delete=>1}
  PROPERTY_I = {0=>:new_value, 1=>:delete}
  
  PROPERTY_NEW_VALUE = 0
  PROPERTY_DELETE = 1
  
  TIME = {:current_time=>0}
  TIME_I = {0=>:current_time}
  
  TIME_CURRENT_TIME = 0
  
  ATOM = {:none=>0, :any=>0, :primary=>1, :secondary=>2, :arc=>3, :atom=>4, :bitmap=>5, :cardinal=>6, :colormap=>7, :cursor=>8, :cut_buffer0=>9, :cut_buffer1=>10, :cut_buffer2=>11, :cut_buffer3=>12, :cut_buffer4=>13, :cut_buffer5=>14, :cut_buffer6=>15, :cut_buffer7=>16, :drawable=>17, :font=>18, :integer=>19, :pixmap=>20, :point=>21, :rectangle=>22, :resource_manager=>23, :rgb_color_map=>24, :rgb_best_map=>25, :rgb_blue_map=>26, :rgb_default_map=>27, :rgb_gray_map=>28, :rgb_green_map=>29, :rgb_red_map=>30, :string=>31, :visualid=>32, :window=>33, :wm_command=>34, :wm_hints=>35, :wm_client_machine=>36, :wm_icon_name=>37, :wm_icon_size=>38, :wm_name=>39, :wm_normal_hints=>40, :wm_size_hints=>41, :wm_zoom_hints=>42, :min_space=>43, :norm_space=>44, :max_space=>45, :end_space=>46, :superscript_x=>47, :superscript_y=>48, :subscript_x=>49, :subscript_y=>50, :underline_position=>51, :underline_thickness=>52, :strikeout_ascent=>53, :strikeout_descent=>54, :italic_angle=>55, :x_height=>56, :quad_width=>57, :weight=>58, :point_size=>59, :resolution=>60, :copyright=>61, :notice=>62, :font_name=>63, :family_name=>64, :full_name=>65, :cap_height=>66, :wm_class=>67, :wm_transient_for=>68}
  ATOM_I = {0=>:any, 1=>:primary, 2=>:secondary, 3=>:arc, 4=>:atom, 5=>:bitmap, 6=>:cardinal, 7=>:colormap, 8=>:cursor, 9=>:cut_buffer0, 10=>:cut_buffer1, 11=>:cut_buffer2, 12=>:cut_buffer3, 13=>:cut_buffer4, 14=>:cut_buffer5, 15=>:cut_buffer6, 16=>:cut_buffer7, 17=>:drawable, 18=>:font, 19=>:integer, 20=>:pixmap, 21=>:point, 22=>:rectangle, 23=>:resource_manager, 24=>:rgb_color_map, 25=>:rgb_best_map, 26=>:rgb_blue_map, 27=>:rgb_default_map, 28=>:rgb_gray_map, 29=>:rgb_green_map, 30=>:rgb_red_map, 31=>:string, 32=>:visualid, 33=>:window, 34=>:wm_command, 35=>:wm_hints, 36=>:wm_client_machine, 37=>:wm_icon_name, 38=>:wm_icon_size, 39=>:wm_name, 40=>:wm_normal_hints, 41=>:wm_size_hints, 42=>:wm_zoom_hints, 43=>:min_space, 44=>:norm_space, 45=>:max_space, 46=>:end_space, 47=>:superscript_x, 48=>:superscript_y, 49=>:subscript_x, 50=>:subscript_y, 51=>:underline_position, 52=>:underline_thickness, 53=>:strikeout_ascent, 54=>:strikeout_descent, 55=>:italic_angle, 56=>:x_height, 57=>:quad_width, 58=>:weight, 59=>:point_size, 60=>:resolution, 61=>:copyright, 62=>:notice, 63=>:font_name, 64=>:family_name, 65=>:full_name, 66=>:cap_height, 67=>:wm_class, 68=>:wm_transient_for}
  
  ATOM_NONE = 0
  ATOM_ANY = 0
  ATOM_PRIMARY = 1
  ATOM_SECONDARY = 2
  ATOM_ARC = 3
  ATOM_ATOM = 4
  ATOM_BITMAP = 5
  ATOM_CARDINAL = 6
  ATOM_COLORMAP = 7
  ATOM_CURSOR = 8
  ATOM_CUT_BUFFER0 = 9
  ATOM_CUT_BUFFER1 = 10
  ATOM_CUT_BUFFER2 = 11
  ATOM_CUT_BUFFER3 = 12
  ATOM_CUT_BUFFER4 = 13
  ATOM_CUT_BUFFER5 = 14
  ATOM_CUT_BUFFER6 = 15
  ATOM_CUT_BUFFER7 = 16
  ATOM_DRAWABLE = 17
  ATOM_FONT = 18
  ATOM_INTEGER = 19
  ATOM_PIXMAP = 20
  ATOM_POINT = 21
  ATOM_RECTANGLE = 22
  ATOM_RESOURCE_MANAGER = 23
  ATOM_RGB_COLOR_MAP = 24
  ATOM_RGB_BEST_MAP = 25
  ATOM_RGB_BLUE_MAP = 26
  ATOM_RGB_DEFAULT_MAP = 27
  ATOM_RGB_GRAY_MAP = 28
  ATOM_RGB_GREEN_MAP = 29
  ATOM_RGB_RED_MAP = 30
  ATOM_STRING = 31
  ATOM_VISUALID = 32
  ATOM_WINDOW = 33
  ATOM_WM_COMMAND = 34
  ATOM_WM_HINTS = 35
  ATOM_WM_CLIENT_MACHINE = 36
  ATOM_WM_ICON_NAME = 37
  ATOM_WM_ICON_SIZE = 38
  ATOM_WM_NAME = 39
  ATOM_WM_NORMAL_HINTS = 40
  ATOM_WM_SIZE_HINTS = 41
  ATOM_WM_ZOOM_HINTS = 42
  ATOM_MIN_SPACE = 43
  ATOM_NORM_SPACE = 44
  ATOM_MAX_SPACE = 45
  ATOM_END_SPACE = 46
  ATOM_SUPERSCRIPT_X = 47
  ATOM_SUPERSCRIPT_Y = 48
  ATOM_SUBSCRIPT_X = 49
  ATOM_SUBSCRIPT_Y = 50
  ATOM_UNDERLINE_POSITION = 51
  ATOM_UNDERLINE_THICKNESS = 52
  ATOM_STRIKEOUT_ASCENT = 53
  ATOM_STRIKEOUT_DESCENT = 54
  ATOM_ITALIC_ANGLE = 55
  ATOM_X_HEIGHT = 56
  ATOM_QUAD_WIDTH = 57
  ATOM_WEIGHT = 58
  ATOM_POINT_SIZE = 59
  ATOM_RESOLUTION = 60
  ATOM_COPYRIGHT = 61
  ATOM_NOTICE = 62
  ATOM_FONT_NAME = 63
  ATOM_FAMILY_NAME = 64
  ATOM_FULL_NAME = 65
  ATOM_CAP_HEIGHT = 66
  ATOM_WM_CLASS = 67
  ATOM_WM_TRANSIENT_FOR = 68
  
  COLORMAP_STATE = {:uninstalled=>0, :installed=>1}
  COLORMAP_STATE_I = {0=>:uninstalled, 1=>:installed}
  
  COLORMAP_STATE_UNINSTALLED = 0
  COLORMAP_STATE_INSTALLED = 1
  
  COLORMAP = {:none=>0}
  COLORMAP_I = {0=>:none}
  
  COLORMAP_NONE = 0
  
  MAPPING = {:modifier=>0, :keyboard=>1, :pointer=>2}
  MAPPING_I = {0=>:modifier, 1=>:keyboard, 2=>:pointer}
  
  MAPPING_MODIFIER = 0
  MAPPING_KEYBOARD = 1
  MAPPING_POINTER = 2
  
  WINDOW_CLASS = {:copy_from_parent=>0, :input_output=>1, :input_only=>2}
  WINDOW_CLASS_I = {0=>:copy_from_parent, 1=>:input_output, 2=>:input_only}
  
  WINDOW_CLASS_COPY_FROM_PARENT = 0
  WINDOW_CLASS_INPUT_OUTPUT = 1
  WINDOW_CLASS_INPUT_ONLY = 2
  
  CW = {:back_pixmap=>1, :back_pixel=>2, :border_pixmap=>4, :border_pixel=>8, :bit_gravity=>16, :win_gravity=>32, :backing_store=>64, :backing_planes=>128, :backing_pixel=>256, :override_redirect=>512, :save_under=>1024, :event_mask=>2048, :dont_propagate=>4096, :colormap=>8192, :cursor=>16384}
  CW_I = {1=>:back_pixmap, 2=>:back_pixel, 4=>:border_pixmap, 8=>:border_pixel, 16=>:bit_gravity, 32=>:win_gravity, 64=>:backing_store, 128=>:backing_planes, 256=>:backing_pixel, 512=>:override_redirect, 1024=>:save_under, 2048=>:event_mask, 4096=>:dont_propagate, 8192=>:colormap, 16384=>:cursor}
  
  CW_BACK_PIXMAP = 1
  CW_BACK_PIXEL = 2
  CW_BORDER_PIXMAP = 4
  CW_BORDER_PIXEL = 8
  CW_BIT_GRAVITY = 16
  CW_WIN_GRAVITY = 32
  CW_BACKING_STORE = 64
  CW_BACKING_PLANES = 128
  CW_BACKING_PIXEL = 256
  CW_OVERRIDE_REDIRECT = 512
  CW_SAVE_UNDER = 1024
  CW_EVENT_MASK = 2048
  CW_DONT_PROPAGATE = 4096
  CW_COLORMAP = 8192
  CW_CURSOR = 16384
  
  BACK_PIXMAP = {:none=>0, :parent_relative=>1}
  BACK_PIXMAP_I = {0=>:none, 1=>:parent_relative}
  
  BACK_PIXMAP_NONE = 0
  BACK_PIXMAP_PARENT_RELATIVE = 1
  
  GRAVITY = {:bit_forget=>0, :win_unmap=>0, :north_west=>1, :north=>2, :north_east=>3, :west=>4, :center=>5, :east=>6, :south_west=>7, :south=>8, :south_east=>9, :static=>10}
  GRAVITY_I = {0=>:win_unmap, 1=>:north_west, 2=>:north, 3=>:north_east, 4=>:west, 5=>:center, 6=>:east, 7=>:south_west, 8=>:south, 9=>:south_east, 10=>:static}
  
  GRAVITY_BIT_FORGET = 0
  GRAVITY_WIN_UNMAP = 0
  GRAVITY_NORTH_WEST = 1
  GRAVITY_NORTH = 2
  GRAVITY_NORTH_EAST = 3
  GRAVITY_WEST = 4
  GRAVITY_CENTER = 5
  GRAVITY_EAST = 6
  GRAVITY_SOUTH_WEST = 7
  GRAVITY_SOUTH = 8
  GRAVITY_SOUTH_EAST = 9
  GRAVITY_STATIC = 10
  
  MAP_STATE = {:unmapped=>0, :unviewable=>1, :viewable=>2}
  MAP_STATE_I = {0=>:unmapped, 1=>:unviewable, 2=>:viewable}
  
  MAP_STATE_UNMAPPED = 0
  MAP_STATE_UNVIEWABLE = 1
  MAP_STATE_VIEWABLE = 2
  
  SET_MODE = {:insert=>0, :delete=>1}
  SET_MODE_I = {0=>:insert, 1=>:delete}
  
  SET_MODE_INSERT = 0
  SET_MODE_DELETE = 1
  
  CONFIG_WINDOW = {:x=>1, :y=>2, :width=>4, :height=>8, :border_width=>16, :sibling=>32, :stack_mode=>64}
  CONFIG_WINDOW_I = {1=>:x, 2=>:y, 4=>:width, 8=>:height, 16=>:border_width, 32=>:sibling, 64=>:stack_mode}
  
  CONFIG_WINDOW_X = 1
  CONFIG_WINDOW_Y = 2
  CONFIG_WINDOW_WIDTH = 4
  CONFIG_WINDOW_HEIGHT = 8
  CONFIG_WINDOW_BORDER_WIDTH = 16
  CONFIG_WINDOW_SIBLING = 32
  CONFIG_WINDOW_STACK_MODE = 64
  
  STACK_MODE = {:above=>0, :below=>1, :top_if=>2, :bottom_if=>3, :opposite=>4}
  STACK_MODE_I = {0=>:above, 1=>:below, 2=>:top_if, 3=>:bottom_if, 4=>:opposite}
  
  STACK_MODE_ABOVE = 0
  STACK_MODE_BELOW = 1
  STACK_MODE_TOP_IF = 2
  STACK_MODE_BOTTOM_IF = 3
  STACK_MODE_OPPOSITE = 4
  
  CIRCULATE = {:raise_lowest=>0, :lower_highest=>1}
  CIRCULATE_I = {0=>:raise_lowest, 1=>:lower_highest}
  
  CIRCULATE_RAISE_LOWEST = 0
  CIRCULATE_LOWER_HIGHEST = 1
  
  PROP_MODE = {:replace=>0, :prepend=>1, :append=>2}
  PROP_MODE_I = {0=>:replace, 1=>:prepend, 2=>:append}
  
  PROP_MODE_REPLACE = 0
  PROP_MODE_PREPEND = 1
  PROP_MODE_APPEND = 2
  
  GET_PROPERTY_TYPE = {:any=>0}
  GET_PROPERTY_TYPE_I = {0=>:any}
  
  GET_PROPERTY_TYPE_ANY = 0
  
  SEND_EVENT_DEST = {:pointer_window=>0, :item_focus=>1}
  SEND_EVENT_DEST_I = {0=>:pointer_window, 1=>:item_focus}
  
  SEND_EVENT_DEST_POINTER_WINDOW = 0
  SEND_EVENT_DEST_ITEM_FOCUS = 1
  
  GRAB_MODE = {:sync=>0, :async=>1}
  GRAB_MODE_I = {0=>:sync, 1=>:async}
  
  GRAB_MODE_SYNC = 0
  GRAB_MODE_ASYNC = 1
  
  GRAB_STATUS = {:success=>0, :already_grabbed=>1, :invalid_time=>2, :not_viewable=>3, :frozen=>4}
  GRAB_STATUS_I = {0=>:success, 1=>:already_grabbed, 2=>:invalid_time, 3=>:not_viewable, 4=>:frozen}
  
  GRAB_STATUS_SUCCESS = 0
  GRAB_STATUS_ALREADY_GRABBED = 1
  GRAB_STATUS_INVALID_TIME = 2
  GRAB_STATUS_NOT_VIEWABLE = 3
  GRAB_STATUS_FROZEN = 4
  
  CURSOR = {:none=>0}
  CURSOR_I = {0=>:none}
  
  CURSOR_NONE = 0
  
  BUTTON_INDEX = {:any=>0, :"1"=>1, :"2"=>2, :"3"=>3, :"4"=>4, :"5"=>5}
  BUTTON_INDEX_I = {0=>:any, 1=>:"1", 2=>:"2", 3=>:"3", 4=>:"4", 5=>:"5"}
  
  BUTTON_INDEX_ANY = 0
  BUTTON_INDEX_1 = 1
  BUTTON_INDEX_2 = 2
  BUTTON_INDEX_3 = 3
  BUTTON_INDEX_4 = 4
  BUTTON_INDEX_5 = 5
  
  GRAB = {:any=>0}
  GRAB_I = {0=>:any}
  
  GRAB_ANY = 0
  
  ALLOW = {:async_pointer=>0, :sync_pointer=>1, :replay_pointer=>2, :async_keyboard=>3, :sync_keyboard=>4, :replay_keyboard=>5, :async_both=>6, :sync_both=>7}
  ALLOW_I = {0=>:async_pointer, 1=>:sync_pointer, 2=>:replay_pointer, 3=>:async_keyboard, 4=>:sync_keyboard, 5=>:replay_keyboard, 6=>:async_both, 7=>:sync_both}
  
  ALLOW_ASYNC_POINTER = 0
  ALLOW_SYNC_POINTER = 1
  ALLOW_REPLAY_POINTER = 2
  ALLOW_ASYNC_KEYBOARD = 3
  ALLOW_SYNC_KEYBOARD = 4
  ALLOW_REPLAY_KEYBOARD = 5
  ALLOW_ASYNC_BOTH = 6
  ALLOW_SYNC_BOTH = 7
  
  INPUT_FOCUS = {:none=>0, :pointer_root=>1, :parent=>2, :follow_keyboard=>3}
  INPUT_FOCUS_I = {0=>:none, 1=>:pointer_root, 2=>:parent, 3=>:follow_keyboard}
  
  INPUT_FOCUS_NONE = 0
  INPUT_FOCUS_POINTER_ROOT = 1
  INPUT_FOCUS_PARENT = 2
  INPUT_FOCUS_FOLLOW_KEYBOARD = 3
  
  FONT_DRAW = {:left_to_right=>0, :right_to_left=>1}
  FONT_DRAW_I = {0=>:left_to_right, 1=>:right_to_left}
  
  FONT_DRAW_LEFT_TO_RIGHT = 0
  FONT_DRAW_RIGHT_TO_LEFT = 1
  
  GC = {:function=>1, :plane_mask=>2, :foreground=>4, :background=>8, :line_width=>16, :line_style=>32, :cap_style=>64, :join_style=>128, :fill_style=>256, :fill_rule=>512, :tile=>1024, :stipple=>2048, :tile_stipple_origin_x=>4096, :tile_stipple_origin_y=>8192, :font=>16384, :subwindow_mode=>32768, :graphics_exposures=>65536, :clip_origin_x=>131072, :clip_origin_y=>262144, :clip_mask=>524288, :dash_offset=>1048576, :dash_list=>2097152, :arc_mode=>4194304}
  GC_I = {1=>:function, 2=>:plane_mask, 4=>:foreground, 8=>:background, 16=>:line_width, 32=>:line_style, 64=>:cap_style, 128=>:join_style, 256=>:fill_style, 512=>:fill_rule, 1024=>:tile, 2048=>:stipple, 4096=>:tile_stipple_origin_x, 8192=>:tile_stipple_origin_y, 16384=>:font, 32768=>:subwindow_mode, 65536=>:graphics_exposures, 131072=>:clip_origin_x, 262144=>:clip_origin_y, 524288=>:clip_mask, 1048576=>:dash_offset, 2097152=>:dash_list, 4194304=>:arc_mode}
  
  GC_FUNCTION = 1
  GC_PLANE_MASK = 2
  GC_FOREGROUND = 4
  GC_BACKGROUND = 8
  GC_LINE_WIDTH = 16
  GC_LINE_STYLE = 32
  GC_CAP_STYLE = 64
  GC_JOIN_STYLE = 128
  GC_FILL_STYLE = 256
  GC_FILL_RULE = 512
  GC_TILE = 1024
  GC_STIPPLE = 2048
  GC_TILE_STIPPLE_ORIGIN_X = 4096
  GC_TILE_STIPPLE_ORIGIN_Y = 8192
  GC_FONT = 16384
  GC_SUBWINDOW_MODE = 32768
  GC_GRAPHICS_EXPOSURES = 65536
  GC_CLIP_ORIGIN_X = 131072
  GC_CLIP_ORIGIN_Y = 262144
  GC_CLIP_MASK = 524288
  GC_DASH_OFFSET = 1048576
  GC_DASH_LIST = 2097152
  GC_ARC_MODE = 4194304
  
  GX = {:clear=>0, :and=>1, :and_reverse=>2, :copy=>3, :and_inverted=>4, :noop=>5, :xor=>6, :or=>7, :nor=>8, :equiv=>9, :invert=>10, :or_reverse=>11, :copy_inverted=>12, :or_inverted=>13, :nand=>14, :set=>15}
  GX_I = {0=>:clear, 1=>:and, 2=>:and_reverse, 3=>:copy, 4=>:and_inverted, 5=>:noop, 6=>:xor, 7=>:or, 8=>:nor, 9=>:equiv, 10=>:invert, 11=>:or_reverse, 12=>:copy_inverted, 13=>:or_inverted, 14=>:nand, 15=>:set}
  
  GX_CLEAR = 0
  GX_AND = 1
  GX_AND_REVERSE = 2
  GX_COPY = 3
  GX_AND_INVERTED = 4
  GX_NOOP = 5
  GX_XOR = 6
  GX_OR = 7
  GX_NOR = 8
  GX_EQUIV = 9
  GX_INVERT = 10
  GX_OR_REVERSE = 11
  GX_COPY_INVERTED = 12
  GX_OR_INVERTED = 13
  GX_NAND = 14
  GX_SET = 15
  
  LINE_STYLE = {:solid=>0, :on_off_dash=>1, :double_dash=>2}
  LINE_STYLE_I = {0=>:solid, 1=>:on_off_dash, 2=>:double_dash}
  
  LINE_STYLE_SOLID = 0
  LINE_STYLE_ON_OFF_DASH = 1
  LINE_STYLE_DOUBLE_DASH = 2
  
  CAP_STYLE = {:not_last=>0, :butt=>1, :round=>2, :projecting=>3}
  CAP_STYLE_I = {0=>:not_last, 1=>:butt, 2=>:round, 3=>:projecting}
  
  CAP_STYLE_NOT_LAST = 0
  CAP_STYLE_BUTT = 1
  CAP_STYLE_ROUND = 2
  CAP_STYLE_PROJECTING = 3
  
  JOIN_STYLE = {:miter=>0, :round=>1, :bevel=>2}
  JOIN_STYLE_I = {0=>:miter, 1=>:round, 2=>:bevel}
  
  JOIN_STYLE_MITER = 0
  JOIN_STYLE_ROUND = 1
  JOIN_STYLE_BEVEL = 2
  
  FILL_STYLE = {:solid=>0, :tiled=>1, :stippled=>2, :opaque_stippled=>3}
  FILL_STYLE_I = {0=>:solid, 1=>:tiled, 2=>:stippled, 3=>:opaque_stippled}
  
  FILL_STYLE_SOLID = 0
  FILL_STYLE_TILED = 1
  FILL_STYLE_STIPPLED = 2
  FILL_STYLE_OPAQUE_STIPPLED = 3
  
  FILL_RULE = {:even_odd=>0, :winding=>1}
  FILL_RULE_I = {0=>:even_odd, 1=>:winding}
  
  FILL_RULE_EVEN_ODD = 0
  FILL_RULE_WINDING = 1
  
  SUBWINDOW_MODE = {:clip_by_children=>0, :include_inferiors=>1}
  SUBWINDOW_MODE_I = {0=>:clip_by_children, 1=>:include_inferiors}
  
  SUBWINDOW_MODE_CLIP_BY_CHILDREN = 0
  SUBWINDOW_MODE_INCLUDE_INFERIORS = 1
  
  ARC_MODE = {:chord=>0, :pie_slice=>1}
  ARC_MODE_I = {0=>:chord, 1=>:pie_slice}
  
  ARC_MODE_CHORD = 0
  ARC_MODE_PIE_SLICE = 1
  
  CLIP_ORDERING = {:unsorted=>0, :y_sorted=>1, :yx_sorted=>2, :yx_banded=>3}
  CLIP_ORDERING_I = {0=>:unsorted, 1=>:y_sorted, 2=>:yx_sorted, 3=>:yx_banded}
  
  CLIP_ORDERING_UNSORTED = 0
  CLIP_ORDERING_Y_SORTED = 1
  CLIP_ORDERING_YX_SORTED = 2
  CLIP_ORDERING_YX_BANDED = 3
  
  COORD_MODE = {:origin=>0, :previous=>1}
  COORD_MODE_I = {0=>:origin, 1=>:previous}
  
  COORD_MODE_ORIGIN = 0
  COORD_MODE_PREVIOUS = 1
  
  POLY_SHAPE = {:complex=>0, :nonconvex=>1, :convex=>2}
  POLY_SHAPE_I = {0=>:complex, 1=>:nonconvex, 2=>:convex}
  
  POLY_SHAPE_COMPLEX = 0
  POLY_SHAPE_NONCONVEX = 1
  POLY_SHAPE_CONVEX = 2
  
  IMAGE_FORMAT = {:xy_bitmap=>0, :xy_pixmap=>1, :z_pixmap=>2}
  IMAGE_FORMAT_I = {0=>:xy_bitmap, 1=>:xy_pixmap, 2=>:z_pixmap}
  
  IMAGE_FORMAT_XY_BITMAP = 0
  IMAGE_FORMAT_XY_PIXMAP = 1
  IMAGE_FORMAT_Z_PIXMAP = 2
  
  COLORMAP_ALLOC = {:none=>0, :all=>1}
  COLORMAP_ALLOC_I = {0=>:none, 1=>:all}
  
  COLORMAP_ALLOC_NONE = 0
  COLORMAP_ALLOC_ALL = 1
  
  COLOR_FLAG = {:red=>1, :green=>2, :blue=>4}
  COLOR_FLAG_I = {1=>:red, 2=>:green, 4=>:blue}
  
  COLOR_FLAG_RED = 1
  COLOR_FLAG_GREEN = 2
  COLOR_FLAG_BLUE = 4
  
  PIXMAP = {:none=>0}
  PIXMAP_I = {0=>:none}
  
  PIXMAP_NONE = 0
  
  FONT = {:none=>0}
  FONT_I = {0=>:none}
  
  FONT_NONE = 0
  
  QUERY_SHAPE_OF = {:largest_cursor=>0, :fastest_tile=>1, :fastest_stipple=>2}
  QUERY_SHAPE_OF_I = {0=>:largest_cursor, 1=>:fastest_tile, 2=>:fastest_stipple}
  
  QUERY_SHAPE_OF_LARGEST_CURSOR = 0
  QUERY_SHAPE_OF_FASTEST_TILE = 1
  QUERY_SHAPE_OF_FASTEST_STIPPLE = 2
  
  KB = {:key_click_percent=>1, :bell_percent=>2, :bell_pitch=>4, :bell_duration=>8, :led=>16, :led_mode=>32, :key=>64, :auto_repeat_mode=>128}
  KB_I = {1=>:key_click_percent, 2=>:bell_percent, 4=>:bell_pitch, 8=>:bell_duration, 16=>:led, 32=>:led_mode, 64=>:key, 128=>:auto_repeat_mode}
  
  KB_KEY_CLICK_PERCENT = 1
  KB_BELL_PERCENT = 2
  KB_BELL_PITCH = 4
  KB_BELL_DURATION = 8
  KB_LED = 16
  KB_LED_MODE = 32
  KB_KEY = 64
  KB_AUTO_REPEAT_MODE = 128
  
  LED_MODE = {:off=>0, :on=>1}
  LED_MODE_I = {0=>:off, 1=>:on}
  
  LED_MODE_OFF = 0
  LED_MODE_ON = 1
  
  AUTO_REPEAT_MODE = {:off=>0, :on=>1, :default=>2}
  AUTO_REPEAT_MODE_I = {0=>:off, 1=>:on, 2=>:default}
  
  AUTO_REPEAT_MODE_OFF = 0
  AUTO_REPEAT_MODE_ON = 1
  AUTO_REPEAT_MODE_DEFAULT = 2
  
  BLANKING = {:not_preferred=>0, :preferred=>1, :default=>2}
  BLANKING_I = {0=>:not_preferred, 1=>:preferred, 2=>:default}
  
  BLANKING_NOT_PREFERRED = 0
  BLANKING_PREFERRED = 1
  BLANKING_DEFAULT = 2
  
  EXPOSURES = {:not_allowed=>0, :allowed=>1, :default=>2}
  EXPOSURES_I = {0=>:not_allowed, 1=>:allowed, 2=>:default}
  
  EXPOSURES_NOT_ALLOWED = 0
  EXPOSURES_ALLOWED = 1
  EXPOSURES_DEFAULT = 2
  
  HOST_MODE = {:insert=>0, :delete=>1}
  HOST_MODE_I = {0=>:insert, 1=>:delete}
  
  HOST_MODE_INSERT = 0
  HOST_MODE_DELETE = 1
  
  FAMILY = {:internet=>0, :de_cnet=>1, :chaos=>2, :server_interpreted=>5, :internet6=>6}
  FAMILY_I = {0=>:internet, 1=>:de_cnet, 2=>:chaos, 5=>:server_interpreted, 6=>:internet6}
  
  FAMILY_INTERNET = 0
  FAMILY_DE_CNET = 1
  FAMILY_CHAOS = 2
  FAMILY_SERVER_INTERPRETED = 5
  FAMILY_INTERNET6 = 6
  
  ACCESS_CONTROL = {:disable=>0, :enable=>1}
  ACCESS_CONTROL_I = {0=>:disable, 1=>:enable}
  
  ACCESS_CONTROL_DISABLE = 0
  ACCESS_CONTROL_ENABLE = 1
  
  CLOSE_DOWN = {:destroy_all=>0, :retain_permanent=>1, :retain_temporary=>2}
  CLOSE_DOWN_I = {0=>:destroy_all, 1=>:retain_permanent, 2=>:retain_temporary}
  
  CLOSE_DOWN_DESTROY_ALL = 0
  CLOSE_DOWN_RETAIN_PERMANENT = 1
  CLOSE_DOWN_RETAIN_TEMPORARY = 2
  
  KILL = {:all_temporary=>0}
  KILL_I = {0=>:all_temporary}
  
  KILL_ALL_TEMPORARY = 0
  
  SCREEN_SAVER = {:reset=>0, :active=>1}
  SCREEN_SAVER_I = {0=>:reset, 1=>:active}
  
  SCREEN_SAVER_RESET = 0
  SCREEN_SAVER_ACTIVE = 1
  
  MAPPING_STATUS = {:success=>0, :busy=>1, :failure=>2}
  MAPPING_STATUS_I = {0=>:success, 1=>:busy, 2=>:failure}
  
  MAPPING_STATUS_SUCCESS = 0
  MAPPING_STATUS_BUSY = 1
  MAPPING_STATUS_FAILURE = 2
  
  MAP_INDEX = {:shift=>0, :lock=>1, :control=>2, :"1"=>3, :"2"=>4, :"3"=>5, :"4"=>6, :"5"=>7}
  MAP_INDEX_I = {0=>:shift, 1=>:lock, 2=>:control, 3=>:"1", 4=>:"2", 5=>:"3", 6=>:"4", 7=>:"5"}
  
  MAP_INDEX_SHIFT = 0
  MAP_INDEX_LOCK = 1
  MAP_INDEX_CONTROL = 2
  MAP_INDEX_1 = 3
  MAP_INDEX_2 = 4
  MAP_INDEX_3 = 5
  MAP_INDEX_4 = 6
  MAP_INDEX_5 = 7
  
  register_event nil, 2, "key_press_event", true
  register_event nil, 3, "key_release_event", true
  register_event nil, 4, "button_press_event", true
  register_event nil, 5, "button_release_event", true
  register_event nil, 6, "motion_notify_event", true
  register_event nil, 7, "enter_notify_event", true
  register_event nil, 8, "leave_notify_event", true
  register_event nil, 9, "focus_in_event", true
  register_event nil, 10, "focus_out_event", true
  register_event nil, 11, "keymap_notify_event", false
  register_event nil, 12, "expose_event", true
  register_event nil, 13, "graphics_exposure_event", true
  register_event nil, 14, "no_exposure_event", true
  register_event nil, 15, "visibility_notify_event", true
  register_event nil, 16, "create_notify_event", true
  register_event nil, 17, "destroy_notify_event", true
  register_event nil, 18, "unmap_notify_event", true
  register_event nil, 19, "map_notify_event", true
  register_event nil, 20, "map_request_event", true
  register_event nil, 21, "reparent_notify_event", true
  register_event nil, 22, "configure_notify_event", true
  register_event nil, 23, "configure_request_event", true
  register_event nil, 24, "gravity_notify_event", true
  register_event nil, 25, "resize_request_event", true
  register_event nil, 26, "circulate_notify_event", true
  register_event nil, 27, "circulate_request_event", true
  register_event nil, 28, "property_notify_event", true
  register_event nil, 29, "selection_clear_event", true
  register_event nil, 30, "selection_request_event", true
  register_event nil, 31, "selection_notify_event", true
  register_event nil, 32, "colormap_notify_event", true
  register_event nil, 33, "client_message_event", true
  register_event nil, 34, "mapping_notify_event", true
  register_event nil, 35, "ge_generic_event", true
  
  register_error nil, 1, "RequestError"
  register_error nil, 2, "ValueError"
  register_error nil, 3, "WindowError"
  register_error nil, 4, "PixmapError"
  register_error nil, 5, "AtomError"
  register_error nil, 6, "CursorError"
  register_error nil, 7, "FontError"
  register_error nil, 8, "MatchError"
  register_error nil, 9, "DrawableError"
  register_error nil, 10, "AccessError"
  register_error nil, 11, "AllocError"
  register_error nil, 12, "ColormapError"
  register_error nil, 13, "GContextError"
  register_error nil, 14, "IDChoiceError"
  register_error nil, 15, "NameError"
  register_error nil, 16, "LengthError"
  register_error nil, 17, "ImplementationError"
  
  class Drawable < Resource
  end
  class Window < Drawable
  end
  class Pixmap < Drawable
  end
  class Cursor < Resource
  end
  class Fontable < Resource
  end
  class Font < Fontable
  end
  class Gcontext < Fontable
  end
  class Colormap < Resource
  end
  
  module Methods
    
    # :nodoc:
    def create_window! (depth, wid, parent, x, y, width, height, border_width, klass, visual, value_mask, *value_list)
      s = 1.chr.encode('BINARY')
      s << [depth, wid.to_i, parent.to_i, x, y, width, height, border_width, klass, visual, value_mask, *value_list.map(&:to_i)].pack("CLLssSSSSLLL*")
      send_request(s, :create_window, false)
    end
    
    # :doc:
    # Creates an unmapped window as child of the specified `parent` window. A
    # CreateNotify event will be generated. The new window is placed on top in the
    # stacking order with respect to siblings.
    # 
    # The coordinate system has the X axis horizontal and the Y axis vertical with
    # the origin [0, 0] at the upper-left corner. Coordinates are integral, in terms
    # of pixels, and coincide with pixel centers. Each window and pixmap has its own
    # coordinate system. For a window, the origin is inside the border at the inside,
    # upper-left corner.
    # 
    # The created window is not yet displayed (mapped), call `xcb_map_window` to
    # display it.
    # 
    # The created window will initially use the same cursor as its parent.
    def create_window (*args)
      create_window!(*args).abandon
    end
    
    # :nodoc:
    def change_window_attributes! (window, value_mask, *value_list)
      s = 2.chr.encode('BINARY')
      s << [window.to_i, value_mask, *value_list.map(&:to_i)].pack("x1LLL*")
      send_request(s, :change_window_attributes, false)
    end
    
    # :doc:
    # Changes the attributes specified by `value_mask` for the specified `window`.
    def change_window_attributes (*args)
      change_window_attributes!(*args).abandon
    end
    
    # :nodoc:
    def get_window_attributes! (window)
      s = 3.chr.encode('BINARY')
      s << [window.to_i].pack("x1L")
      send_request(s, :get_window_attributes, true)
    end
    
    # :doc:
    # Gets the current attributes for the specified `window`.
    def get_window_attributes (*args)
      get_window_attributes!(*args).wait
    end
    
    # :nodoc:
    def get_window_attributes_reply (s)
      x = {}
      x[:backing_store], x[:visual], x[:klass], x[:bit_gravity], x[:win_gravity], x[:backing_planes], x[:backing_pixel], x[:save_under], x[:map_is_installed], x[:map_state], x[:override_redirect], x[:colormap], x[:all_event_masks], x[:your_event_mask], x[:do_not_propagate_mask], = s.slice!(0, 37).unpack("CLSCCLLCCCCLLLSx2")
      x[:save_under] = x[:save_under] != 0
      x[:map_is_installed] = x[:map_is_installed] != 0
      x[:override_redirect] = x[:override_redirect] != 0
      x[:colormap] = find_resource(x[:colormap], "Colormap")
      x
    end
    
    # :nodoc:
    def destroy_window! (window)
      s = 4.chr.encode('BINARY')
      s << [window.to_i].pack("x1L")
      send_request(s, :destroy_window, false)
    end
    
    # :doc:
    # Destroys the specified window and all of its subwindows. A DestroyNotify event
    # is generated for each destroyed window (a DestroyNotify event is first generated
    # for any given window's inferiors). If the window was mapped, it will be
    # automatically unmapped before destroying.
    # 
    # Calling DestroyWindow on the root window will do nothing.
    def destroy_window (*args)
      destroy_window!(*args).abandon
    end
    
    # :nodoc:
    def destroy_subwindows! (window)
      s = 5.chr.encode('BINARY')
      s << [window.to_i].pack("x1L")
      send_request(s, :destroy_subwindows, false)
    end
    
    # :doc:
    def destroy_subwindows (*args)
      destroy_subwindows!(*args).abandon
    end
    
    # :nodoc:
    def change_save_set! (mode, window)
      s = 6.chr.encode('BINARY')
      s << [mode, window.to_i].pack("CL")
      send_request(s, :change_save_set, false)
    end
    
    # :doc:
    # TODO: explain what the save set is for.
    # 
    # This function either adds or removes the specified window to the client's (your
    # application's) save set.
    def change_save_set (*args)
      change_save_set!(*args).abandon
    end
    
    # :nodoc:
    def reparent_window! (window, parent, x, y)
      s = 7.chr.encode('BINARY')
      s << [window.to_i, parent.to_i, x, y].pack("x1LLss")
      send_request(s, :reparent_window, false)
    end
    
    # :doc:
    # Makes the specified window a child of the specified parent window. If the
    # window is mapped, it will automatically be unmapped before reparenting and
    # re-mapped after reparenting. The window is placed in the stacking order on top
    # with respect to sibling windows.
    # 
    # After reparenting, a ReparentNotify event is generated.
    def reparent_window (*args)
      reparent_window!(*args).abandon
    end
    
    # :nodoc:
    def map_window! (window)
      s = 8.chr.encode('BINARY')
      s << [window.to_i].pack("x1L")
      send_request(s, :map_window, false)
    end
    
    # :doc:
    # Maps the specified window. This means making the window visible (as long as its
    # parent is visible).
    # 
    # This MapWindow request will be translated to a MapRequest request if a window
    # manager is running. The window manager then decides to either map the window or
    # not. Set the override-redirect window attribute to true if you want to bypass
    # this mechanism.
    # 
    # If the window manager decides to map the window (or if no window manager is
    # running), a MapNotify event is generated.
    # 
    # If the window becomes viewable and no earlier contents for it are remembered,
    # the X server tiles the window with its background. If the window's background
    # is undefined, the existing screen contents are not altered, and the X server
    # generates zero or more Expose events.
    # 
    # If the window type is InputOutput, an Expose event will be generated when the
    # window becomes visible. The normal response to an Expose event should be to
    # repaint the window.
    def map_window (*args)
      map_window!(*args).abandon
    end
    
    # :nodoc:
    def map_subwindows! (window)
      s = 9.chr.encode('BINARY')
      s << [window.to_i].pack("x1L")
      send_request(s, :map_subwindows, false)
    end
    
    # :doc:
    def map_subwindows (*args)
      map_subwindows!(*args).abandon
    end
    
    # :nodoc:
    def unmap_window! (window)
      s = 10.chr.encode('BINARY')
      s << [window.to_i].pack("x1L")
      send_request(s, :unmap_window, false)
    end
    
    # :doc:
    # Unmaps the specified window. This means making the window invisible (and all
    # its child windows).
    # 
    # Unmapping a window leads to the `UnmapNotify` event being generated. Also,
    # `Expose` events are generated for formerly obscured windows.
    def unmap_window (*args)
      unmap_window!(*args).abandon
    end
    
    # :nodoc:
    def unmap_subwindows! (window)
      s = 11.chr.encode('BINARY')
      s << [window.to_i].pack("x1L")
      send_request(s, :unmap_subwindows, false)
    end
    
    # :doc:
    def unmap_subwindows (*args)
      unmap_subwindows!(*args).abandon
    end
    
    # :nodoc:
    def configure_window! (window, value_mask, *value_list)
      s = 12.chr.encode('BINARY')
      s << [window.to_i, value_mask, *value_list.map(&:to_i)].pack("x1LSx2L*")
      send_request(s, :configure_window, false)
    end
    
    # :doc:
    # Configures a window's size, position, border width and stacking order.
    def configure_window (*args)
      configure_window!(*args).abandon
    end
    
    # :nodoc:
    def circulate_window! (direction, window)
      s = 13.chr.encode('BINARY')
      s << [direction, window.to_i].pack("CL")
      p [direction, window.to_i]
      send_request(s, :circulate_window, false)
    end
    
    # :doc:
    # If `direction` is `XCB_CIRCULATE_RAISE_LOWEST`, the lowest mapped child (if
    # any) will be raised to the top of the stack.
    # 
    # If `direction` is `XCB_CIRCULATE_LOWER_HIGHEST`, the highest mapped child will
    # be lowered to the bottom of the stack.
    def circulate_window (*args)
      circulate_window!(*args).abandon
    end
    
    # :nodoc:
    def get_geometry! (drawable)
      s = 14.chr.encode('BINARY')
      s << [drawable.to_i].pack("x1L")
      send_request(s, :get_geometry, true)
    end
    
    # :doc:
    # Gets the current geometry of the specified drawable (either `Window` or `Pixmap`).
    def get_geometry (*args)
      get_geometry!(*args).wait
    end
    
    # :nodoc:
    def get_geometry_reply (s)
      x = {}
      x[:depth], x[:root], x[:x], x[:y], x[:width], x[:height], x[:border_width], = s.slice!(0, 17).unpack("CLssSSSx2")
      x[:root] = find_resource(x[:root], "Window")
      x
    end
    
    # :nodoc:
    def query_tree! (window)
      s = 15.chr.encode('BINARY')
      s << [window.to_i].pack("x1L")
      send_request(s, :query_tree, true)
    end
    
    # :doc:
    # Gets the root window ID, parent window ID and list of children windows for the
    # specified `window`. The children are listed in bottom-to-top stacking order.
    def query_tree (*args)
      query_tree!(*args).wait
    end
    
    # :nodoc:
    def query_tree_reply (s)
      x = {}
      x[:root], x[:parent], x[:children_len], *x[:children] = s.unpack("x1LLSx14L*")
      x[:root] = find_resource(x[:root], "Window")
      x[:parent] = find_resource(x[:parent], "Window")
      x.delete(:children_len)
      x[:children] = x[:children] ? x[:children].map{|x|find_resource(x, "Window")} : []
      x
    end
    
    # :nodoc:
    def intern_atom! (only_if_exists, name)
      s = 16.chr.encode('BINARY')
      name = name.force_encoding('BINARY')
      name_len = name.bytesize
      s << [only_if_exists ? 1 : 0, name_len, pad(name)].pack("CSx2A*")
      send_request(s, :intern_atom, true)
    end
    
    # :doc:
    # Retrieves the identifier (xcb_atom_t TODO) for the atom with the specified
    # name. Atoms are used in protocols like EWMH, for example to store window titles
    # (`_NET_WM_NAME` atom) as property of a window.
    # 
    # If `only_if_exists` is 0, the atom will be created if it does not already exist.
    # If `only_if_exists` is 1, `XCB_ATOM_NONE` will be returned if the atom does
    # not yet exist.
    def intern_atom (*args)
      intern_atom!(*args).wait
    end
    
    # :nodoc:
    def intern_atom_reply (s)
      x = {}
      x[:atom], = s.slice!(0, 5).unpack("x1L")
      x[:atom] = find_atom(x[:atom])
      x[:atom]
    end
    
    # :nodoc:
    def get_atom_name! (atom)
      s = 17.chr.encode('BINARY')
      s << [atom(atom)].pack("x1L")
      send_request(s, :get_atom_name, true)
    end
    
    # :doc:
    def get_atom_name (*args)
      get_atom_name!(*args).wait
    end
    
    # :nodoc:
    def get_atom_name_reply (s)
      x = {}
      x[:name_len], = s.slice!(0, 25).unpack("x1Sx22")
      x[:name] = s.slice!(0, x[:name_len])
      x[:name]
    end
    
    # :nodoc:
    def change_property! (mode, window, property, type, format, data_len, data)
      s = 18.chr.encode('BINARY')
      s << [mode, window.to_i, atom(property), atom(type), format, data_len, pad(data)].pack("CLLLCx3LA*")
      send_request(s, :change_property, false)
    end
    
    # :doc:
    # Sets or updates a property on the specified `window`. Properties are for
    # example the window title (`WM_NAME`) or its minimum size (`WM_NORMAL_HINTS`).
    # Protocols such as EWMH also use properties - for example EWMH defines the
    # window title, encoded as UTF-8 string, in the `_NET_WM_NAME` property.
    def change_property (*args)
      change_property!(*args).abandon
    end
    
    # :nodoc:
    def delete_property! (window, property)
      s = 19.chr.encode('BINARY')
      s << [window.to_i, atom(property)].pack("x1LL")
      send_request(s, :delete_property, false)
    end
    
    # :doc:
    def delete_property (*args)
      delete_property!(*args).abandon
    end
    
    # :nodoc:
    def get_property! (delete, window, property, type, long_offset, long_length)
      s = 20.chr.encode('BINARY')
      s << [delete ? 1 : 0, window.to_i, atom(property), atom(type), long_offset, long_length].pack("CLLLLL")
      send_request(s, :get_property, true)
    end
    
    # :doc:
    # Gets the specified `property` from the specified `window`. Properties are for
    # example the window title (`WM_NAME`) or its minimum size (`WM_NORMAL_HINTS`).
    # Protocols such as EWMH also use properties - for example EWMH defines the
    # window title, encoded as UTF-8 string, in the `_NET_WM_NAME` property.
    # 
    # TODO: talk about `type`
    # 
    # TODO: talk about `delete`
    # 
    # TODO: talk about the offset/length thing. what's a valid use case?
    def get_property (*args)
      get_property!(*args).wait
    end
    
    # :nodoc:
    def get_property_reply (s)
      x = {}
      x[:format], x[:type], x[:bytes_after], x[:value_len], = s.slice!(0, 25).unpack("CLLLx12")
      x[:type] = find_atom(x[:type])
      x[:value] = s.slice!(0, (x[:value_len] * (x[:format] / 8)))
      x
    end
    
    # :nodoc:
    def list_properties! (window)
      s = 21.chr.encode('BINARY')
      s << [window.to_i].pack("x1L")
      send_request(s, :list_properties, true)
    end
    
    # :doc:
    def list_properties (*args)
      list_properties!(*args).wait
    end
    
    # :nodoc:
    def list_properties_reply (s)
      x = {}
      x[:atoms_len], *x[:atoms] = s.unpack("x1Sx22L*")
      x.delete(:atoms_len)
      x[:atoms] = x[:atoms] ? x[:atoms].map{|x|find_atom(x)} : []
      x[:atoms]
    end
    
    # :nodoc:
    def set_selection_owner! (owner, selection, time)
      s = 22.chr.encode('BINARY')
      s << [owner.to_i, atom(selection), time].pack("x1LLL")
      send_request(s, :set_selection_owner, false)
    end
    
    # :doc:
    # Makes `window` the owner of the selection `selection` and updates the
    # last-change time of the specified selection.
    # 
    # TODO: briefly explain what a selection is.
    def set_selection_owner (*args)
      set_selection_owner!(*args).abandon
    end
    
    # :nodoc:
    def get_selection_owner! (selection)
      s = 23.chr.encode('BINARY')
      s << [atom(selection)].pack("x1L")
      send_request(s, :get_selection_owner, true)
    end
    
    # :doc:
    # Gets the owner of the specified selection.
    # 
    # TODO: briefly explain what a selection is.
    def get_selection_owner (*args)
      get_selection_owner!(*args).wait
    end
    
    # :nodoc:
    def get_selection_owner_reply (s)
      x = {}
      x[:owner], = s.slice!(0, 5).unpack("x1L")
      x[:owner] = find_resource(x[:owner], "Window")
      x[:owner]
    end
    
    # :nodoc:
    def convert_selection! (requestor, selection, target, property, time)
      s = 24.chr.encode('BINARY')
      s << [requestor.to_i, atom(selection), atom(target), atom(property), time].pack("x1LLLLL")
      send_request(s, :convert_selection, false)
    end
    
    # :doc:
    def convert_selection (*args)
      convert_selection!(*args).abandon
    end
    
    # :nodoc:
    def send_event! (propagate, destination, event_mask, event)
      s = 25.chr.encode('BINARY')
      s << [propagate ? 1 : 0, destination.to_i, event_mask, pad(event)].pack("CLLA*")
      send_request(s, :send_event, false)
    end
    
    # :doc:
    # Identifies the `destination` window, determines which clients should receive
    # the specified event and ignores any active grabs.
    # 
    # The `event` must be one of the core events or an event defined by an extension,
    # so that the X server can correctly byte-swap the contents as necessary. The
    # contents of `event` are otherwise unaltered and unchecked except for the
    # `send_event` field which is forced to 'true'.
    def send_event (*args)
      send_event!(*args).abandon
    end
    
    # :nodoc:
    def grab_pointer! (owner_events, grab_window, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, time)
      s = 26.chr.encode('BINARY')
      s << [owner_events ? 1 : 0, grab_window.to_i, event_mask, pointer_mode, keyboard_mode, confine_to.to_i, cursor.to_i, time].pack("CLSCCLLL")
      send_request(s, :grab_pointer, true)
    end
    
    # :doc:
    # Actively grabs control of the pointer. Further pointer events are reported only to the grabbing client. Overrides any active pointer grab by this client.
    def grab_pointer (*args)
      grab_pointer!(*args).wait
    end
    
    # :nodoc:
    def grab_pointer_reply (s)
      x = {}
      x[:status], = s.slice!(0, 1).unpack("C")
      x[:status]
    end
    
    # :nodoc:
    def ungrab_pointer! (time)
      s = 27.chr.encode('BINARY')
      s << [time].pack("x1L")
      send_request(s, :ungrab_pointer, false)
    end
    
    # :doc:
    # Releases the pointer and any queued events if you actively grabbed the pointer
    # before using `xcb_grab_pointer`, `xcb_grab_button` or within a normal button
    # press.
    # 
    # EnterNotify and LeaveNotify events are generated.
    def ungrab_pointer (*args)
      ungrab_pointer!(*args).abandon
    end
    
    # :nodoc:
    def grab_button! (owner_events, grab_window, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, button, modifiers)
      s = 28.chr.encode('BINARY')
      s << [owner_events ? 1 : 0, grab_window.to_i, event_mask, pointer_mode, keyboard_mode, confine_to.to_i, cursor.to_i, button, modifiers].pack("CLSCCLLCx1S")
      send_request(s, :grab_button, false)
    end
    
    # :doc:
    # This request establishes a passive grab. The pointer is actively grabbed as
    # described in GrabPointer, the last-pointer-grab time is set to the time at
    # which the button was pressed (as transmitted in the ButtonPress event), and the
    # ButtonPress event is reported if all of the following conditions are true:
    # 
    # The pointer is not grabbed and the specified button is logically pressed when
    # the specified modifier keys are logically down, and no other buttons or
    # modifier keys are logically down.
    # 
    # The grab-window contains the pointer.
    # 
    # The confine-to window (if any) is viewable.
    # 
    # A passive grab on the same button/key combination does not exist on any
    # ancestor of grab-window.
    # 
    # The interpretation of the remaining arguments is the same as for GrabPointer.
    # The active grab is terminated automatically when the logical state of the
    # pointer has all buttons released, independent of the logical state of modifier
    # keys. Note that the logical state of a device (as seen by means of the
    # protocol) may lag the physical state if device event processing is frozen. This
    # request overrides all previous passive grabs by the same client on the same
    # button/key combinations on the same window. A modifier of AnyModifier is
    # equivalent to issuing the request for all possible modifier combinations
    # (including the combination of no modifiers). It is not required that all
    # specified modifiers have currently assigned keycodes. A button of AnyButton is
    # equivalent to issuing the request for all possible buttons. Otherwise, it is
    # not required that the button specified currently be assigned to a physical
    # button.
    # 
    # An Access error is generated if some other client has already issued a
    # GrabButton request with the same button/key combination on the same window.
    # When using AnyModifier or AnyButton, the request fails completely (no grabs are
    # established), and an Access error is generated if there is a conflicting grab
    # for any combination. The request has no effect on an active grab.
    def grab_button (*args)
      grab_button!(*args).abandon
    end
    
    # :nodoc:
    def ungrab_button! (button, grab_window, modifiers)
      s = 29.chr.encode('BINARY')
      s << [button, grab_window.to_i, modifiers].pack("CLSx2")
      send_request(s, :ungrab_button, false)
    end
    
    # :doc:
    def ungrab_button (*args)
      ungrab_button!(*args).abandon
    end
    
    # :nodoc:
    def change_active_pointer_grab! (cursor, time, event_mask)
      s = 30.chr.encode('BINARY')
      s << [cursor.to_i, time, event_mask].pack("x1LLSx2")
      send_request(s, :change_active_pointer_grab, false)
    end
    
    # :doc:
    def change_active_pointer_grab (*args)
      change_active_pointer_grab!(*args).abandon
    end
    
    # :nodoc:
    def grab_keyboard! (owner_events, grab_window, time, pointer_mode, keyboard_mode)
      s = 31.chr.encode('BINARY')
      s << [owner_events ? 1 : 0, grab_window.to_i, time, pointer_mode, keyboard_mode].pack("CLLCCx2")
      send_request(s, :grab_keyboard, true)
    end
    
    # :doc:
    # Actively grabs control of the keyboard and generates FocusIn and FocusOut
    # events. Further key events are reported only to the grabbing client.
    # 
    # Any active keyboard grab by this client is overridden. If the keyboard is
    # actively grabbed by some other client, `AlreadyGrabbed` is returned. If
    # `grab_window` is not viewable, `GrabNotViewable` is returned. If the keyboard
    # is frozen by an active grab of another client, `GrabFrozen` is returned. If the
    # specified `time` is earlier than the last-keyboard-grab time or later than the
    # current X server time, `GrabInvalidTime` is returned. Otherwise, the
    # last-keyboard-grab time is set to the specified time.
    def grab_keyboard (*args)
      grab_keyboard!(*args).wait
    end
    
    # :nodoc:
    def grab_keyboard_reply (s)
      x = {}
      x[:status], = s.slice!(0, 1).unpack("C")
      x[:status]
    end
    
    # :nodoc:
    def ungrab_keyboard! (time)
      s = 32.chr.encode('BINARY')
      s << [time].pack("x1L")
      send_request(s, :ungrab_keyboard, false)
    end
    
    # :doc:
    def ungrab_keyboard (*args)
      ungrab_keyboard!(*args).abandon
    end
    
    # :nodoc:
    def grab_key! (owner_events, grab_window, modifiers, key, pointer_mode, keyboard_mode)
      s = 33.chr.encode('BINARY')
      s << [owner_events ? 1 : 0, grab_window.to_i, modifiers, key, pointer_mode, keyboard_mode].pack("CLSCCCx3")
      send_request(s, :grab_key, false)
    end
    
    # :doc:
    # Establishes a passive grab on the keyboard. In the future, the keyboard is
    # actively grabbed (as for `GrabKeyboard`), the last-keyboard-grab time is set to
    # the time at which the key was pressed (as transmitted in the KeyPress event),
    # and the KeyPress event is reported if all of the following conditions are true:
    # 
    # The keyboard is not grabbed and the specified key (which can itself be a
    # modifier key) is logically pressed when the specified modifier keys are
    # logically down, and no other modifier keys are logically down.
    # 
    # Either the grab_window is an ancestor of (or is) the focus window, or the
    # grab_window is a descendant of the focus window and contains the pointer.
    # 
    # A passive grab on the same key combination does not exist on any ancestor of
    # grab_window.
    # 
    # The interpretation of the remaining arguments is as for XGrabKeyboard.  The active grab is terminated
    # automatically when the logical state of the keyboard has the specified key released (independent of the
    # logical state of the modifier keys), at which point a KeyRelease event is reported to the grabbing window.
    # 
    # Note that the logical state of a device (as seen by client applications) may lag the physical state if
    # device event processing is frozen.
    # 
    # A modifiers argument of AnyModifier is equivalent to issuing the request for all possible modifier combinations (including the combination of no modifiers).  It is not required that all modifiers specified
    # have currently assigned KeyCodes.  A keycode argument of AnyKey is equivalent to issuing the request for
    # all possible KeyCodes.  Otherwise, the specified keycode must be in the range specified by min_keycode
    # and max_keycode in the connection setup, or a BadValue error results.
    # 
    # If some other client has issued a XGrabKey with the same key combination on the same window, a BadAccess
    # error results.  When using AnyModifier or AnyKey, the request fails completely, and a BadAccess error
    # results (no grabs are established) if there is a conflicting grab for any combination.
    def grab_key (*args)
      grab_key!(*args).abandon
    end
    
    # :nodoc:
    def ungrab_key! (key, grab_window, modifiers)
      s = 34.chr.encode('BINARY')
      s << [key, grab_window.to_i, modifiers].pack("CLSx2")
      send_request(s, :ungrab_key, false)
    end
    
    # :doc:
    # Releases the key combination on `grab_window` if you grabbed it using
    # `xcb_grab_key` before.
    def ungrab_key (*args)
      ungrab_key!(*args).abandon
    end
    
    # :nodoc:
    def allow_events! (mode, time)
      s = 35.chr.encode('BINARY')
      s << [mode, time].pack("CL")
      send_request(s, :allow_events, false)
    end
    
    # :doc:
    # Releases queued events if the client has caused a device (pointer/keyboard) to
    # freeze due to grabbing it actively. This request has no effect if `time` is
    # earlier than the last-grab time of the most recent active grab for this client
    # or if `time` is later than the current X server time.
    def allow_events (*args)
      allow_events!(*args).abandon
    end
    
    # :nodoc:
    def grab_server! ()
      s = 36.chr.encode('BINARY')
      send_request(s, :grab_server, false)
    end
    
    # :doc:
    def grab_server (*args)
      grab_server!(*args).abandon
    end
    
    # :nodoc:
    def ungrab_server! ()
      s = 37.chr.encode('BINARY')
      send_request(s, :ungrab_server, false)
    end
    
    # :doc:
    def ungrab_server (*args)
      ungrab_server!(*args).abandon
    end
    
    # :nodoc:
    def query_pointer! (window)
      s = 38.chr.encode('BINARY')
      s << [window.to_i].pack("x1L")
      send_request(s, :query_pointer, true)
    end
    
    # :doc:
    # Gets the root window the pointer is logically on and the pointer coordinates
    # relative to the root window's origin.
    def query_pointer (*args)
      query_pointer!(*args).wait
    end
    
    # :nodoc:
    def query_pointer_reply (s)
      x = {}
      x[:same_screen], x[:root], x[:child], x[:root_x], x[:root_y], x[:win_x], x[:win_y], x[:mask], = s.slice!(0, 21).unpack("CLLssssSx2")
      x[:same_screen] = x[:same_screen] != 0
      x[:root] = find_resource(x[:root], "Window")
      x[:child] = find_resource(x[:child], "Window")
      x
    end
    
    # :nodoc:
    def get_motion_events! (window, start, stop)
      s = 39.chr.encode('BINARY')
      s << [window.to_i, start, stop].pack("x1LLL")
      send_request(s, :get_motion_events, true)
    end
    
    # :doc:
    def get_motion_events (*args)
      get_motion_events!(*args).wait
    end
    
    # :nodoc:
    def get_motion_events_reply (s)
      x = {}
      x[:events_len], = s.slice!(0, 25).unpack("x1Lx20")
      x[:events] = x[:events_len].times.map{decode_timecoord(s)}
      x[:events]
    end
    
    # :nodoc:
    def translate_coordinates! (src_window, dst_window, src_x, src_y)
      s = 40.chr.encode('BINARY')
      s << [src_window.to_i, dst_window.to_i, src_x, src_y].pack("x1LLss")
      send_request(s, :translate_coordinates, true)
    end
    
    # :doc:
    def translate_coordinates (*args)
      translate_coordinates!(*args).wait
    end
    
    # :nodoc:
    def translate_coordinates_reply (s)
      x = {}
      x[:same_screen], x[:child], x[:dst_x], x[:dst_y], = s.slice!(0, 9).unpack("CLss")
      x[:same_screen] = x[:same_screen] != 0
      x[:child] = find_resource(x[:child], "Window")
      x
    end
    
    # :nodoc:
    def warp_pointer! (src_window, dst_window, src_x, src_y, src_width, src_height, dst_x, dst_y)
      s = 41.chr.encode('BINARY')
      s << [src_window.to_i, dst_window.to_i, src_x, src_y, src_width, src_height, dst_x, dst_y].pack("x1LLssSSss")
      send_request(s, :warp_pointer, false)
    end
    
    # :doc:
    # Moves the mouse pointer to the specified position.
    # 
    # If `src_window` is not `XCB_NONE` (TODO), the move will only take place if the
    # pointer is inside `src_window` and within the rectangle specified by (`src_x`,
    # `src_y`, `src_width`, `src_height`). The rectangle coordinates are relative to
    # `src_window`.
    # 
    # If `dst_window` is not `XCB_NONE` (TODO), the pointer will be moved to the
    # offsets (`dst_x`, `dst_y`) relative to `dst_window`. If `dst_window` is
    # `XCB_NONE` (TODO), the pointer will be moved by the offsets (`dst_x`, `dst_y`)
    # relative to the current position of the pointer.
    def warp_pointer (*args)
      warp_pointer!(*args).abandon
    end
    
    # :nodoc:
    def set_input_focus! (revert_to, focus, time)
      s = 42.chr.encode('BINARY')
      s << [revert_to, focus.to_i, time].pack("CLL")
      send_request(s, :set_input_focus, false)
    end
    
    # :doc:
    # Changes the input focus and the last-focus-change time. If the specified `time`
    # is earlier than the current last-focus-change time, the request is ignored (to
    # avoid race conditions when running X over the network).
    # 
    # A FocusIn and FocusOut event is generated when focus is changed.
    def set_input_focus (*args)
      set_input_focus!(*args).abandon
    end
    
    # :nodoc:
    def get_input_focus! ()
      s = 43.chr.encode('BINARY')
      send_request(s, :get_input_focus, true)
    end
    
    # :doc:
    def get_input_focus (*args)
      get_input_focus!(*args).wait
    end
    
    # :nodoc:
    def get_input_focus_reply (s)
      x = {}
      x[:revert_to], x[:focus], = s.slice!(0, 5).unpack("CL")
      x[:focus] = find_resource(x[:focus], "Window")
      x
    end
    
    # :nodoc:
    def query_keymap! ()
      s = 44.chr.encode('BINARY')
      send_request(s, :query_keymap, true)
    end
    
    # :doc:
    def query_keymap (*args)
      query_keymap!(*args).wait
    end
    
    # :nodoc:
    def query_keymap_reply (s)
      x = {}
      s.slice!(0, 1)
      x[:keys] = s.slice!(0..32).unpack('C*')
      x[:keys]
    end
    
    # :nodoc:
    def open_font! (fid, name)
      s = 45.chr.encode('BINARY')
      name = name.force_encoding('BINARY')
      name_len = name.bytesize
      s << [fid.to_i, name_len, pad(name)].pack("x1LSx2A*")
      send_request(s, :open_font, false)
    end
    
    # :doc:
    # Opens any X core font matching the given `name` (for example "-misc-fixed-*").
    # 
    # Note that X core fonts are deprecated (but still supported) in favor of
    # client-side rendering using Xft.
    def open_font (*args)
      open_font!(*args).abandon
    end
    
    # :nodoc:
    def close_font! (font)
      s = 46.chr.encode('BINARY')
      s << [font.to_i].pack("x1L")
      send_request(s, :close_font, false)
    end
    
    # :doc:
    def close_font (*args)
      close_font!(*args).abandon
    end
    
    # :nodoc:
    def query_font! (font)
      s = 47.chr.encode('BINARY')
      s << [font.to_i].pack("x1L")
      send_request(s, :query_font, true)
    end
    
    # :doc:
    # Queries information associated with the font.
    def query_font (*args)
      query_font!(*args).wait
    end
    
    # :nodoc:
    def query_font_reply (s)
      x = {}
      s.slice!(0, 1)
      x[:min_bounds] = decode_charinfo(s)
      s.slice!(0, 4)
      x[:max_bounds] = decode_charinfo(s)
      x[:min_char_or_byte2], x[:max_char_or_byte2], x[:default_char], x[:properties_len], x[:draw_direction], x[:min_byte1], x[:max_byte1], x[:all_chars_exist], x[:font_ascent], x[:font_descent], x[:char_infos_len], = s.slice!(0, 24).unpack("x4SSSSCCCCssL")
      x[:all_chars_exist] = x[:all_chars_exist] != 0
      x[:properties] = x[:properties_len].times.map{decode_fontprop(s)}
      x[:char_infos] = x[:char_infos_len].times.map{decode_charinfo(s)}
      x
    end
    
    # :nodoc:
    def query_text_extents! (font, string)
      s = 48.chr.encode('BINARY')
      s << (string.length & 1)
      s << [font.to_i, pad(string)].pack("LA*")
      send_request(s, :query_text_extents, true)
    end
    
    # :doc:
    # Query text extents from the X11 server. This request returns the bounding box
    # of the specified 16-bit character string in the specified `font` or the font
    # contained in the specified graphics context.
    # 
    # `font_ascent` is set to the maximum of the ascent metrics of all characters in
    # the string. `font_descent` is set to the maximum of the descent metrics.
    # `overall_width` is set to the sum of the character-width metrics of all
    # characters in the string. For each character in the string, let W be the sum of
    # the character-width metrics of all characters preceding it in the string. Let L
    # be the left-side-bearing metric of the character plus W. Let R be the
    # right-side-bearing metric of the character plus W. The lbearing member is set
    # to the minimum L of all characters in the string. The rbearing member is set to
    # the maximum R.
    # 
    # For fonts defined with linear indexing rather than 2-byte matrix indexing, each
    # `xcb_char2b_t` structure is interpreted as a 16-bit number with byte1 as the
    # most significant byte. If the font has no defined default character, undefined
    # characters in the string are taken to have all zero metrics.
    # 
    # Characters with all zero metrics are ignored. If the font has no defined
    # default_char, the undefined characters in the string are also ignored.
    def query_text_extents (*args)
      query_text_extents!(*args).wait
    end
    
    # :nodoc:
    def query_text_extents_reply (s)
      x = {}
      x[:draw_direction], x[:font_ascent], x[:font_descent], x[:overall_ascent], x[:overall_descent], x[:overall_width], x[:overall_left], x[:overall_right], = s.slice!(0, 21).unpack("Csssslll")
      x
    end
    
    # :nodoc:
    def list_fonts! (max_names, pattern)
      s = 49.chr.encode('BINARY')
      pattern = pattern.force_encoding('BINARY')
      pattern_len = pattern.bytesize
      s << [max_names, pattern_len, pad(pattern)].pack("x1SSA*")
      send_request(s, :list_fonts, true)
    end
    
    # :doc:
    # Gets a list of available font names which match the given `pattern`.
    def list_fonts (*args)
      list_fonts!(*args).wait
    end
    
    # :nodoc:
    def list_fonts_reply (s)
      x = {}
      x[:names_len], = s.slice!(0, 25).unpack("x1Sx22")
      x[:names] = x[:names_len].times.map{decode_str(s)}
      x[:names]
    end
    
    # :nodoc:
    def list_fonts_with_info! (max_names, pattern)
      s = 50.chr.encode('BINARY')
      pattern = pattern.force_encoding('BINARY')
      pattern_len = pattern.bytesize
      s << [max_names, pattern_len, pad(pattern)].pack("x1SSA*")
      send_request(s, :list_fonts_with_info, true)
    end
    
    # :doc:
    # Gets a list of available font names which match the given `pattern`.
    def list_fonts_with_info (*args)
      list_fonts_with_info!(*args).wait
    end
    
    # :nodoc:
    def list_fonts_with_info_reply (s)
      x = {}
      x[:name_len], = s.slice!(0, 1).unpack("C")
      x[:min_bounds] = decode_charinfo(s)
      s.slice!(0, 4)
      x[:max_bounds] = decode_charinfo(s)
      x[:min_char_or_byte2], x[:max_char_or_byte2], x[:default_char], x[:properties_len], x[:draw_direction], x[:min_byte1], x[:max_byte1], x[:all_chars_exist], x[:font_ascent], x[:font_descent], x[:replies_hint], = s.slice!(0, 24).unpack("x4SSSSCCCCssL")
      x[:all_chars_exist] = x[:all_chars_exist] != 0
      x[:properties] = x[:properties_len].times.map{decode_fontprop(s)}
      x[:name] = s.slice!(0, x[:name_len])
      x
    end
    
    # :nodoc:
    def set_font_path! (font)
      s = 51.chr.encode('BINARY')
      font_qty = font.length
      s << [font_qty].pack("x1Sx2")
      s << font.map{|x|encode_str(''.encode('BINARY'), *x)}.join
      send_request(s, :set_font_path, false)
    end
    
    # :doc:
    def set_font_path (*args)
      set_font_path!(*args).abandon
    end
    
    # :nodoc:
    def get_font_path! ()
      s = 52.chr.encode('BINARY')
      send_request(s, :get_font_path, true)
    end
    
    # :doc:
    def get_font_path (*args)
      get_font_path!(*args).wait
    end
    
    # :nodoc:
    def get_font_path_reply (s)
      x = {}
      x[:path_len], = s.slice!(0, 25).unpack("x1Sx22")
      x[:path] = x[:path_len].times.map{decode_str(s)}
      x[:path]
    end
    
    # :nodoc:
    def create_pixmap! (depth, pid, drawable, width, height)
      s = 53.chr.encode('BINARY')
      s << [depth, pid.to_i, drawable.to_i, width, height].pack("CLLSS")
      send_request(s, :create_pixmap, false)
    end
    
    # :doc:
    # Creates a pixmap. The pixmap can only be used on the same screen as `drawable`
    # is on and only with drawables of the same `depth`.
    def create_pixmap (*args)
      create_pixmap!(*args).abandon
    end
    
    # :nodoc:
    def free_pixmap! (pixmap)
      s = 54.chr.encode('BINARY')
      s << [pixmap.to_i].pack("x1L")
      send_request(s, :free_pixmap, false)
    end
    
    # :doc:
    # Deletes the association between the pixmap ID and the pixmap. The pixmap
    # storage will be freed when there are no more references to it.
    def free_pixmap (*args)
      free_pixmap!(*args).abandon
    end
    
    # :nodoc:
    def create_gc! (cid, drawable, value_mask, *value_list)
      s = 55.chr.encode('BINARY')
      s << [cid.to_i, drawable.to_i, value_mask, *value_list.map(&:to_i)].pack("x1LLLL*")
      send_request(s, :create_gc, false)
    end
    
    # :doc:
    # Creates a graphics context. The graphics context can be used with any drawable
    # that has the same root and depth as the specified drawable.
    def create_gc (*args)
      create_gc!(*args).abandon
    end
    
    # :nodoc:
    def change_gc! (gc, value_mask, *value_list)
      s = 56.chr.encode('BINARY')
      s << [gc.to_i, value_mask, *value_list.map(&:to_i)].pack("x1LLL*")
      send_request(s, :change_gc, false)
    end
    
    # :doc:
    # Changes the components specified by `value_mask` for the specified graphics context.
    def change_gc (*args)
      change_gc!(*args).abandon
    end
    
    # :nodoc:
    def copy_gc! (src_gc, dst_gc, value_mask)
      s = 57.chr.encode('BINARY')
      s << [src_gc.to_i, dst_gc.to_i, value_mask].pack("x1LLL")
      send_request(s, :copy_gc, false)
    end
    
    # :doc:
    def copy_gc (*args)
      copy_gc!(*args).abandon
    end
    
    # :nodoc:
    def set_dashes! (gc, dash_offset, dashes)
      s = 58.chr.encode('BINARY')
      dashes_len = dashes.length
      s << [gc.to_i, dash_offset, dashes_len, *dashes].pack("x1LSSC*")
      send_request(s, :set_dashes, false)
    end
    
    # :doc:
    def set_dashes (*args)
      set_dashes!(*args).abandon
    end
    
    # :nodoc:
    def set_clip_rectangles! (ordering, gc, clip_x_origin, clip_y_origin, rectangles)
      s = 59.chr.encode('BINARY')
      s << [ordering, gc.to_i, clip_x_origin, clip_y_origin].pack("CLss")
      s << rectangles.map{|x|encode_rectangle(''.encode('BINARY'), *x)}.join
      send_request(s, :set_clip_rectangles, false)
    end
    
    # :doc:
    def set_clip_rectangles (*args)
      set_clip_rectangles!(*args).abandon
    end
    
    # :nodoc:
    def free_gc! (gc)
      s = 60.chr.encode('BINARY')
      s << [gc.to_i].pack("x1L")
      send_request(s, :free_gc, false)
    end
    
    # :doc:
    # Destroys the specified `gc` and all associated storage.
    def free_gc (*args)
      free_gc!(*args).abandon
    end
    
    # :nodoc:
    def clear_area! (exposures, window, x, y, width, height)
      s = 61.chr.encode('BINARY')
      s << [exposures ? 1 : 0, window.to_i, x, y, width, height].pack("CLssSS")
      send_request(s, :clear_area, false)
    end
    
    # :doc:
    def clear_area (*args)
      clear_area!(*args).abandon
    end
    
    # :nodoc:
    def copy_area! (src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height)
      s = 62.chr.encode('BINARY')
      s << [src_drawable.to_i, dst_drawable.to_i, gc.to_i, src_x, src_y, dst_x, dst_y, width, height].pack("x1LLLssssSS")
      send_request(s, :copy_area, false)
    end
    
    # :doc:
    # Copies the specified rectangle from `src_drawable` to `dst_drawable`.
    def copy_area (*args)
      copy_area!(*args).abandon
    end
    
    # :nodoc:
    def copy_plane! (src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height, bit_plane)
      s = 63.chr.encode('BINARY')
      s << [src_drawable.to_i, dst_drawable.to_i, gc.to_i, src_x, src_y, dst_x, dst_y, width, height, bit_plane].pack("x1LLLssssSSL")
      send_request(s, :copy_plane, false)
    end
    
    # :doc:
    def copy_plane (*args)
      copy_plane!(*args).abandon
    end
    
    # :nodoc:
    def poly_point! (coordinate_mode, drawable, gc, points)
      s = 64.chr.encode('BINARY')
      s << [coordinate_mode, drawable.to_i, gc.to_i].pack("CLL")
      s << points.map{|x|encode_point(''.encode('BINARY'), *x)}.join
      send_request(s, :poly_point, false)
    end
    
    # :doc:
    def poly_point (*args)
      poly_point!(*args).abandon
    end
    
    # :nodoc:
    def poly_line! (coordinate_mode, drawable, gc, points)
      s = 65.chr.encode('BINARY')
      s << [coordinate_mode, drawable.to_i, gc.to_i].pack("CLL")
      s << points.map{|x|encode_point(''.encode('BINARY'), *x)}.join
      send_request(s, :poly_line, false)
    end
    
    # :doc:
    # Draws `points_len`-1 lines between each pair of points (point[i], point[i+1])
    # in the `points` array. The lines are drawn in the order listed in the array.
    # They join correctly at all intermediate points, and if the first and last
    # points coincide, the first and last lines also join correctly. For any given
    # line, a pixel is not drawn more than once. If thin (zero line-width) lines
    # intersect, the intersecting pixels are drawn multiple times. If wide lines
    # intersect, the intersecting pixels are drawn only once, as though the entire
    # request were a single, filled shape.
    def poly_line (*args)
      poly_line!(*args).abandon
    end
    
    # :nodoc:
    def poly_segment! (drawable, gc, segments)
      s = 66.chr.encode('BINARY')
      s << [drawable.to_i, gc.to_i].pack("x1LL")
      s << segments.map{|x|encode_segment(''.encode('BINARY'), *x)}.join
      send_request(s, :poly_segment, false)
    end
    
    # :doc:
    # Draws multiple, unconnected lines. For each segment, a line is drawn between
    # (x1, y1) and (x2, y2). The lines are drawn in the order listed in the array of
    # `xcb_segment_t` structures and does not perform joining at coincident
    # endpoints. For any given line, a pixel is not drawn more than once. If lines
    # intersect, the intersecting pixels are drawn multiple times.
    # 
    # TODO: include the xcb_segment_t data structure
    # 
    # TODO: an example
    def poly_segment (*args)
      poly_segment!(*args).abandon
    end
    
    # :nodoc:
    def poly_rectangle! (drawable, gc, rectangles)
      s = 67.chr.encode('BINARY')
      s << [drawable.to_i, gc.to_i].pack("x1LL")
      s << rectangles.map{|x|encode_rectangle(''.encode('BINARY'), *x)}.join
      send_request(s, :poly_rectangle, false)
    end
    
    # :doc:
    def poly_rectangle (*args)
      poly_rectangle!(*args).abandon
    end
    
    # :nodoc:
    def poly_arc! (drawable, gc, arcs)
      s = 68.chr.encode('BINARY')
      s << [drawable.to_i, gc.to_i].pack("x1LL")
      s << arcs.map{|x|encode_arc(''.encode('BINARY'), *x)}.join
      send_request(s, :poly_arc, false)
    end
    
    # :doc:
    def poly_arc (*args)
      poly_arc!(*args).abandon
    end
    
    # :nodoc:
    def fill_poly! (drawable, gc, shape, coordinate_mode, points)
      s = 69.chr.encode('BINARY')
      s << [drawable.to_i, gc.to_i, shape, coordinate_mode].pack("x1LLCCx2")
      s << points.map{|x|encode_point(''.encode('BINARY'), *x)}.join
      send_request(s, :fill_poly, false)
    end
    
    # :doc:
    def fill_poly (*args)
      fill_poly!(*args).abandon
    end
    
    # :nodoc:
    def poly_fill_rectangle! (drawable, gc, rectangles)
      s = 70.chr.encode('BINARY')
      s << [drawable.to_i, gc.to_i].pack("x1LL")
      s << rectangles.map{|x|encode_rectangle(''.encode('BINARY'), *x)}.join
      send_request(s, :poly_fill_rectangle, false)
    end
    
    # :doc:
    # Fills the specified rectangle(s) in the order listed in the array. For any
    # given rectangle, each pixel is not drawn more than once. If rectangles
    # intersect, the intersecting pixels are drawn multiple times.
    def poly_fill_rectangle (*args)
      poly_fill_rectangle!(*args).abandon
    end
    
    # :nodoc:
    def poly_fill_arc! (drawable, gc, arcs)
      s = 71.chr.encode('BINARY')
      s << [drawable.to_i, gc.to_i].pack("x1LL")
      s << arcs.map{|x|encode_arc(''.encode('BINARY'), *x)}.join
      send_request(s, :poly_fill_arc, false)
    end
    
    # :doc:
    def poly_fill_arc (*args)
      poly_fill_arc!(*args).abandon
    end
    
    # :nodoc:
    def put_image! (format, drawable, gc, width, height, dst_x, dst_y, left_pad, depth, data)
      s = 72.chr.encode('BINARY')
      s << [format, drawable.to_i, gc.to_i, width, height, dst_x, dst_y, left_pad, depth, pad(data)].pack("CLLSSssCCx2A*")
      send_request(s, :put_image, false)
    end
    
    # :doc:
    def put_image (*args)
      put_image!(*args).abandon
    end
    
    # :nodoc:
    def get_image! (format, drawable, x, y, width, height, plane_mask)
      s = 73.chr.encode('BINARY')
      s << [format, drawable.to_i, x, y, width, height, plane_mask].pack("CLssSSL")
      send_request(s, :get_image, true)
    end
    
    # :doc:
    def get_image (*args)
      get_image!(*args).wait
    end
    
    # :nodoc:
    def get_image_reply (s)
      x = {}
      x[:depth], x[:visual], = s.slice!(0, 25).unpack("CLx20")
      x[:data] = s.slice!(0, (x[:length] * 4))
      x
    end
    
    # :nodoc:
    def poly_text8! (drawable, gc, x, y, items)
      s = 74.chr.encode('BINARY')
      s << [drawable.to_i, gc.to_i, x, y, pad(items)].pack("x1LLssA*")
      send_request(s, :poly_text8, false)
    end
    
    # :doc:
    def poly_text8 (*args)
      poly_text8!(*args).abandon
    end
    
    # :nodoc:
    def poly_text16! (drawable, gc, x, y, items)
      s = 75.chr.encode('BINARY')
      s << [drawable.to_i, gc.to_i, x, y, pad(items)].pack("x1LLssA*")
      send_request(s, :poly_text16, false)
    end
    
    # :doc:
    def poly_text16 (*args)
      poly_text16!(*args).abandon
    end
    
    # :nodoc:
    def image_text8! (drawable, gc, x, y, string)
      s = 76.chr.encode('BINARY')
      string = string.force_encoding('BINARY')
      string_len = string.bytesize
      s << [string_len, drawable.to_i, gc.to_i, x, y, pad(string)].pack("CLLssA*")
      send_request(s, :image_text8, false)
    end
    
    # :doc:
    # Fills the destination rectangle with the background pixel from `gc`, then
    # paints the text with the foreground pixel from `gc`. The upper-left corner of
    # the filled rectangle is at [x, y - font-ascent]. The width is overall-width,
    # the height is font-ascent + font-descent. The overall-width, font-ascent and
    # font-descent are as returned by `xcb_query_text_extents` (TODO).
    # 
    # Note that using X core fonts is deprecated (but still supported) in favor of
    # client-side rendering using Xft.
    def image_text8 (*args)
      image_text8!(*args).abandon
    end
    
    # :nodoc:
    def image_text16! (drawable, gc, x, y, string)
      s = 77.chr.encode('BINARY')
      string = string.encode('UTF-16BE').force_encoding('BINARY')
      string_len = string.bytesize / 2
      s << [string_len, drawable.to_i, gc.to_i, x, y, pad(string)].pack("CLLssA*")
      send_request(s, :image_text16, false)
    end
    
    # :doc:
    # Fills the destination rectangle with the background pixel from `gc`, then
    # paints the text with the foreground pixel from `gc`. The upper-left corner of
    # the filled rectangle is at [x, y - font-ascent]. The width is overall-width,
    # the height is font-ascent + font-descent. The overall-width, font-ascent and
    # font-descent are as returned by `xcb_query_text_extents` (TODO).
    # 
    # Note that using X core fonts is deprecated (but still supported) in favor of
    # client-side rendering using Xft.
    def image_text16 (*args)
      image_text16!(*args).abandon
    end
    
    # :nodoc:
    def create_colormap! (alloc, mid, window, visual)
      s = 78.chr.encode('BINARY')
      s << [alloc, mid.to_i, window.to_i, visual].pack("CLLL")
      send_request(s, :create_colormap, false)
    end
    
    # :doc:
    def create_colormap (*args)
      create_colormap!(*args).abandon
    end
    
    # :nodoc:
    def free_colormap! (cmap)
      s = 79.chr.encode('BINARY')
      s << [cmap.to_i].pack("x1L")
      send_request(s, :free_colormap, false)
    end
    
    # :doc:
    def free_colormap (*args)
      free_colormap!(*args).abandon
    end
    
    # :nodoc:
    def copy_colormap_and_free! (mid, src_cmap)
      s = 80.chr.encode('BINARY')
      s << [mid.to_i, src_cmap.to_i].pack("x1LL")
      send_request(s, :copy_colormap_and_free, false)
    end
    
    # :doc:
    def copy_colormap_and_free (*args)
      copy_colormap_and_free!(*args).abandon
    end
    
    # :nodoc:
    def install_colormap! (cmap)
      s = 81.chr.encode('BINARY')
      s << [cmap.to_i].pack("x1L")
      send_request(s, :install_colormap, false)
    end
    
    # :doc:
    def install_colormap (*args)
      install_colormap!(*args).abandon
    end
    
    # :nodoc:
    def uninstall_colormap! (cmap)
      s = 82.chr.encode('BINARY')
      s << [cmap.to_i].pack("x1L")
      send_request(s, :uninstall_colormap, false)
    end
    
    # :doc:
    def uninstall_colormap (*args)
      uninstall_colormap!(*args).abandon
    end
    
    # :nodoc:
    def list_installed_colormaps! (window)
      s = 83.chr.encode('BINARY')
      s << [window.to_i].pack("x1L")
      send_request(s, :list_installed_colormaps, true)
    end
    
    # :doc:
    def list_installed_colormaps (*args)
      list_installed_colormaps!(*args).wait
    end
    
    # :nodoc:
    def list_installed_colormaps_reply (s)
      x = {}
      x[:cmaps_len], *x[:cmaps] = s.unpack("x1Sx22L*")
      x.delete(:cmaps_len)
      x[:cmaps] = x[:cmaps] ? x[:cmaps].map{|x|find_resource(x, "Colormap")} : []
      x[:cmaps]
    end
    
    # :nodoc:
    def alloc_color! (cmap, red, green, blue)
      s = 84.chr.encode('BINARY')
      s << [cmap.to_i, red, green, blue].pack("x1LSSSx2")
      send_request(s, :alloc_color, true)
    end
    
    # :doc:
    # Allocates a read-only colormap entry corresponding to the closest RGB value
    # supported by the hardware. If you are using TrueColor, you can take a shortcut
    # and directly calculate the color pixel value to avoid the round trip. But, for
    # example, on 16-bit color setups (VNC), you can easily get the closest supported
    # RGB value to the RGB value you are specifying.
    def alloc_color (*args)
      alloc_color!(*args).wait
    end
    
    # :nodoc:
    def alloc_color_reply (s)
      x = {}
      x[:red], x[:green], x[:blue], x[:pixel], = s.slice!(0, 13).unpack("x1SSSx2L")
      x
    end
    
    # :nodoc:
    def alloc_named_color! (cmap, name)
      s = 85.chr.encode('BINARY')
      name = name.force_encoding('BINARY')
      name_len = name.bytesize
      s << [cmap.to_i, name_len, pad(name)].pack("x1LSx2A*")
      send_request(s, :alloc_named_color, true)
    end
    
    # :doc:
    def alloc_named_color (*args)
      alloc_named_color!(*args).wait
    end
    
    # :nodoc:
    def alloc_named_color_reply (s)
      x = {}
      x[:pixel], x[:exact_red], x[:exact_green], x[:exact_blue], x[:visual_red], x[:visual_green], x[:visual_blue], = s.slice!(0, 17).unpack("x1LSSSSSS")
      x
    end
    
    # :nodoc:
    def alloc_color_cells! (contiguous, cmap, colors, planes)
      s = 86.chr.encode('BINARY')
      s << [contiguous ? 1 : 0, cmap.to_i, colors, planes].pack("CLSS")
      send_request(s, :alloc_color_cells, true)
    end
    
    # :doc:
    def alloc_color_cells (*args)
      alloc_color_cells!(*args).wait
    end
    
    # :nodoc:
    def alloc_color_cells_reply (s)
      x = {}
      x[:pixels_len], x[:masks_len], = s.slice!(0, 25).unpack("x1SSx20")
      x[:pixels] = s.slice!(0..4*(x[:pixels_len])).unpack('L*')
      x.delete(:pixels_len)
      *x[:masks] = s.unpack("L*")
      x.delete(:masks_len)
      x
    end
    
    # :nodoc:
    def alloc_color_planes! (contiguous, cmap, colors, reds, greens, blues)
      s = 87.chr.encode('BINARY')
      s << [contiguous ? 1 : 0, cmap.to_i, colors, reds, greens, blues].pack("CLSSSS")
      send_request(s, :alloc_color_planes, true)
    end
    
    # :doc:
    def alloc_color_planes (*args)
      alloc_color_planes!(*args).wait
    end
    
    # :nodoc:
    def alloc_color_planes_reply (s)
      x = {}
      x[:pixels_len], x[:red_mask], x[:green_mask], x[:blue_mask], *x[:pixels] = s.unpack("x1Sx2LLLx8L*")
      x.delete(:pixels_len)
      x
    end
    
    # :nodoc:
    def free_colors! (cmap, plane_mask, pixels)
      s = 88.chr.encode('BINARY')
      s << [cmap.to_i, plane_mask, *pixels].pack("x1LLL*")
      send_request(s, :free_colors, false)
    end
    
    # :doc:
    def free_colors (*args)
      free_colors!(*args).abandon
    end
    
    # :nodoc:
    def store_colors! (cmap, items)
      s = 89.chr.encode('BINARY')
      s << [cmap.to_i].pack("x1L")
      s << items.map{|x|encode_coloritem(''.encode('BINARY'), *x)}.join
      send_request(s, :store_colors, false)
    end
    
    # :doc:
    def store_colors (*args)
      store_colors!(*args).abandon
    end
    
    # :nodoc:
    def store_named_color! (flags, cmap, pixel, name)
      s = 90.chr.encode('BINARY')
      name = name.force_encoding('BINARY')
      name_len = name.bytesize
      s << [flags, cmap.to_i, pixel, name_len, pad(name)].pack("CLLSx2A*")
      send_request(s, :store_named_color, false)
    end
    
    # :doc:
    def store_named_color (*args)
      store_named_color!(*args).abandon
    end
    
    # :nodoc:
    def query_colors! (cmap, pixels)
      s = 91.chr.encode('BINARY')
      s << [cmap.to_i, *pixels].pack("x1LL*")
      send_request(s, :query_colors, true)
    end
    
    # :doc:
    def query_colors (*args)
      query_colors!(*args).wait
    end
    
    # :nodoc:
    def query_colors_reply (s)
      x = {}
      x[:colors_len], = s.slice!(0, 25).unpack("x1Sx22")
      x[:colors] = x[:colors_len].times.map{decode_rgb(s)}
      x[:colors]
    end
    
    # :nodoc:
    def lookup_color! (cmap, name)
      s = 92.chr.encode('BINARY')
      name = name.force_encoding('BINARY')
      name_len = name.bytesize
      s << [cmap.to_i, name_len, pad(name)].pack("x1LSx2A*")
      send_request(s, :lookup_color, true)
    end
    
    # :doc:
    def lookup_color (*args)
      lookup_color!(*args).wait
    end
    
    # :nodoc:
    def lookup_color_reply (s)
      x = {}
      x[:exact_red], x[:exact_green], x[:exact_blue], x[:visual_red], x[:visual_green], x[:visual_blue], = s.slice!(0, 13).unpack("x1SSSSSS")
      x
    end
    
    # :nodoc:
    def create_cursor! (cid, source, mask, fore_red, fore_green, fore_blue, back_red, back_green, back_blue, x, y)
      s = 93.chr.encode('BINARY')
      s << [cid.to_i, source.to_i, mask.to_i, fore_red, fore_green, fore_blue, back_red, back_green, back_blue, x, y].pack("x1LLLSSSSSSSS")
      send_request(s, :create_cursor, false)
    end
    
    # :doc:
    def create_cursor (*args)
      create_cursor!(*args).abandon
    end
    
    # :nodoc:
    def create_glyph_cursor! (cid, source_font, mask_font, source_char, mask_char, fore_red, fore_green, fore_blue, back_red, back_green, back_blue)
      s = 94.chr.encode('BINARY')
      s << [cid.to_i, source_font.to_i, mask_font.to_i, source_char, mask_char, fore_red, fore_green, fore_blue, back_red, back_green, back_blue].pack("x1LLLSSSSSSSS")
      send_request(s, :create_glyph_cursor, false)
    end
    
    # :doc:
    # Creates a cursor from a font glyph. X provides a set of standard cursor shapes
    # in a special font named cursor. Applications are encouraged to use this
    # interface for their cursors because the font can be customized for the
    # individual display type.
    # 
    # All pixels which are set to 1 in the source will use the foreground color (as
    # specified by `fore_red`, `fore_green` and `fore_blue`). All pixels set to 0
    # will use the background color (as specified by `back_red`, `back_green` and
    # `back_blue`).
    def create_glyph_cursor (*args)
      create_glyph_cursor!(*args).abandon
    end
    
    # :nodoc:
    def free_cursor! (cursor)
      s = 95.chr.encode('BINARY')
      s << [cursor.to_i].pack("x1L")
      send_request(s, :free_cursor, false)
    end
    
    # :doc:
    # Deletes the association between the cursor resource ID and the specified
    # cursor. The cursor is freed when no other resource references it.
    def free_cursor (*args)
      free_cursor!(*args).abandon
    end
    
    # :nodoc:
    def recolor_cursor! (cursor, fore_red, fore_green, fore_blue, back_red, back_green, back_blue)
      s = 96.chr.encode('BINARY')
      s << [cursor.to_i, fore_red, fore_green, fore_blue, back_red, back_green, back_blue].pack("x1LSSSSSS")
      send_request(s, :recolor_cursor, false)
    end
    
    # :doc:
    def recolor_cursor (*args)
      recolor_cursor!(*args).abandon
    end
    
    # :nodoc:
    def query_best_size! (klass, drawable, width, height)
      s = 97.chr.encode('BINARY')
      s << [klass, drawable.to_i, width, height].pack("CLSS")
      send_request(s, :query_best_size, true)
    end
    
    # :doc:
    def query_best_size (*args)
      query_best_size!(*args).wait
    end
    
    # :nodoc:
    def query_best_size_reply (s)
      x = {}
      x[:width], x[:height], = s.slice!(0, 5).unpack("x1SS")
      x
    end
    
    # :nodoc:
    def query_extension! (name)
      s = 98.chr.encode('BINARY')
      name = name.force_encoding('BINARY')
      name_len = name.bytesize
      s << [name_len, pad(name)].pack("x1Sx2A*")
      send_request(s, :query_extension, true)
    end
    
    # :doc:
    # Determines if the specified extension is present on this X11 server.
    # 
    # Every extension has a unique `major_opcode` to identify requests, the minor
    # opcodes and request formats are extension-specific. If the extension provides
    # events and errors, the `first_event` and `first_error` fields in the reply are
    # set accordingly.
    # 
    # There should rarely be a need to use this request directly, XCB provides the
    # `xcb_get_extension_data` function instead.
    def query_extension (*args)
      query_extension!(*args).wait
    end
    
    # :nodoc:
    def query_extension_reply (s)
      x = {}
      x[:present], x[:major_opcode], x[:first_event], x[:first_error], = s.slice!(0, 5).unpack("x1CCCC")
      x[:present] = x[:present] != 0
      x
    end
    
    # :nodoc:
    def list_extensions! ()
      s = 99.chr.encode('BINARY')
      send_request(s, :list_extensions, true)
    end
    
    # :doc:
    def list_extensions (*args)
      list_extensions!(*args).wait
    end
    
    # :nodoc:
    def list_extensions_reply (s)
      x = {}
      x[:names_len], = s.slice!(0, 25).unpack("Cx24")
      x[:names] = x[:names_len].times.map{decode_str(s)}
      x[:names]
    end
    
    # :nodoc:
    def change_keyboard_mapping! (keycode_count, first_keycode, keysyms_per_keycode, keysyms)
      s = 100.chr.encode('BINARY')
      s << [keycode_count, first_keycode, keysyms_per_keycode, *keysyms].pack("CCCx2L*")
      send_request(s, :change_keyboard_mapping, false)
    end
    
    # :doc:
    def change_keyboard_mapping (*args)
      change_keyboard_mapping!(*args).abandon
    end
    
    # :nodoc:
    def get_keyboard_mapping! (first_keycode, count)
      s = 101.chr.encode('BINARY')
      s << [first_keycode, count].pack("x1CC")
      send_request(s, :get_keyboard_mapping, true)
    end
    
    # :doc:
    def get_keyboard_mapping (*args)
      get_keyboard_mapping!(*args).wait
    end
    
    # :nodoc:
    def get_keyboard_mapping_reply (s)
      x = {}
      x[:keysyms_per_keycode], *x[:keysyms] = s.unpack("Cx24L*")
      x.delete(:length)
      x
    end
    
    # :nodoc:
    def change_keyboard_control! (value_mask, *value_list)
      s = 102.chr.encode('BINARY')
      s << [value_mask, *value_list.map(&:to_i)].pack("x1LL*")
      send_request(s, :change_keyboard_control, false)
    end
    
    # :doc:
    def change_keyboard_control (*args)
      change_keyboard_control!(*args).abandon
    end
    
    # :nodoc:
    def get_keyboard_control! ()
      s = 103.chr.encode('BINARY')
      send_request(s, :get_keyboard_control, true)
    end
    
    # :doc:
    def get_keyboard_control (*args)
      get_keyboard_control!(*args).wait
    end
    
    # :nodoc:
    def get_keyboard_control_reply (s)
      x = {}
      x[:global_auto_repeat], x[:led_mask], x[:key_click_percent], x[:bell_percent], x[:bell_pitch], x[:bell_duration], = s.slice!(0, 13).unpack("CLCCSSx2")
      x[:auto_repeats] = s.slice!(0..32).unpack('C*')
      x
    end
    
    # :nodoc:
    def bell! (percent)
      s = 104.chr.encode('BINARY')
      s << [percent].pack("c")
      send_request(s, :bell, false)
    end
    
    # :doc:
    def bell (*args)
      bell!(*args).abandon
    end
    
    # :nodoc:
    def change_pointer_control! (acceleration_numerator, acceleration_denominator, threshold, do_acceleration, do_threshold)
      s = 105.chr.encode('BINARY')
      s << [acceleration_numerator, acceleration_denominator, threshold, do_acceleration ? 1 : 0, do_threshold ? 1 : 0].pack("x1sssCC")
      send_request(s, :change_pointer_control, false)
    end
    
    # :doc:
    def change_pointer_control (*args)
      change_pointer_control!(*args).abandon
    end
    
    # :nodoc:
    def get_pointer_control! ()
      s = 106.chr.encode('BINARY')
      send_request(s, :get_pointer_control, true)
    end
    
    # :doc:
    def get_pointer_control (*args)
      get_pointer_control!(*args).wait
    end
    
    # :nodoc:
    def get_pointer_control_reply (s)
      x = {}
      x[:acceleration_numerator], x[:acceleration_denominator], x[:threshold], = s.slice!(0, 25).unpack("x1SSSx18")
      x
    end
    
    # :nodoc:
    def set_screen_saver! (timeout, interval, prefer_blanking, allow_exposures)
      s = 107.chr.encode('BINARY')
      s << [timeout, interval, prefer_blanking, allow_exposures].pack("x1ssCC")
      send_request(s, :set_screen_saver, false)
    end
    
    # :doc:
    def set_screen_saver (*args)
      set_screen_saver!(*args).abandon
    end
    
    # :nodoc:
    def get_screen_saver! ()
      s = 108.chr.encode('BINARY')
      send_request(s, :get_screen_saver, true)
    end
    
    # :doc:
    def get_screen_saver (*args)
      get_screen_saver!(*args).wait
    end
    
    # :nodoc:
    def get_screen_saver_reply (s)
      x = {}
      x[:timeout], x[:interval], x[:prefer_blanking], x[:allow_exposures], = s.slice!(0, 25).unpack("x1SSCCx18")
      x
    end
    
    # :nodoc:
    def change_hosts! (mode, family, address)
      s = 109.chr.encode('BINARY')
      address = address.force_encoding('BINARY')
      address_len = address.bytesize
      s << [mode, family, address_len, pad(address)].pack("CCx1SA*")
      send_request(s, :change_hosts, false)
    end
    
    # :doc:
    def change_hosts (*args)
      change_hosts!(*args).abandon
    end
    
    # :nodoc:
    def list_hosts! ()
      s = 110.chr.encode('BINARY')
      send_request(s, :list_hosts, true)
    end
    
    # :doc:
    def list_hosts (*args)
      list_hosts!(*args).wait
    end
    
    # :nodoc:
    def list_hosts_reply (s)
      x = {}
      x[:mode], x[:hosts_len], = s.slice!(0, 25).unpack("CSx22")
      x[:hosts] = x[:hosts_len].times.map{decode_host(s)}
      x
    end
    
    # :nodoc:
    def set_access_control! (mode)
      s = 111.chr.encode('BINARY')
      s << [mode].pack("C")
      send_request(s, :set_access_control, false)
    end
    
    # :doc:
    def set_access_control (*args)
      set_access_control!(*args).abandon
    end
    
    # :nodoc:
    def set_close_down_mode! (mode)
      s = 112.chr.encode('BINARY')
      s << [mode].pack("C")
      send_request(s, :set_close_down_mode, false)
    end
    
    # :doc:
    def set_close_down_mode (*args)
      set_close_down_mode!(*args).abandon
    end
    
    # :nodoc:
    def kill_client! (resource)
      s = 113.chr.encode('BINARY')
      s << [resource].pack("x1L")
      send_request(s, :kill_client, false)
    end
    
    # :doc:
    # Forces a close down of the client that created the specified `resource`.
    def kill_client (*args)
      kill_client!(*args).abandon
    end
    
    # :nodoc:
    def rotate_properties! (window, delta, atoms)
      s = 114.chr.encode('BINARY')
      atoms_len = atoms.length
      s << [window.to_i, atoms_len, delta, *atoms].pack("x1LSsL*")
      send_request(s, :rotate_properties, false)
    end
    
    # :doc:
    def rotate_properties (*args)
      rotate_properties!(*args).abandon
    end
    
    # :nodoc:
    def force_screen_saver! (mode)
      s = 115.chr.encode('BINARY')
      s << [mode].pack("C")
      send_request(s, :force_screen_saver, false)
    end
    
    # :doc:
    def force_screen_saver (*args)
      force_screen_saver!(*args).abandon
    end
    
    # :nodoc:
    def set_pointer_mapping! (map)
      s = 116.chr.encode('BINARY')
      map_len = map.length
      s << [map_len, *map].pack("CC*")
      send_request(s, :set_pointer_mapping, true)
    end
    
    # :doc:
    def set_pointer_mapping (*args)
      set_pointer_mapping!(*args).wait
    end
    
    # :nodoc:
    def set_pointer_mapping_reply (s)
      x = {}
      x[:status], = s.slice!(0, 1).unpack("C")
      x[:status]
    end
    
    # :nodoc:
    def get_pointer_mapping! ()
      s = 117.chr.encode('BINARY')
      send_request(s, :get_pointer_mapping, true)
    end
    
    # :doc:
    def get_pointer_mapping (*args)
      get_pointer_mapping!(*args).wait
    end
    
    # :nodoc:
    def get_pointer_mapping_reply (s)
      x = {}
      x[:map_len], = s.slice!(0, 25).unpack("Cx24")
      x[:map] = s.slice!(0..x[:map_len]).unpack('C*')
      x.delete(:map_len)
      x[:map]
    end
    
    # :nodoc:
    def set_modifier_mapping! (keycodes_per_modifier, keycodes)
      s = 118.chr.encode('BINARY')
      s << [keycodes_per_modifier, *keycodes].pack("CC*")
      send_request(s, :set_modifier_mapping, true)
    end
    
    # :doc:
    def set_modifier_mapping (*args)
      set_modifier_mapping!(*args).wait
    end
    
    # :nodoc:
    def set_modifier_mapping_reply (s)
      x = {}
      x[:status], = s.slice!(0, 1).unpack("C")
      x[:status]
    end
    
    # :nodoc:
    def get_modifier_mapping! ()
      s = 119.chr.encode('BINARY')
      send_request(s, :get_modifier_mapping, true)
    end
    
    # :doc:
    def get_modifier_mapping (*args)
      get_modifier_mapping!(*args).wait
    end
    
    # :nodoc:
    def get_modifier_mapping_reply (s)
      x = {}
      x[:keycodes_per_modifier], = s.slice!(0, 25).unpack("Cx24")
      x[:keycodes] = s.slice!(0..(x[:keycodes_per_modifier] * 8)).unpack('C*')
      x
    end
    
    # :nodoc:
    def no_operation! ()
      s = 127.chr.encode('BINARY')
      send_request(s, :no_operation, false)
    end
    
    # :doc:
    def no_operation (*args)
      no_operation!(*args).abandon
    end
    
    # :nodoc:
    # :nodoc:
    def encode_key_press_event_hash (hash)
      detail = hash[:detail]
      time = hash[:time]
      root = hash[:root]
      event = hash[:event]
      child = hash[:child]
      root_x = hash[:root_x]
      root_y = hash[:root_y]
      event_x = hash[:event_x]
      event_y = hash[:event_y]
      state = hash[:state]
      same_screen = hash[:same_screen]
      s = 2.chr.encode('BINARY')
      s << [detail, time, root.to_i, event.to_i, child.to_i, root_x, root_y, event_x, event_y, state, same_screen ? 1 : 0].pack("CLLLLssssSCx1")
      s = s.ljust(30, "\0")
      s[2, 0] = "\0\0"
      s
    end
    
    # :nodoc:
    def decode_key_press_event (s)
      x = {}
      x[:detail], x[:time], x[:root], x[:event], x[:child], x[:root_x], x[:root_y], x[:event_x], x[:event_y], x[:state], x[:same_screen], = s.slice!(0, 29).unpack("CLLLLssssSCx1")
      x[:root] = find_resource(x[:root], "Window")
      x[:event] = find_resource(x[:event], "Window")
      x[:child] = find_resource(x[:child], "Window")
      x[:same_screen] = x[:same_screen] != 0
      x
    end
    
    # :nodoc:
    # :nodoc:
    def encode_key_release_event_hash (hash)
      detail = hash[:detail]
      time = hash[:time]
      root = hash[:root]
      event = hash[:event]
      child = hash[:child]
      root_x = hash[:root_x]
      root_y = hash[:root_y]
      event_x = hash[:event_x]
      event_y = hash[:event_y]
      state = hash[:state]
      same_screen = hash[:same_screen]
      s = 3.chr.encode('BINARY')
      s << [detail, time, root.to_i, event.to_i, child.to_i, root_x, root_y, event_x, event_y, state, same_screen ? 1 : 0].pack("CLLLLssssSCx1")
      s = s.ljust(30, "\0")
      s[2, 0] = "\0\0"
      s
    end
    
    # :nodoc:
    def decode_key_release_event (s)
      x = {}
      x[:detail], x[:time], x[:root], x[:event], x[:child], x[:root_x], x[:root_y], x[:event_x], x[:event_y], x[:state], x[:same_screen], = s.slice!(0, 29).unpack("CLLLLssssSCx1")
      x[:root] = find_resource(x[:root], "Window")
      x[:event] = find_resource(x[:event], "Window")
      x[:child] = find_resource(x[:child], "Window")
      x[:same_screen] = x[:same_screen] != 0
      x
    end
    
    # :nodoc:
    # :nodoc:
    def encode_button_press_event_hash (hash)
      detail = hash[:detail]
      time = hash[:time]
      root = hash[:root]
      event = hash[:event]
      child = hash[:child]
      root_x = hash[:root_x]
      root_y = hash[:root_y]
      event_x = hash[:event_x]
      event_y = hash[:event_y]
      state = hash[:state]
      same_screen = hash[:same_screen]
      s = 4.chr.encode('BINARY')
      s << [detail, time, root.to_i, event.to_i, child.to_i, root_x, root_y, event_x, event_y, state, same_screen ? 1 : 0].pack("CLLLLssssSCx1")
      s = s.ljust(30, "\0")
      s[2, 0] = "\0\0"
      s
    end
    
    # :nodoc:
    def decode_button_press_event (s)
      x = {}
      x[:detail], x[:time], x[:root], x[:event], x[:child], x[:root_x], x[:root_y], x[:event_x], x[:event_y], x[:state], x[:same_screen], = s.slice!(0, 29).unpack("CLLLLssssSCx1")
      x[:root] = find_resource(x[:root], "Window")
      x[:event] = find_resource(x[:event], "Window")
      x[:child] = find_resource(x[:child], "Window")
      x[:same_screen] = x[:same_screen] != 0
      x
    end
    
    # :nodoc:
    # :nodoc:
    def encode_button_release_event_hash (hash)
      detail = hash[:detail]
      time = hash[:time]
      root = hash[:root]
      event = hash[:event]
      child = hash[:child]
      root_x = hash[:root_x]
      root_y = hash[:root_y]
      event_x = hash[:event_x]
      event_y = hash[:event_y]
      state = hash[:state]
      same_screen = hash[:same_screen]
      s = 5.chr.encode('BINARY')
      s << [detail, time, root.to_i, event.to_i, child.to_i, root_x, root_y, event_x, event_y, state, same_screen ? 1 : 0].pack("CLLLLssssSCx1")
      s = s.ljust(30, "\0")
      s[2, 0] = "\0\0"
      s
    end
    
    # :nodoc:
    def decode_button_release_event (s)
      x = {}
      x[:detail], x[:time], x[:root], x[:event], x[:child], x[:root_x], x[:root_y], x[:event_x], x[:event_y], x[:state], x[:same_screen], = s.slice!(0, 29).unpack("CLLLLssssSCx1")
      x[:root] = find_resource(x[:root], "Window")
      x[:event] = find_resource(x[:event], "Window")
      x[:child] = find_resource(x[:child], "Window")
      x[:same_screen] = x[:same_screen] != 0
      x
    end
    
    # :nodoc:
    # :nodoc:
    def encode_motion_notify_event_hash (hash)
      detail = hash[:detail]
      time = hash[:time]
      root = hash[:root]
      event = hash[:event]
      child = hash[:child]
      root_x = hash[:root_x]
      root_y = hash[:root_y]
      event_x = hash[:event_x]
      event_y = hash[:event_y]
      state = hash[:state]
      same_screen = hash[:same_screen]
      s = 6.chr.encode('BINARY')
      s << [detail, time, root.to_i, event.to_i, child.to_i, root_x, root_y, event_x, event_y, state, same_screen ? 1 : 0].pack("CLLLLssssSCx1")
      s = s.ljust(30, "\0")
      s[2, 0] = "\0\0"
      s
    end
    
    # :nodoc:
    def decode_motion_notify_event (s)
      x = {}
      x[:detail], x[:time], x[:root], x[:event], x[:child], x[:root_x], x[:root_y], x[:event_x], x[:event_y], x[:state], x[:same_screen], = s.slice!(0, 29).unpack("CLLLLssssSCx1")
      x[:root] = find_resource(x[:root], "Window")
      x[:event] = find_resource(x[:event], "Window")
      x[:child] = find_resource(x[:child], "Window")
      x[:same_screen] = x[:same_screen] != 0
      x
    end
    
    # :nodoc:
    # :nodoc:
    def encode_enter_notify_event_hash (hash)
      detail = hash[:detail]
      time = hash[:time]
      root = hash[:root]
      event = hash[:event]
      child = hash[:child]
      root_x = hash[:root_x]
      root_y = hash[:root_y]
      event_x = hash[:event_x]
      event_y = hash[:event_y]
      state = hash[:state]
      mode = hash[:mode]
      same_screen_focus = hash[:same_screen_focus]
      s = 7.chr.encode('BINARY')
      s << [detail, time, root.to_i, event.to_i, child.to_i, root_x, root_y, event_x, event_y, state, mode, same_screen_focus].pack("CLLLLssssSCC")
      s = s.ljust(30, "\0")
      s[2, 0] = "\0\0"
      s
    end
    
    # :nodoc:
    def decode_enter_notify_event (s)
      x = {}
      x[:detail], x[:time], x[:root], x[:event], x[:child], x[:root_x], x[:root_y], x[:event_x], x[:event_y], x[:state], x[:mode], x[:same_screen_focus], = s.slice!(0, 29).unpack("CLLLLssssSCC")
      x[:root] = find_resource(x[:root], "Window")
      x[:event] = find_resource(x[:event], "Window")
      x[:child] = find_resource(x[:child], "Window")
      x
    end
    
    # :nodoc:
    # :nodoc:
    def encode_leave_notify_event_hash (hash)
      detail = hash[:detail]
      time = hash[:time]
      root = hash[:root]
      event = hash[:event]
      child = hash[:child]
      root_x = hash[:root_x]
      root_y = hash[:root_y]
      event_x = hash[:event_x]
      event_y = hash[:event_y]
      state = hash[:state]
      mode = hash[:mode]
      same_screen_focus = hash[:same_screen_focus]
      s = 8.chr.encode('BINARY')
      s << [detail, time, root.to_i, event.to_i, child.to_i, root_x, root_y, event_x, event_y, state, mode, same_screen_focus].pack("CLLLLssssSCC")
      s = s.ljust(30, "\0")
      s[2, 0] = "\0\0"
      s
    end
    
    # :nodoc:
    def decode_leave_notify_event (s)
      x = {}
      x[:detail], x[:time], x[:root], x[:event], x[:child], x[:root_x], x[:root_y], x[:event_x], x[:event_y], x[:state], x[:mode], x[:same_screen_focus], = s.slice!(0, 29).unpack("CLLLLssssSCC")
      x[:root] = find_resource(x[:root], "Window")
      x[:event] = find_resource(x[:event], "Window")
      x[:child] = find_resource(x[:child], "Window")
      x
    end
    
    # :nodoc:
    # :nodoc:
    def encode_focus_in_event_hash (hash)
      detail = hash[:detail]
      event = hash[:event]
      mode = hash[:mode]
      s = 9.chr.encode('BINARY')
      s << [detail, event.to_i, mode].pack("CLCx3")
      s = s.ljust(30, "\0")
      s[2, 0] = "\0\0"
      s
    end
    
    # :nodoc:
    def decode_focus_in_event (s)
      x = {}
      x[:detail], x[:event], x[:mode], = s.slice!(0, 9).unpack("CLCx3")
      x[:event] = find_resource(x[:event], "Window")
      x
    end
    
    # :nodoc:
    # :nodoc:
    def encode_focus_out_event_hash (hash)
      detail = hash[:detail]
      event = hash[:event]
      mode = hash[:mode]
      s = 10.chr.encode('BINARY')
      s << [detail, event.to_i, mode].pack("CLCx3")
      s = s.ljust(30, "\0")
      s[2, 0] = "\0\0"
      s
    end
    
    # :nodoc:
    def decode_focus_out_event (s)
      x = {}
      x[:detail], x[:event], x[:mode], = s.slice!(0, 9).unpack("CLCx3")
      x[:event] = find_resource(x[:event], "Window")
      x
    end
    
    # :nodoc:
    # :nodoc:
    def encode_keymap_notify_event_hash (hash)
      keys = hash[:keys]
      s = 11.chr.encode('BINARY')
      s << [*keys].pack("C*")
      s = s.ljust(30, "\0")
      s[2, 0] = "\0\0"
      s
    end
    
    # :nodoc:
    def decode_keymap_notify_event (s)
      x = {}
      x[:keys] = s.slice!(0..31).unpack('C*')
      x
    end
    
    # :nodoc:
    # :nodoc:
    def encode_expose_event_hash (hash)
      window = hash[:window]
      x = hash[:x]
      y = hash[:y]
      width = hash[:width]
      height = hash[:height]
      count = hash[:count]
      s = 12.chr.encode('BINARY')
      s << [window.to_i, x, y, width, height, count].pack("x1LSSSSSx2")
      s = s.ljust(30, "\0")
      s[2, 0] = "\0\0"
      s
    end
    
    # :nodoc:
    def decode_expose_event (s)
      x = {}
      x[:window], x[:x], x[:y], x[:width], x[:height], x[:count], = s.slice!(0, 17).unpack("x1LSSSSSx2")
      x[:window] = find_resource(x[:window], "Window")
      x
    end
    
    # :nodoc:
    # :nodoc:
    def encode_graphics_exposure_event_hash (hash)
      drawable = hash[:drawable]
      x = hash[:x]
      y = hash[:y]
      width = hash[:width]
      height = hash[:height]
      minor_opcode = hash[:minor_opcode]
      count = hash[:count]
      major_opcode = hash[:major_opcode]
      s = 13.chr.encode('BINARY')
      s << [drawable.to_i, x, y, width, height, minor_opcode, count, major_opcode].pack("x1LSSSSSSCx3")
      s = s.ljust(30, "\0")
      s[2, 0] = "\0\0"
      s
    end
    
    # :nodoc:
    def decode_graphics_exposure_event (s)
      x = {}
      x[:drawable], x[:x], x[:y], x[:width], x[:height], x[:minor_opcode], x[:count], x[:major_opcode], = s.slice!(0, 21).unpack("x1LSSSSSSCx3")
      x[:drawable] = find_resource(x[:drawable], "Drawable")
      x
    end
    
    # :nodoc:
    # :nodoc:
    def encode_no_exposure_event_hash (hash)
      drawable = hash[:drawable]
      minor_opcode = hash[:minor_opcode]
      major_opcode = hash[:major_opcode]
      s = 14.chr.encode('BINARY')
      s << [drawable.to_i, minor_opcode, major_opcode].pack("x1LSCx1")
      s = s.ljust(30, "\0")
      s[2, 0] = "\0\0"
      s
    end
    
    # :nodoc:
    def decode_no_exposure_event (s)
      x = {}
      x[:drawable], x[:minor_opcode], x[:major_opcode], = s.slice!(0, 9).unpack("x1LSCx1")
      x[:drawable] = find_resource(x[:drawable], "Drawable")
      x
    end
    
    # :nodoc:
    # :nodoc:
    def encode_visibility_notify_event_hash (hash)
      window = hash[:window]
      state = hash[:state]
      s = 15.chr.encode('BINARY')
      s << [window.to_i, state].pack("x1LCx3")
      s = s.ljust(30, "\0")
      s[2, 0] = "\0\0"
      s
    end
    
    # :nodoc:
    def decode_visibility_notify_event (s)
      x = {}
      x[:window], x[:state], = s.slice!(0, 9).unpack("x1LCx3")
      x[:window] = find_resource(x[:window], "Window")
      x
    end
    
    # :nodoc:
    # :nodoc:
    def encode_create_notify_event_hash (hash)
      parent = hash[:parent]
      window = hash[:window]
      x = hash[:x]
      y = hash[:y]
      width = hash[:width]
      height = hash[:height]
      border_width = hash[:border_width]
      override_redirect = hash[:override_redirect]
      s = 16.chr.encode('BINARY')
      s << [parent.to_i, window.to_i, x, y, width, height, border_width, override_redirect ? 1 : 0].pack("x1LLssSSSCx1")
      s = s.ljust(30, "\0")
      s[2, 0] = "\0\0"
      s
    end
    
    # :nodoc:
    def decode_create_notify_event (s)
      x = {}
      x[:parent], x[:window], x[:x], x[:y], x[:width], x[:height], x[:border_width], x[:override_redirect], = s.slice!(0, 21).unpack("x1LLssSSSCx1")
      x[:parent] = find_resource(x[:parent], "Window")
      x[:window] = find_resource(x[:window], "Window")
      x[:override_redirect] = x[:override_redirect] != 0
      x
    end
    
    # :nodoc:
    # :nodoc:
    def encode_destroy_notify_event_hash (hash)
      event = hash[:event]
      window = hash[:window]
      s = 17.chr.encode('BINARY')
      s << [event.to_i, window.to_i].pack("x1LL")
      s = s.ljust(30, "\0")
      s[2, 0] = "\0\0"
      s
    end
    
    # :nodoc:
    def decode_destroy_notify_event (s)
      x = {}
      x[:event], x[:window], = s.slice!(0, 9).unpack("x1LL")
      x[:event] = find_resource(x[:event], "Window")
      x[:window] = find_resource(x[:window], "Window")
      x
    end
    
    # :nodoc:
    # :nodoc:
    def encode_unmap_notify_event_hash (hash)
      event = hash[:event]
      window = hash[:window]
      from_configure = hash[:from_configure]
      s = 18.chr.encode('BINARY')
      s << [event.to_i, window.to_i, from_configure ? 1 : 0].pack("x1LLCx3")
      s = s.ljust(30, "\0")
      s[2, 0] = "\0\0"
      s
    end
    
    # :nodoc:
    def decode_unmap_notify_event (s)
      x = {}
      x[:event], x[:window], x[:from_configure], = s.slice!(0, 13).unpack("x1LLCx3")
      x[:event] = find_resource(x[:event], "Window")
      x[:window] = find_resource(x[:window], "Window")
      x[:from_configure] = x[:from_configure] != 0
      x
    end
    
    # :nodoc:
    # :nodoc:
    def encode_map_notify_event_hash (hash)
      event = hash[:event]
      window = hash[:window]
      override_redirect = hash[:override_redirect]
      s = 19.chr.encode('BINARY')
      s << [event.to_i, window.to_i, override_redirect ? 1 : 0].pack("x1LLCx3")
      s = s.ljust(30, "\0")
      s[2, 0] = "\0\0"
      s
    end
    
    # :nodoc:
    def decode_map_notify_event (s)
      x = {}
      x[:event], x[:window], x[:override_redirect], = s.slice!(0, 13).unpack("x1LLCx3")
      x[:event] = find_resource(x[:event], "Window")
      x[:window] = find_resource(x[:window], "Window")
      x[:override_redirect] = x[:override_redirect] != 0
      x
    end
    
    # :nodoc:
    # :nodoc:
    def encode_map_request_event_hash (hash)
      parent = hash[:parent]
      window = hash[:window]
      s = 20.chr.encode('BINARY')
      s << [parent.to_i, window.to_i].pack("x1LL")
      s = s.ljust(30, "\0")
      s[2, 0] = "\0\0"
      s
    end
    
    # :nodoc:
    def decode_map_request_event (s)
      x = {}
      x[:parent], x[:window], = s.slice!(0, 9).unpack("x1LL")
      x[:parent] = find_resource(x[:parent], "Window")
      x[:window] = find_resource(x[:window], "Window")
      x
    end
    
    # :nodoc:
    # :nodoc:
    def encode_reparent_notify_event_hash (hash)
      event = hash[:event]
      window = hash[:window]
      parent = hash[:parent]
      x = hash[:x]
      y = hash[:y]
      override_redirect = hash[:override_redirect]
      s = 21.chr.encode('BINARY')
      s << [event.to_i, window.to_i, parent.to_i, x, y, override_redirect ? 1 : 0].pack("x1LLLssCx3")
      s = s.ljust(30, "\0")
      s[2, 0] = "\0\0"
      s
    end
    
    # :nodoc:
    def decode_reparent_notify_event (s)
      x = {}
      x[:event], x[:window], x[:parent], x[:x], x[:y], x[:override_redirect], = s.slice!(0, 21).unpack("x1LLLssCx3")
      x[:event] = find_resource(x[:event], "Window")
      x[:window] = find_resource(x[:window], "Window")
      x[:parent] = find_resource(x[:parent], "Window")
      x[:override_redirect] = x[:override_redirect] != 0
      x
    end
    
    # :nodoc:
    # :nodoc:
    def encode_configure_notify_event_hash (hash)
      event = hash[:event]
      window = hash[:window]
      above_sibling = hash[:above_sibling]
      x = hash[:x]
      y = hash[:y]
      width = hash[:width]
      height = hash[:height]
      border_width = hash[:border_width]
      override_redirect = hash[:override_redirect]
      s = 22.chr.encode('BINARY')
      s << [event.to_i, window.to_i, above_sibling.to_i, x, y, width, height, border_width, override_redirect ? 1 : 0].pack("x1LLLssSSSCx1")
      s = s.ljust(30, "\0")
      s[2, 0] = "\0\0"
      s
    end
    
    # :nodoc:
    def decode_configure_notify_event (s)
      x = {}
      x[:event], x[:window], x[:above_sibling], x[:x], x[:y], x[:width], x[:height], x[:border_width], x[:override_redirect], = s.slice!(0, 25).unpack("x1LLLssSSSCx1")
      x[:event] = find_resource(x[:event], "Window")
      x[:window] = find_resource(x[:window], "Window")
      x[:above_sibling] = find_resource(x[:above_sibling], "Window")
      x[:override_redirect] = x[:override_redirect] != 0
      x
    end
    
    # :nodoc:
    # :nodoc:
    def encode_configure_request_event_hash (hash)
      stack_mode = hash[:stack_mode]
      parent = hash[:parent]
      window = hash[:window]
      sibling = hash[:sibling]
      x = hash[:x]
      y = hash[:y]
      width = hash[:width]
      height = hash[:height]
      border_width = hash[:border_width]
      value_mask = hash[:value_mask]
      s = 23.chr.encode('BINARY')
      s << [stack_mode, parent.to_i, window.to_i, sibling.to_i, x, y, width, height, border_width, value_mask].pack("CLLLssSSSS")
      s = s.ljust(30, "\0")
      s[2, 0] = "\0\0"
      s
    end
    
    # :nodoc:
    def decode_configure_request_event (s)
      x = {}
      x[:stack_mode], x[:parent], x[:window], x[:sibling], x[:x], x[:y], x[:width], x[:height], x[:border_width], x[:value_mask], = s.slice!(0, 25).unpack("CLLLssSSSS")
      x[:parent] = find_resource(x[:parent], "Window")
      x[:window] = find_resource(x[:window], "Window")
      x[:sibling] = find_resource(x[:sibling], "Window")
      x
    end
    
    # :nodoc:
    # :nodoc:
    def encode_gravity_notify_event_hash (hash)
      event = hash[:event]
      window = hash[:window]
      x = hash[:x]
      y = hash[:y]
      s = 24.chr.encode('BINARY')
      s << [event.to_i, window.to_i, x, y].pack("x1LLss")
      s = s.ljust(30, "\0")
      s[2, 0] = "\0\0"
      s
    end
    
    # :nodoc:
    def decode_gravity_notify_event (s)
      x = {}
      x[:event], x[:window], x[:x], x[:y], = s.slice!(0, 13).unpack("x1LLss")
      x[:event] = find_resource(x[:event], "Window")
      x[:window] = find_resource(x[:window], "Window")
      x
    end
    
    # :nodoc:
    # :nodoc:
    def encode_resize_request_event_hash (hash)
      window = hash[:window]
      width = hash[:width]
      height = hash[:height]
      s = 25.chr.encode('BINARY')
      s << [window.to_i, width, height].pack("x1LSS")
      s = s.ljust(30, "\0")
      s[2, 0] = "\0\0"
      s
    end
    
    # :nodoc:
    def decode_resize_request_event (s)
      x = {}
      x[:window], x[:width], x[:height], = s.slice!(0, 9).unpack("x1LSS")
      x[:window] = find_resource(x[:window], "Window")
      x
    end
    
    # :nodoc:
    # :nodoc:
    def encode_circulate_notify_event_hash (hash)
      event = hash[:event]
      window = hash[:window]
      place = hash[:place]
      s = 26.chr.encode('BINARY')
      s << [event.to_i, window.to_i, place].pack("x1LLx4Cx3")
      s = s.ljust(30, "\0")
      s[2, 0] = "\0\0"
      s
    end
    
    # :nodoc:
    def decode_circulate_notify_event (s)
      x = {}
      x[:event], x[:window], x[:place], = s.slice!(0, 17).unpack("x1LLx4Cx3")
      x[:event] = find_resource(x[:event], "Window")
      x[:window] = find_resource(x[:window], "Window")
      x
    end
    
    # :nodoc:
    # :nodoc:
    def encode_circulate_request_event_hash (hash)
      event = hash[:event]
      window = hash[:window]
      place = hash[:place]
      s = 27.chr.encode('BINARY')
      s << [event.to_i, window.to_i, place].pack("x1LLx4Cx3")
      s = s.ljust(30, "\0")
      s[2, 0] = "\0\0"
      s
    end
    
    # :nodoc:
    def decode_circulate_request_event (s)
      x = {}
      x[:event], x[:window], x[:place], = s.slice!(0, 17).unpack("x1LLx4Cx3")
      x[:event] = find_resource(x[:event], "Window")
      x[:window] = find_resource(x[:window], "Window")
      x
    end
    
    # :nodoc:
    # :nodoc:
    def encode_property_notify_event_hash (hash)
      window = hash[:window]
      atom = hash[:atom]
      time = hash[:time]
      state = hash[:state]
      s = 28.chr.encode('BINARY')
      s << [window.to_i, atom(atom), time, state].pack("x1LLLCx3")
      s = s.ljust(30, "\0")
      s[2, 0] = "\0\0"
      s
    end
    
    # :nodoc:
    def decode_property_notify_event (s)
      x = {}
      x[:window], x[:atom], x[:time], x[:state], = s.slice!(0, 17).unpack("x1LLLCx3")
      x[:window] = find_resource(x[:window], "Window")
      x[:atom] = find_atom(x[:atom])
      x
    end
    
    # :nodoc:
    # :nodoc:
    def encode_selection_clear_event_hash (hash)
      time = hash[:time]
      owner = hash[:owner]
      selection = hash[:selection]
      s = 29.chr.encode('BINARY')
      s << [time, owner.to_i, atom(selection)].pack("x1LLL")
      s = s.ljust(30, "\0")
      s[2, 0] = "\0\0"
      s
    end
    
    # :nodoc:
    def decode_selection_clear_event (s)
      x = {}
      x[:time], x[:owner], x[:selection], = s.slice!(0, 13).unpack("x1LLL")
      x[:owner] = find_resource(x[:owner], "Window")
      x[:selection] = find_atom(x[:selection])
      x
    end
    
    # :nodoc:
    # :nodoc:
    def encode_selection_request_event_hash (hash)
      time = hash[:time]
      owner = hash[:owner]
      requestor = hash[:requestor]
      selection = hash[:selection]
      target = hash[:target]
      property = hash[:property]
      s = 30.chr.encode('BINARY')
      s << [time, owner.to_i, requestor.to_i, atom(selection), atom(target), atom(property)].pack("x1LLLLLL")
      s = s.ljust(30, "\0")
      s[2, 0] = "\0\0"
      s
    end
    
    # :nodoc:
    def decode_selection_request_event (s)
      x = {}
      x[:time], x[:owner], x[:requestor], x[:selection], x[:target], x[:property], = s.slice!(0, 25).unpack("x1LLLLLL")
      x[:owner] = find_resource(x[:owner], "Window")
      x[:requestor] = find_resource(x[:requestor], "Window")
      x[:selection] = find_atom(x[:selection])
      x[:target] = find_atom(x[:target])
      x[:property] = find_atom(x[:property])
      x
    end
    
    # :nodoc:
    # :nodoc:
    def encode_selection_notify_event_hash (hash)
      time = hash[:time]
      requestor = hash[:requestor]
      selection = hash[:selection]
      target = hash[:target]
      property = hash[:property]
      s = 31.chr.encode('BINARY')
      s << [time, requestor.to_i, atom(selection), atom(target), atom(property)].pack("x1LLLLL")
      s = s.ljust(30, "\0")
      s[2, 0] = "\0\0"
      s
    end
    
    # :nodoc:
    def decode_selection_notify_event (s)
      x = {}
      x[:time], x[:requestor], x[:selection], x[:target], x[:property], = s.slice!(0, 21).unpack("x1LLLLL")
      x[:requestor] = find_resource(x[:requestor], "Window")
      x[:selection] = find_atom(x[:selection])
      x[:target] = find_atom(x[:target])
      x[:property] = find_atom(x[:property])
      x
    end
    
    # :nodoc:
    # :nodoc:
    def encode_colormap_notify_event_hash (hash)
      window = hash[:window]
      colormap = hash[:colormap]
      new = hash[:new]
      state = hash[:state]
      s = 32.chr.encode('BINARY')
      s << [window.to_i, colormap.to_i, new ? 1 : 0, state].pack("x1LLCCx2")
      s = s.ljust(30, "\0")
      s[2, 0] = "\0\0"
      s
    end
    
    # :nodoc:
    def decode_colormap_notify_event (s)
      x = {}
      x[:window], x[:colormap], x[:new], x[:state], = s.slice!(0, 13).unpack("x1LLCCx2")
      x[:window] = find_resource(x[:window], "Window")
      x[:colormap] = find_resource(x[:colormap], "Colormap")
      x[:new] = x[:new] != 0
      x
    end
    
    # :nodoc:
    # :nodoc:
    def encode_client_message_event_hash (hash)
      format = hash[:format]
      window = hash[:window]
      type = hash[:type]
      data = hash[:data]
      s = 33.chr.encode('BINARY')
      s << [format, window.to_i, atom(type)].pack("CLL")
      s << encode_client_message_data(''.encode('BINARY'), *data)
      s = s.ljust(30, "\0")
      s[2, 0] = "\0\0"
      s
    end
    
    # :nodoc:
    def decode_client_message_event (s)
      x = {}
      x[:format], x[:window], x[:type], = s.slice!(0, 9).unpack("CLL")
      x[:window] = find_resource(x[:window], "Window")
      x[:type] = find_atom(x[:type])
      x[:data] = decode_client_message_data(s)
      x
    end
    
    # :nodoc:
    # :nodoc:
    def encode_mapping_notify_event_hash (hash)
      request = hash[:request]
      first_keycode = hash[:first_keycode]
      count = hash[:count]
      s = 34.chr.encode('BINARY')
      s << [request, first_keycode, count].pack("x1CCCx1")
      s = s.ljust(30, "\0")
      s[2, 0] = "\0\0"
      s
    end
    
    # :nodoc:
    def decode_mapping_notify_event (s)
      x = {}
      x[:request], x[:first_keycode], x[:count], = s.slice!(0, 5).unpack("x1CCCx1")
      x
    end
    
    # :nodoc:
    # :nodoc:
    def encode_ge_generic_event_hash (hash)
      s = 35.chr.encode('BINARY')
      s = s.ljust(30, "\0")
      s[2, 0] = "\0\0"
      s
    end
    
    # :nodoc:
    def decode_ge_generic_event (s)
      x = {}
      s.slice!(0, 22)
      x
    end
    
    # :nodoc:
    def encode_char2b (s, byte1, byte2)
      s << [byte1, byte2].pack("CC")
      s
    end
    
    # :nodoc:
    def decode_char2b (s)
      x = {}
      x[:byte1], x[:byte2], = s.slice!(0, 2).unpack("CC")
      x
    end
    
    # :nodoc:
    def encode_point (s, x, y)
      s << [x, y].pack("ss")
      s
    end
    
    # :nodoc:
    def decode_point (s)
      x = {}
      x[:x], x[:y], = s.slice!(0, 4).unpack("ss")
      x
    end
    
    # :nodoc:
    def encode_rectangle (s, x, y, width, height)
      s << [x, y, width, height].pack("ssSS")
      s
    end
    
    # :nodoc:
    def decode_rectangle (s)
      x = {}
      x[:x], x[:y], x[:width], x[:height], = s.slice!(0, 8).unpack("ssSS")
      x
    end
    
    # :nodoc:
    def encode_arc (s, x, y, width, height, angle1, angle2)
      s << [x, y, width, height, angle1, angle2].pack("ssSSss")
      s
    end
    
    # :nodoc:
    def decode_arc (s)
      x = {}
      x[:x], x[:y], x[:width], x[:height], x[:angle1], x[:angle2], = s.slice!(0, 12).unpack("ssSSss")
      x
    end
    
    # :nodoc:
    def encode_format (s, depth, bits_per_pixel, scanline_pad)
      s << [depth, bits_per_pixel, scanline_pad].pack("CCCx5")
      s
    end
    
    # :nodoc:
    def decode_format (s)
      x = {}
      x[:depth], x[:bits_per_pixel], x[:scanline_pad], = s.slice!(0, 8).unpack("CCCx5")
      x
    end
    
    # :nodoc:
    def encode_visualtype (s, visual_id, klass, bits_per_rgb_value, colormap_entries, red_mask, green_mask, blue_mask)
      s << [visual_id, klass, bits_per_rgb_value, colormap_entries, red_mask, green_mask, blue_mask].pack("LCCSLLLx4")
      s
    end
    
    # :nodoc:
    def decode_visualtype (s)
      x = {}
      x[:visual_id], x[:klass], x[:bits_per_rgb_value], x[:colormap_entries], x[:red_mask], x[:green_mask], x[:blue_mask], = s.slice!(0, 24).unpack("LCCSLLLx4")
      x
    end
    
    # :nodoc:
    def encode_depth (s, depth, visuals)
      visuals_len = visuals.length
      s << [depth, visuals_len].pack("Cx1Sx4")
      s << visuals.map{|x|encode_visualtype(''.encode('BINARY'), *x)}.join
      s
    end
    
    # :nodoc:
    def decode_depth (s)
      x = {}
      x[:depth], x[:visuals_len], = s.slice!(0, 8).unpack("Cx1Sx4")
      x[:visuals] = x[:visuals_len].times.map{decode_visualtype(s)}
      x
    end
    
    # :nodoc:
    def encode_screen (s, root, default_colormap, white_pixel, black_pixel, current_input_masks, width_in_pixels, height_in_pixels, width_in_millimeters, height_in_millimeters, min_installed_maps, max_installed_maps, root_visual, backing_stores, save_unders, root_depth, allowed_depths)
      allowed_depths_len = allowed_depths.length
      s << [root.to_i, default_colormap.to_i, white_pixel, black_pixel, current_input_masks, width_in_pixels, height_in_pixels, width_in_millimeters, height_in_millimeters, min_installed_maps, max_installed_maps, root_visual, backing_stores, save_unders ? 1 : 0, root_depth, allowed_depths_len].pack("LLLLLSSSSSSLCCCC")
      s << allowed_depths.map{|x|encode_depth(''.encode('BINARY'), *x)}.join
      s
    end
    
    # :nodoc:
    def decode_screen (s)
      x = {}
      x[:root], x[:default_colormap], x[:white_pixel], x[:black_pixel], x[:current_input_masks], x[:width_in_pixels], x[:height_in_pixels], x[:width_in_millimeters], x[:height_in_millimeters], x[:min_installed_maps], x[:max_installed_maps], x[:root_visual], x[:backing_stores], x[:save_unders], x[:root_depth], x[:allowed_depths_len], = s.slice!(0, 40).unpack("LLLLLSSSSSSLCCCC")
      x[:root] = find_resource(x[:root], "Window")
      x[:default_colormap] = find_resource(x[:default_colormap], "Colormap")
      x[:save_unders] = x[:save_unders] != 0
      x[:allowed_depths] = x[:allowed_depths_len].times.map{decode_depth(s)}
      x
    end
    
    # :nodoc:
    def encode_setup_request (s, byte_order, protocol_major_version, protocol_minor_version, authorization_protocol_name, authorization_protocol_data)
      authorization_protocol_name = authorization_protocol_name.force_encoding('BINARY')
      authorization_protocol_name_len = authorization_protocol_name.bytesize
      authorization_protocol_data = authorization_protocol_data.force_encoding('BINARY')
      authorization_protocol_data_len = authorization_protocol_data.bytesize
      s << [byte_order, protocol_major_version, protocol_minor_version, authorization_protocol_name_len, authorization_protocol_data_len, pad(authorization_protocol_name), pad(authorization_protocol_data)].pack("Cx1SSSSx2A*A*")
      s
    end
    
    # :nodoc:
    def decode_setup_request (s)
      x = {}
      x[:byte_order], x[:protocol_major_version], x[:protocol_minor_version], x[:authorization_protocol_name_len], x[:authorization_protocol_data_len], = s.slice!(0, 12).unpack("Cx1SSSSx2")
      x[:authorization_protocol_name] = s.slice!(0, x[:authorization_protocol_name_len])
      x[:authorization_protocol_data] = s.slice!(0, x[:authorization_protocol_data_len])
      x
    end
    
    # :nodoc:
    def encode_setup_failed (s, status, protocol_major_version, protocol_minor_version, length, reason)
      reason = reason.force_encoding('BINARY')
      reason_len = reason.bytesize
      s << [status, reason_len, protocol_major_version, protocol_minor_version, length, pad(reason)].pack("CCSSSA*")
      s
    end
    
    # :nodoc:
    def decode_setup_failed (s)
      x = {}
      x[:status], x[:reason_len], x[:protocol_major_version], x[:protocol_minor_version], x[:length], = s.slice!(0, 8).unpack("CCSSS")
      x[:reason] = s.slice!(0, x[:reason_len])
      x
    end
    
    # :nodoc:
    def encode_setup_authenticate (s, status, length, reason)
      s << [status, length, pad(reason)].pack("Cx5SA*")
      s
    end
    
    # :nodoc:
    def decode_setup_authenticate (s)
      x = {}
      x[:status], x[:length], = s.slice!(0, 8).unpack("Cx5S")
      x[:reason] = s.slice!(0, (x[:length] * 4))
      x
    end
    
    # :nodoc:
    def encode_setup (s, status, protocol_major_version, protocol_minor_version, length, release_number, resource_id_base, resource_id_mask, motion_buffer_size, maximum_request_length, image_byte_order, bitmap_format_bit_order, bitmap_format_scanline_unit, bitmap_format_scanline_pad, min_keycode, max_keycode, vendor, pixmap_formats, roots)
      vendor = vendor.force_encoding('BINARY')
      vendor_len = vendor.bytesize
      pixmap_formats_len = pixmap_formats.length
      roots_len = roots.length
      s << [status, protocol_major_version, protocol_minor_version, length, release_number, resource_id_base, resource_id_mask, motion_buffer_size, vendor_len, maximum_request_length, roots_len, pixmap_formats_len, image_byte_order, bitmap_format_bit_order, bitmap_format_scanline_unit, bitmap_format_scanline_pad, min_keycode, max_keycode, pad(vendor)].pack("Cx1SSSLLLLSSCCCCCCCCx4A*")
      s << pixmap_formats.map{|x|encode_format(''.encode('BINARY'), *x)}.join
      s << roots.map{|x|encode_screen(''.encode('BINARY'), *x)}.join
      s
    end
    
    # :nodoc:
    def decode_setup (s)
      x = {}
      x[:status], x[:protocol_major_version], x[:protocol_minor_version], x[:length], x[:release_number], x[:resource_id_base], x[:resource_id_mask], x[:motion_buffer_size], x[:vendor_len], x[:maximum_request_length], x[:roots_len], x[:pixmap_formats_len], x[:image_byte_order], x[:bitmap_format_bit_order], x[:bitmap_format_scanline_unit], x[:bitmap_format_scanline_pad], x[:min_keycode], x[:max_keycode], = s.slice!(0, 40).unpack("Cx1SSSLLLLSSCCCCCCCCx4")
      x[:vendor] = s.slice!(0, x[:vendor_len])
      x[:pixmap_formats] = x[:pixmap_formats_len].times.map{decode_format(s)}
      x[:roots] = x[:roots_len].times.map{decode_screen(s)}
      x
    end
    
    # :nodoc:
    def encode_timecoord (s, time, x, y)
      s << [time, x, y].pack("Lss")
      s
    end
    
    # :nodoc:
    def decode_timecoord (s)
      x = {}
      x[:time], x[:x], x[:y], = s.slice!(0, 8).unpack("Lss")
      x
    end
    
    # :nodoc:
    def encode_fontprop (s, name, value)
      s << [atom(name), value].pack("LL")
      s
    end
    
    # :nodoc:
    def decode_fontprop (s)
      x = {}
      x[:name], x[:value], = s.slice!(0, 8).unpack("LL")
      x[:name] = find_atom(x[:name])
      x
    end
    
    # :nodoc:
    def encode_charinfo (s, left_side_bearing, right_side_bearing, character_width, ascent, descent, attributes)
      s << [left_side_bearing, right_side_bearing, character_width, ascent, descent, attributes].pack("sssssS")
      s
    end
    
    # :nodoc:
    def decode_charinfo (s)
      x = {}
      x[:left_side_bearing], x[:right_side_bearing], x[:character_width], x[:ascent], x[:descent], x[:attributes], = s.slice!(0, 12).unpack("sssssS")
      x
    end
    
    # :nodoc:
    def encode_str (s, name)
      name = name.force_encoding('BINARY')
      name_len = name.bytesize
      s << [name_len, pad(name)].pack("CA*")
      s
    end
    
    # :nodoc:
    def decode_str (s)
      x = {}
      x[:name_len], = s.slice!(0, 1).unpack("C")
      x[:name] = s.slice!(0, x[:name_len])
      x
    end
    
    # :nodoc:
    def encode_segment (s, x1, y1, x2, y2)
      s << [x1, y1, x2, y2].pack("ssss")
      s
    end
    
    # :nodoc:
    def decode_segment (s)
      x = {}
      x[:x1], x[:y1], x[:x2], x[:y2], = s.slice!(0, 8).unpack("ssss")
      x
    end
    
    # :nodoc:
    def encode_coloritem (s, pixel, red, green, blue, flags)
      s << [pixel, red, green, blue, flags].pack("LSSSCx1")
      s
    end
    
    # :nodoc:
    def decode_coloritem (s)
      x = {}
      x[:pixel], x[:red], x[:green], x[:blue], x[:flags], = s.slice!(0, 12).unpack("LSSSCx1")
      x
    end
    
    # :nodoc:
    def encode_rgb (s, red, green, blue)
      s << [red, green, blue].pack("SSSx2")
      s
    end
    
    # :nodoc:
    def decode_rgb (s)
      x = {}
      x[:red], x[:green], x[:blue], = s.slice!(0, 8).unpack("SSSx2")
      x
    end
    
    # :nodoc:
    def encode_host (s, family, address)
      address = address.force_encoding('BINARY')
      address_len = address.bytesize
      s << [family, address_len, pad(address)].pack("Cx1SA*")
      s
    end
    
    # :nodoc:
    def decode_host (s)
      x = {}
      x[:family], x[:address_len], = s.slice!(0, 4).unpack("Cx1S")
      x[:address] = s.slice!(0, x[:address_len])
      x
    end
  
  end
end
