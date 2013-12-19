module Alembic::X11
  module Core
    extend Alembic::X11::Module
    
    CHAR2B = Struct.new(:byte1, :byte2)
    
    def encode_char2b (s, byte1, byte2)
      s << [byte1, byte2].pack("CC")
      s
    end
    
    def decode_char2b (s)
      x = CHAR2B.new
      x.byte1, x.byte2 = s.slice!(0, 2).unpack("CC")
      x
    end
    
    Drawable = Class.new(Resource)
    Fontable = Class.new(Resource)
    Window = Class.new(Drawable)
    Pixmap = Class.new(Drawable)
    Cursor = Class.new(Resource)
    Font = Class.new(Fontable)
    Gcontext = Class.new(Fontable)
    Colormap = Class.new(Resource)
    Atom = Class.new(Resource)
    POINT = Struct.new(:x, :y)
    
    def encode_point (s, x, y)
      s << [x, y].pack("ss")
      s
    end
    
    def decode_point (s)
      x = POINT.new
      x.x, x.y = s.slice!(0, 4).unpack("ss")
      x
    end
    
    RECTANGLE = Struct.new(:x, :y, :width, :height)
    
    def encode_rectangle (s, x, y, width, height)
      s << [x, y, width, height].pack("ssSS")
      s
    end
    
    def decode_rectangle (s)
      x = RECTANGLE.new
      x.x, x.y, x.width, x.height = s.slice!(0, 8).unpack("ssSS")
      x
    end
    
    ARC = Struct.new(:x, :y, :width, :height, :angle1, :angle2)
    
    def encode_arc (s, x, y, width, height, angle1, angle2)
      s << [x, y, width, height, angle1, angle2].pack("ssSSss")
      s
    end
    
    def decode_arc (s)
      x = ARC.new
      x.x, x.y, x.width, x.height, x.angle1, x.angle2 = s.slice!(0, 12).unpack("ssSSss")
      x
    end
    
    FORMAT = Struct.new(:depth, :bits_per_pixel, :scanline_pad)
    
    def encode_format (s, depth, bits_per_pixel, scanline_pad)
      s << [depth, bits_per_pixel, scanline_pad].pack("CCCx5")
      s
    end
    
    def decode_format (s)
      x = FORMAT.new
      x.depth, x.bits_per_pixel, x.scanline_pad = s.slice!(0, 8).unpack("CCCx5")
      x
    end
    
    Alembic::Enumerants::VISUAL_CLASS_STATIC_GRAY = 0
    Alembic::Enumerants::VISUAL_CLASS_GRAY_SCALE = 1
    Alembic::Enumerants::VISUAL_CLASS_STATIC_COLOR = 2
    Alembic::Enumerants::VISUAL_CLASS_PSEUDO_COLOR = 3
    Alembic::Enumerants::VISUAL_CLASS_TRUE_COLOR = 4
    Alembic::Enumerants::VISUAL_CLASS_DIRECT_COLOR = 5
    
    VISUALTYPE = Struct.new(:visual_id, :klass, :bits_per_rgb_value, :colormap_entries, :red_mask, :green_mask, :blue_mask)
    
    def encode_visualtype (s, visual_id, klass, bits_per_rgb_value, colormap_entries, red_mask, green_mask, blue_mask)
      s << [visual_id, klass, bits_per_rgb_value, colormap_entries, red_mask, green_mask, blue_mask].pack("LCCSLLLx4")
      s
    end
    
    def decode_visualtype (s)
      x = VISUALTYPE.new
      x.visual_id, x.klass, x.bits_per_rgb_value, x.colormap_entries, x.red_mask, x.green_mask, x.blue_mask = s.slice!(0, 24).unpack("LCCSLLLx4")
      x
    end
    
    DEPTH = Struct.new(:depth, :visuals_len, :visuals)
    
    def encode_depth (s, depth, visuals)
      visuals_len = visuals.length
      s << [depth, visuals_len].pack("Cx1Sx4")
      s << visuals.map{|x|encode_visualtype(x)}
      s
    end
    
    def decode_depth (s)
      x = DEPTH.new
      x.depth, x.visuals_len = s.slice!(0, 8).unpack("Cx1Sx4")
      x.visuals = x.visuals_len.times.map{decode_visualtype(s)}
      x
    end
    
    Alembic::Enumerants::EVENT_MASK_NO_EVENT = 0
    Alembic::Enumerants::EVENT_MASK_KEY_PRESS = 1
    Alembic::Enumerants::EVENT_MASK_KEY_RELEASE = 2
    Alembic::Enumerants::EVENT_MASK_BUTTON_PRESS = 4
    Alembic::Enumerants::EVENT_MASK_BUTTON_RELEASE = 8
    Alembic::Enumerants::EVENT_MASK_ENTER_WINDOW = 16
    Alembic::Enumerants::EVENT_MASK_LEAVE_WINDOW = 32
    Alembic::Enumerants::EVENT_MASK_POINTER_MOTION = 64
    Alembic::Enumerants::EVENT_MASK_POINTER_MOTION_HINT = 128
    Alembic::Enumerants::EVENT_MASK_BUTTON1MOTION = 256
    Alembic::Enumerants::EVENT_MASK_BUTTON2MOTION = 512
    Alembic::Enumerants::EVENT_MASK_BUTTON3MOTION = 1024
    Alembic::Enumerants::EVENT_MASK_BUTTON4MOTION = 2048
    Alembic::Enumerants::EVENT_MASK_BUTTON5MOTION = 4096
    Alembic::Enumerants::EVENT_MASK_BUTTON_MOTION = 8192
    Alembic::Enumerants::EVENT_MASK_KEYMAP_STATE = 16384
    Alembic::Enumerants::EVENT_MASK_EXPOSURE = 32768
    Alembic::Enumerants::EVENT_MASK_VISIBILITY_CHANGE = 65536
    Alembic::Enumerants::EVENT_MASK_STRUCTURE_NOTIFY = 131072
    Alembic::Enumerants::EVENT_MASK_RESIZE_REDIRECT = 262144
    Alembic::Enumerants::EVENT_MASK_SUBSTRUCTURE_NOTIFY = 524288
    Alembic::Enumerants::EVENT_MASK_SUBSTRUCTURE_REDIRECT = 1048576
    Alembic::Enumerants::EVENT_MASK_FOCUS_CHANGE = 2097152
    Alembic::Enumerants::EVENT_MASK_PROPERTY_CHANGE = 4194304
    Alembic::Enumerants::EVENT_MASK_COLOR_MAP_CHANGE = 8388608
    Alembic::Enumerants::EVENT_MASK_OWNER_GRAB_BUTTON = 16777216
    
    Alembic::Enumerants::BACKING_STORE_NOT_USEFUL = 0
    Alembic::Enumerants::BACKING_STORE_WHEN_MAPPED = 1
    Alembic::Enumerants::BACKING_STORE_ALWAYS = 2
    
    SCREEN = Struct.new(:root, :default_colormap, :white_pixel, :black_pixel, :current_input_masks, :width_in_pixels, :height_in_pixels, :width_in_millimeters, :height_in_millimeters, :min_installed_maps, :max_installed_maps, :root_visual, :backing_stores, :save_unders, :root_depth, :allowed_depths_len, :allowed_depths)
    
    def encode_screen (s, root, default_colormap, white_pixel, black_pixel, current_input_masks, width_in_pixels, height_in_pixels, width_in_millimeters, height_in_millimeters, min_installed_maps, max_installed_maps, root_visual, backing_stores, save_unders, root_depth, allowed_depths)
      allowed_depths_len = allowed_depths.length
      s << [Window.to_xid(connection, root), Colormap.to_xid(connection, default_colormap), white_pixel, black_pixel, current_input_masks, width_in_pixels, height_in_pixels, width_in_millimeters, height_in_millimeters, min_installed_maps, max_installed_maps, root_visual, backing_stores, save_unders ? 1 : 0, root_depth, allowed_depths_len].pack("LLLLLSSSSSSLCCCC")
      s << allowed_depths.map{|x|encode_depth(x)}
      s
    end
    
    def decode_screen (s)
      x = SCREEN.new
      x.root, x.default_colormap, x.white_pixel, x.black_pixel, x.current_input_masks, x.width_in_pixels, x.height_in_pixels, x.width_in_millimeters, x.height_in_millimeters, x.min_installed_maps, x.max_installed_maps, x.root_visual, x.backing_stores, x.save_unders, x.root_depth, x.allowed_depths_len = s.slice!(0, 40).unpack("LLLLLSSSSSSLCCCC")
      x.root = Window[connection, x.root]
      x.default_colormap = Colormap[connection, x.default_colormap]
      x.save_unders = x.save_unders != 0
      x.allowed_depths = x.allowed_depths_len.times.map{decode_depth(s)}
      x
    end
    
    SetupRequest = Struct.new(:byte_order, :protocol_major_version, :protocol_minor_version, :authorization_protocol_name_len, :authorization_protocol_data_len, :authorization_protocol_name, :authorization_protocol_data)
    
    def encode_setup_request (s, byte_order, protocol_major_version, protocol_minor_version, authorization_protocol_name, authorization_protocol_data)
      authorization_protocol_name_len = authorization_protocol_name.length
      authorization_protocol_data_len = authorization_protocol_data.length
      s << [byte_order, protocol_major_version, protocol_minor_version, authorization_protocol_name_len, authorization_protocol_data_len, authorization_protocol_name].pack("SSSSSx2A*")
      s << ' ' * (-s.length & 3)
      s << [authorization_protocol_data].pack("A*")
      s
    end
    
    def decode_setup_request (s)
      x = SetupRequest.new
      x.byte_order, x.protocol_major_version, x.protocol_minor_version, x.authorization_protocol_name_len, x.authorization_protocol_data_len = s.slice!(0, 12).unpack("SSSSSx2")
      x.authorization_protocol_name = s.slice!(0, x.authorization_protocol_name_len)
      s.slice!(0, raise("Can't decode this today"))
      x.authorization_protocol_data = s.slice!(0, x.authorization_protocol_data_len)
      x
    end
    
    SetupFailed = Struct.new(:status, :reason_len, :protocol_major_version, :protocol_minor_version, :length, :reason)
    
    def encode_setup_failed (s, status, protocol_major_version, protocol_minor_version, length, reason)
      reason_len = reason.length
      s << [status, reason_len, protocol_major_version, protocol_minor_version, length, reason].pack("CCSSSA*")
      s
    end
    
    def decode_setup_failed (s)
      x = SetupFailed.new
      x.status, x.reason_len, x.protocol_major_version, x.protocol_minor_version, x.length = s.slice!(0, 8).unpack("CCSSS")
      x.reason = s.slice!(0, x.reason_len)
      x
    end
    
    SetupAuthenticate = Struct.new(:status, :length, :reason)
    
    def encode_setup_authenticate (s, status, length, reason)
      s << [status, length, reason].pack("Cx5SA*")
      s
    end
    
    def decode_setup_authenticate (s)
      x = SetupAuthenticate.new
      x.status, x.length = s.slice!(0, 8).unpack("Cx5S")
      x.reason = s.slice!(0, (x.length*4))
      x
    end
    
    Alembic::Enumerants::IMAGE_ORDER_LSB_FIRST = 0
    Alembic::Enumerants::IMAGE_ORDER_MSB_FIRST = 1
    
    Setup = Struct.new(:status, :protocol_major_version, :protocol_minor_version, :length, :release_number, :resource_id_base, :resource_id_mask, :motion_buffer_size, :vendor_len, :maximum_request_length, :roots_len, :pixmap_formats_len, :image_byte_order, :bitmap_format_bit_order, :bitmap_format_scanline_unit, :bitmap_format_scanline_pad, :min_keycode, :max_keycode, :vendor, :pixmap_formats, :roots)
    
    def encode_setup (s, status, protocol_major_version, protocol_minor_version, length, release_number, resource_id_base, resource_id_mask, motion_buffer_size, maximum_request_length, image_byte_order, bitmap_format_bit_order, bitmap_format_scanline_unit, bitmap_format_scanline_pad, min_keycode, max_keycode, vendor, pixmap_formats, roots)
      vendor_len = vendor.length
      pixmap_formats_len = pixmap_formats.length
      roots_len = roots.length
      s << [status, protocol_major_version, protocol_minor_version, length, release_number, resource_id_base, resource_id_mask, motion_buffer_size, vendor_len, maximum_request_length, roots_len, pixmap_formats_len, image_byte_order, bitmap_format_bit_order, bitmap_format_scanline_unit, bitmap_format_scanline_pad, min_keycode, max_keycode, vendor].pack("Cx1SSSLLLLSSCCCCCCCCx4A*")
      s << pixmap_formats.map{|x|encode_format(x)}
      s << roots.map{|x|encode_screen(x)}
      s
    end
    
    def decode_setup (s)
      x = Setup.new
      x.status, x.protocol_major_version, x.protocol_minor_version, x.length, x.release_number, x.resource_id_base, x.resource_id_mask, x.motion_buffer_size, x.vendor_len, x.maximum_request_length, x.roots_len, x.pixmap_formats_len, x.image_byte_order, x.bitmap_format_bit_order, x.bitmap_format_scanline_unit, x.bitmap_format_scanline_pad, x.min_keycode, x.max_keycode = s.slice!(0, 40).unpack("Cx1SSSLLLLSSCCCCCCCCx4")
      x.vendor = s.slice!(0, x.vendor_len)
      x.pixmap_formats = x.pixmap_formats_len.times.map{decode_format(s)}
      x.roots = x.roots_len.times.map{decode_screen(s)}
      x
    end
    
    Alembic::Enumerants::MOD_MASK_SHIFT = 1
    Alembic::Enumerants::MOD_MASK_LOCK = 2
    Alembic::Enumerants::MOD_MASK_CONTROL = 4
    Alembic::Enumerants::MOD_MASK_1 = 8
    Alembic::Enumerants::MOD_MASK_2 = 16
    Alembic::Enumerants::MOD_MASK_3 = 32
    Alembic::Enumerants::MOD_MASK_4 = 64
    Alembic::Enumerants::MOD_MASK_5 = 128
    Alembic::Enumerants::MOD_MASK_ANY = 32768
    
    Alembic::Enumerants::KEY_MASK_SHIFT = 1
    Alembic::Enumerants::KEY_MASK_LOCK = 2
    Alembic::Enumerants::KEY_MASK_CONTROL = 4
    Alembic::Enumerants::KEY_MASK_MOD1 = 8
    Alembic::Enumerants::KEY_MASK_MOD2 = 16
    Alembic::Enumerants::KEY_MASK_MOD3 = 32
    Alembic::Enumerants::KEY_MASK_MOD4 = 64
    Alembic::Enumerants::KEY_MASK_MOD5 = 128
    Alembic::Enumerants::KEY_MASK_BUTTON1 = 256
    Alembic::Enumerants::KEY_MASK_BUTTON2 = 512
    Alembic::Enumerants::KEY_MASK_BUTTON3 = 1024
    Alembic::Enumerants::KEY_MASK_BUTTON4 = 2048
    Alembic::Enumerants::KEY_MASK_BUTTON5 = 4096
    
    KeyPressEvent = Struct.new(:detail, :time, :root, :event, :child, :root_x, :root_y, :event_x, :event_y, :state, :same_screen, :synthetic)
    
    Alembic::X11.register_event(2, :decode_key_press_event, false)
    
    def decode_key_press_event (s)
      x = KeyPressEvent.new
      x.detail, x.time, x.root, x.event, x.child, x.root_x, x.root_y, x.event_x, x.event_y, x.state, x.same_screen, x.synthetic = s.slice!(0, 30).unpack("CLLLLssssSCx1C")
      x.root = Window[connection, x.root]
      x.event = Window[connection, x.event]
      x.child = Window[connection, x.child]
      x.same_screen = x.same_screen != 0
      x.synthetic = x.synthetic != 0
      x
    end
    
    KeyReleaseEvent = Struct.new(:detail, :time, :root, :event, :child, :root_x, :root_y, :event_x, :event_y, :state, :same_screen, :synthetic)
    
    Alembic::X11.register_event(3, :decode_key_release_event, false)
    
    def decode_key_release_event (s)
      x = KeyReleaseEvent.new
      x.detail, x.time, x.root, x.event, x.child, x.root_x, x.root_y, x.event_x, x.event_y, x.state, x.same_screen, x.synthetic = s.slice!(0, 30).unpack("CLLLLssssSCx1C")
      x.root = Window[connection, x.root]
      x.event = Window[connection, x.event]
      x.child = Window[connection, x.child]
      x.same_screen = x.same_screen != 0
      x.synthetic = x.synthetic != 0
      x
    end
    
    Alembic::Enumerants::BUTTON_MASK_1 = 256
    Alembic::Enumerants::BUTTON_MASK_2 = 512
    Alembic::Enumerants::BUTTON_MASK_3 = 1024
    Alembic::Enumerants::BUTTON_MASK_4 = 2048
    Alembic::Enumerants::BUTTON_MASK_5 = 4096
    Alembic::Enumerants::BUTTON_MASK_ANY = 32768
    
    ButtonPressEvent = Struct.new(:detail, :time, :root, :event, :child, :root_x, :root_y, :event_x, :event_y, :state, :same_screen, :synthetic)
    
    Alembic::X11.register_event(4, :decode_button_press_event, false)
    
    def decode_button_press_event (s)
      x = ButtonPressEvent.new
      x.detail, x.time, x.root, x.event, x.child, x.root_x, x.root_y, x.event_x, x.event_y, x.state, x.same_screen, x.synthetic = s.slice!(0, 30).unpack("CLLLLssssSCx1C")
      x.root = Window[connection, x.root]
      x.event = Window[connection, x.event]
      x.child = Window[connection, x.child]
      x.same_screen = x.same_screen != 0
      x.synthetic = x.synthetic != 0
      x
    end
    
    ButtonReleaseEvent = Struct.new(:detail, :time, :root, :event, :child, :root_x, :root_y, :event_x, :event_y, :state, :same_screen, :synthetic)
    
    Alembic::X11.register_event(5, :decode_button_release_event, false)
    
    def decode_button_release_event (s)
      x = ButtonReleaseEvent.new
      x.detail, x.time, x.root, x.event, x.child, x.root_x, x.root_y, x.event_x, x.event_y, x.state, x.same_screen, x.synthetic = s.slice!(0, 30).unpack("CLLLLssssSCx1C")
      x.root = Window[connection, x.root]
      x.event = Window[connection, x.event]
      x.child = Window[connection, x.child]
      x.same_screen = x.same_screen != 0
      x.synthetic = x.synthetic != 0
      x
    end
    
    Alembic::Enumerants::MOTION_NORMAL = 0
    Alembic::Enumerants::MOTION_HINT = 1
    
    MotionNotifyEvent = Struct.new(:detail, :time, :root, :event, :child, :root_x, :root_y, :event_x, :event_y, :state, :same_screen, :synthetic)
    
    Alembic::X11.register_event(6, :decode_motion_notify_event, false)
    
    def decode_motion_notify_event (s)
      x = MotionNotifyEvent.new
      x.detail, x.time, x.root, x.event, x.child, x.root_x, x.root_y, x.event_x, x.event_y, x.state, x.same_screen, x.synthetic = s.slice!(0, 30).unpack("CLLLLssssSCx1C")
      x.root = Window[connection, x.root]
      x.event = Window[connection, x.event]
      x.child = Window[connection, x.child]
      x.same_screen = x.same_screen != 0
      x.synthetic = x.synthetic != 0
      x
    end
    
    Alembic::Enumerants::NOTIFY_DETAIL_ANCESTOR = 0
    Alembic::Enumerants::NOTIFY_DETAIL_VIRTUAL = 1
    Alembic::Enumerants::NOTIFY_DETAIL_INFERIOR = 2
    Alembic::Enumerants::NOTIFY_DETAIL_NONLINEAR = 3
    Alembic::Enumerants::NOTIFY_DETAIL_NONLINEAR_VIRTUAL = 4
    Alembic::Enumerants::NOTIFY_DETAIL_POINTER = 5
    Alembic::Enumerants::NOTIFY_DETAIL_POINTER_ROOT = 6
    Alembic::Enumerants::NOTIFY_DETAIL_NONE = 7
    
    Alembic::Enumerants::NOTIFY_MODE_NORMAL = 0
    Alembic::Enumerants::NOTIFY_MODE_GRAB = 1
    Alembic::Enumerants::NOTIFY_MODE_UNGRAB = 2
    Alembic::Enumerants::NOTIFY_MODE_WHILE_GRABBED = 3
    
    EnterNotifyEvent = Struct.new(:detail, :time, :root, :event, :child, :root_x, :root_y, :event_x, :event_y, :state, :mode, :same_screen_focus, :synthetic)
    
    Alembic::X11.register_event(7, :decode_enter_notify_event, false)
    
    def decode_enter_notify_event (s)
      x = EnterNotifyEvent.new
      x.detail, x.time, x.root, x.event, x.child, x.root_x, x.root_y, x.event_x, x.event_y, x.state, x.mode, x.same_screen_focus, x.synthetic = s.slice!(0, 30).unpack("CLLLLssssSCCC")
      x.root = Window[connection, x.root]
      x.event = Window[connection, x.event]
      x.child = Window[connection, x.child]
      x.synthetic = x.synthetic != 0
      x
    end
    
    LeaveNotifyEvent = Struct.new(:detail, :time, :root, :event, :child, :root_x, :root_y, :event_x, :event_y, :state, :mode, :same_screen_focus, :synthetic)
    
    Alembic::X11.register_event(8, :decode_leave_notify_event, false)
    
    def decode_leave_notify_event (s)
      x = LeaveNotifyEvent.new
      x.detail, x.time, x.root, x.event, x.child, x.root_x, x.root_y, x.event_x, x.event_y, x.state, x.mode, x.same_screen_focus, x.synthetic = s.slice!(0, 30).unpack("CLLLLssssSCCC")
      x.root = Window[connection, x.root]
      x.event = Window[connection, x.event]
      x.child = Window[connection, x.child]
      x.synthetic = x.synthetic != 0
      x
    end
    
    FocusInEvent = Struct.new(:detail, :event, :mode, :synthetic)
    
    Alembic::X11.register_event(9, :decode_focus_in_event, false)
    
    def decode_focus_in_event (s)
      x = FocusInEvent.new
      x.detail, x.event, x.mode, x.synthetic = s.slice!(0, 10).unpack("CLCx3C")
      x.event = Window[connection, x.event]
      x.synthetic = x.synthetic != 0
      x
    end
    
    FocusOutEvent = Struct.new(:detail, :event, :mode, :synthetic)
    
    Alembic::X11.register_event(10, :decode_focus_out_event, false)
    
    def decode_focus_out_event (s)
      x = FocusOutEvent.new
      x.detail, x.event, x.mode, x.synthetic = s.slice!(0, 10).unpack("CLCx3C")
      x.event = Window[connection, x.event]
      x.synthetic = x.synthetic != 0
      x
    end
    
    KeymapNotifyEvent = Struct.new(:keys, :synthetic)
    
    Alembic::X11.register_event(11, :decode_keymap_notify_event, true)
    
    def decode_keymap_notify_event (s)
      x = KeymapNotifyEvent.new
      x.keys = 31.times.map{s.slice!(0, 1).unpack("C")[0]}
      x.synthetic = s.slice!(0, 1).unpack("C")
      x.synthetic = x.synthetic != 0
      x
    end
    
    ExposeEvent = Struct.new(:window, :x, :y, :width, :height, :count, :synthetic)
    
    Alembic::X11.register_event(12, :decode_expose_event, false)
    
    def decode_expose_event (s)
      x = ExposeEvent.new
      x.window, x.x, x.y, x.width, x.height, x.count, x.synthetic = s.slice!(0, 18).unpack("x1LSSSSSx2C")
      x.window = Window[connection, x.window]
      x.synthetic = x.synthetic != 0
      x
    end
    
    GraphicsExposureEvent = Struct.new(:drawable, :x, :y, :width, :height, :minor_opcode, :count, :major_opcode, :synthetic)
    
    Alembic::X11.register_event(13, :decode_graphics_exposure_event, false)
    
    def decode_graphics_exposure_event (s)
      x = GraphicsExposureEvent.new
      x.drawable, x.x, x.y, x.width, x.height, x.minor_opcode, x.count, x.major_opcode, x.synthetic = s.slice!(0, 22).unpack("x1LSSSSSSCx3C")
      x.drawable = Drawable[connection, x.drawable]
      x.synthetic = x.synthetic != 0
      x
    end
    
    NoExposureEvent = Struct.new(:drawable, :minor_opcode, :major_opcode, :synthetic)
    
    Alembic::X11.register_event(14, :decode_no_exposure_event, false)
    
    def decode_no_exposure_event (s)
      x = NoExposureEvent.new
      x.drawable, x.minor_opcode, x.major_opcode, x.synthetic = s.slice!(0, 10).unpack("x1LSCx1C")
      x.drawable = Drawable[connection, x.drawable]
      x.synthetic = x.synthetic != 0
      x
    end
    
    Alembic::Enumerants::VISIBILITY_UNOBSCURED = 0
    Alembic::Enumerants::VISIBILITY_PARTIALLY_OBSCURED = 1
    Alembic::Enumerants::VISIBILITY_FULLY_OBSCURED = 2
    
    VisibilityNotifyEvent = Struct.new(:window, :state, :synthetic)
    
    Alembic::X11.register_event(15, :decode_visibility_notify_event, false)
    
    def decode_visibility_notify_event (s)
      x = VisibilityNotifyEvent.new
      x.window, x.state, x.synthetic = s.slice!(0, 10).unpack("x1LCx3C")
      x.window = Window[connection, x.window]
      x.synthetic = x.synthetic != 0
      x
    end
    
    CreateNotifyEvent = Struct.new(:parent, :window, :x, :y, :width, :height, :border_width, :override_redirect, :synthetic)
    
    Alembic::X11.register_event(16, :decode_create_notify_event, false)
    
    def decode_create_notify_event (s)
      x = CreateNotifyEvent.new
      x.parent, x.window, x.x, x.y, x.width, x.height, x.border_width, x.override_redirect, x.synthetic = s.slice!(0, 22).unpack("x1LLssSSSCx1C")
      x.parent = Window[connection, x.parent]
      x.window = Window[connection, x.window]
      x.override_redirect = x.override_redirect != 0
      x.synthetic = x.synthetic != 0
      x
    end
    
    DestroyNotifyEvent = Struct.new(:event, :window, :synthetic)
    
    Alembic::X11.register_event(17, :decode_destroy_notify_event, false)
    
    def decode_destroy_notify_event (s)
      x = DestroyNotifyEvent.new
      x.event, x.window, x.synthetic = s.slice!(0, 10).unpack("x1LLC")
      x.event = Window[connection, x.event]
      x.window = Window[connection, x.window]
      x.synthetic = x.synthetic != 0
      x
    end
    
    UnmapNotifyEvent = Struct.new(:event, :window, :from_configure, :synthetic)
    
    Alembic::X11.register_event(18, :decode_unmap_notify_event, false)
    
    def decode_unmap_notify_event (s)
      x = UnmapNotifyEvent.new
      x.event, x.window, x.from_configure, x.synthetic = s.slice!(0, 14).unpack("x1LLCx3C")
      x.event = Window[connection, x.event]
      x.window = Window[connection, x.window]
      x.from_configure = x.from_configure != 0
      x.synthetic = x.synthetic != 0
      x
    end
    
    MapNotifyEvent = Struct.new(:event, :window, :override_redirect, :synthetic)
    
    Alembic::X11.register_event(19, :decode_map_notify_event, false)
    
    def decode_map_notify_event (s)
      x = MapNotifyEvent.new
      x.event, x.window, x.override_redirect, x.synthetic = s.slice!(0, 14).unpack("x1LLCx3C")
      x.event = Window[connection, x.event]
      x.window = Window[connection, x.window]
      x.override_redirect = x.override_redirect != 0
      x.synthetic = x.synthetic != 0
      x
    end
    
    MapRequestEvent = Struct.new(:parent, :window, :synthetic)
    
    Alembic::X11.register_event(20, :decode_map_request_event, false)
    
    def decode_map_request_event (s)
      x = MapRequestEvent.new
      x.parent, x.window, x.synthetic = s.slice!(0, 10).unpack("x1LLC")
      x.parent = Window[connection, x.parent]
      x.window = Window[connection, x.window]
      x.synthetic = x.synthetic != 0
      x
    end
    
    ReparentNotifyEvent = Struct.new(:event, :window, :parent, :x, :y, :override_redirect, :synthetic)
    
    Alembic::X11.register_event(21, :decode_reparent_notify_event, false)
    
    def decode_reparent_notify_event (s)
      x = ReparentNotifyEvent.new
      x.event, x.window, x.parent, x.x, x.y, x.override_redirect, x.synthetic = s.slice!(0, 22).unpack("x1LLLssCx3C")
      x.event = Window[connection, x.event]
      x.window = Window[connection, x.window]
      x.parent = Window[connection, x.parent]
      x.override_redirect = x.override_redirect != 0
      x.synthetic = x.synthetic != 0
      x
    end
    
    ConfigureNotifyEvent = Struct.new(:event, :window, :above_sibling, :x, :y, :width, :height, :border_width, :override_redirect, :synthetic)
    
    Alembic::X11.register_event(22, :decode_configure_notify_event, false)
    
    def decode_configure_notify_event (s)
      x = ConfigureNotifyEvent.new
      x.event, x.window, x.above_sibling, x.x, x.y, x.width, x.height, x.border_width, x.override_redirect, x.synthetic = s.slice!(0, 26).unpack("x1LLLssSSSCx1C")
      x.event = Window[connection, x.event]
      x.window = Window[connection, x.window]
      x.above_sibling = Window[connection, x.above_sibling]
      x.override_redirect = x.override_redirect != 0
      x.synthetic = x.synthetic != 0
      x
    end
    
    ConfigureRequestEvent = Struct.new(:stack_mode, :parent, :window, :sibling, :x, :y, :width, :height, :border_width, :value_mask, :synthetic)
    
    Alembic::X11.register_event(23, :decode_configure_request_event, false)
    
    def decode_configure_request_event (s)
      x = ConfigureRequestEvent.new
      x.stack_mode, x.parent, x.window, x.sibling, x.x, x.y, x.width, x.height, x.border_width, x.value_mask, x.synthetic = s.slice!(0, 26).unpack("CLLLssSSSSC")
      x.parent = Window[connection, x.parent]
      x.window = Window[connection, x.window]
      x.sibling = Window[connection, x.sibling]
      x.synthetic = x.synthetic != 0
      x
    end
    
    GravityNotifyEvent = Struct.new(:event, :window, :x, :y, :synthetic)
    
    Alembic::X11.register_event(24, :decode_gravity_notify_event, false)
    
    def decode_gravity_notify_event (s)
      x = GravityNotifyEvent.new
      x.event, x.window, x.x, x.y, x.synthetic = s.slice!(0, 14).unpack("x1LLssC")
      x.event = Window[connection, x.event]
      x.window = Window[connection, x.window]
      x.synthetic = x.synthetic != 0
      x
    end
    
    ResizeRequestEvent = Struct.new(:window, :width, :height, :synthetic)
    
    Alembic::X11.register_event(25, :decode_resize_request_event, false)
    
    def decode_resize_request_event (s)
      x = ResizeRequestEvent.new
      x.window, x.width, x.height, x.synthetic = s.slice!(0, 10).unpack("x1LSSC")
      x.window = Window[connection, x.window]
      x.synthetic = x.synthetic != 0
      x
    end
    
    Alembic::Enumerants::PLACE_ON_TOP = 0
    Alembic::Enumerants::PLACE_ON_BOTTOM = 1
    
    CirculateNotifyEvent = Struct.new(:event, :window, :place, :synthetic)
    
    Alembic::X11.register_event(26, :decode_circulate_notify_event, false)
    
    def decode_circulate_notify_event (s)
      x = CirculateNotifyEvent.new
      x.event, x.window, x.place, x.synthetic = s.slice!(0, 18).unpack("x1LLx4Cx3C")
      x.event = Window[connection, x.event]
      x.window = Window[connection, x.window]
      x.synthetic = x.synthetic != 0
      x
    end
    
    CirculateRequestEvent = Struct.new(:event, :window, :place, :synthetic)
    
    Alembic::X11.register_event(27, :decode_circulate_request_event, false)
    
    def decode_circulate_request_event (s)
      x = CirculateRequestEvent.new
      x.event, x.window, x.place, x.synthetic = s.slice!(0, 18).unpack("x1LLx4Cx3C")
      x.event = Window[connection, x.event]
      x.window = Window[connection, x.window]
      x.synthetic = x.synthetic != 0
      x
    end
    
    Alembic::Enumerants::PROPERTY_NEW_VALUE = 0
    Alembic::Enumerants::PROPERTY_DELETE = 1
    
    PropertyNotifyEvent = Struct.new(:window, :atom, :time, :state, :synthetic)
    
    Alembic::X11.register_event(28, :decode_property_notify_event, false)
    
    def decode_property_notify_event (s)
      x = PropertyNotifyEvent.new
      x.window, x.atom, x.time, x.state, x.synthetic = s.slice!(0, 18).unpack("x1LLLCx3C")
      x.window = Window[connection, x.window]
      x.atom = Atom[connection, x.atom]
      x.synthetic = x.synthetic != 0
      x
    end
    
    SelectionClearEvent = Struct.new(:time, :owner, :selection, :synthetic)
    
    Alembic::X11.register_event(29, :decode_selection_clear_event, false)
    
    def decode_selection_clear_event (s)
      x = SelectionClearEvent.new
      x.time, x.owner, x.selection, x.synthetic = s.slice!(0, 14).unpack("x1LLLC")
      x.owner = Window[connection, x.owner]
      x.selection = Atom[connection, x.selection]
      x.synthetic = x.synthetic != 0
      x
    end
    
    Alembic::Enumerants::TIME_CURRENT_TIME = 0
    
    SelectionRequestEvent = Struct.new(:time, :owner, :requestor, :selection, :target, :property, :synthetic)
    
    Alembic::X11.register_event(30, :decode_selection_request_event, false)
    
    def decode_selection_request_event (s)
      x = SelectionRequestEvent.new
      x.time, x.owner, x.requestor, x.selection, x.target, x.property, x.synthetic = s.slice!(0, 26).unpack("x1LLLLLLC")
      x.owner = Window[connection, x.owner]
      x.requestor = Window[connection, x.requestor]
      x.selection = Atom[connection, x.selection]
      x.target = Atom[connection, x.target]
      x.property = Atom[connection, x.property]
      x.synthetic = x.synthetic != 0
      x
    end
    
    SelectionNotifyEvent = Struct.new(:time, :requestor, :selection, :target, :property, :synthetic)
    
    Alembic::X11.register_event(31, :decode_selection_notify_event, false)
    
    def decode_selection_notify_event (s)
      x = SelectionNotifyEvent.new
      x.time, x.requestor, x.selection, x.target, x.property, x.synthetic = s.slice!(0, 22).unpack("x1LLLLLC")
      x.requestor = Window[connection, x.requestor]
      x.selection = Atom[connection, x.selection]
      x.target = Atom[connection, x.target]
      x.property = Atom[connection, x.property]
      x.synthetic = x.synthetic != 0
      x
    end
    
    Alembic::Enumerants::COLORMAP_STATE_UNINSTALLED = 0
    Alembic::Enumerants::COLORMAP_STATE_INSTALLED = 1
    
    ColormapNotifyEvent = Struct.new(:window, :colormap, :new, :state, :synthetic)
    
    Alembic::X11.register_event(32, :decode_colormap_notify_event, false)
    
    def decode_colormap_notify_event (s)
      x = ColormapNotifyEvent.new
      x.window, x.colormap, x.new, x.state, x.synthetic = s.slice!(0, 14).unpack("x1LLCCx2C")
      x.window = Window[connection, x.window]
      x.colormap = Colormap[connection, x.colormap]
      x.new = x.new != 0
      x.synthetic = x.synthetic != 0
      x
    end
    
    ClientMessageEvent = Struct.new(:format, :window, :type, :data, :synthetic)
    
    Alembic::X11.register_event(33, :decode_client_message_event, false)
    
    def decode_client_message_event (s)
      x = ClientMessageEvent.new
      x.format, x.window, x.type = s.slice!(0, 9).unpack("CLL")
      x.window = Window[connection, x.window]
      x.type = Atom[connection, x.type]
      x.data = decode_client_message_data(s)
      x.synthetic = s.slice!(0, 1).unpack("C")
      x.synthetic = x.synthetic != 0
      x
    end
    
    Alembic::Enumerants::MAPPING_MODIFIER = 0
    Alembic::Enumerants::MAPPING_KEYBOARD = 1
    Alembic::Enumerants::MAPPING_POINTER = 2
    
    MappingNotifyEvent = Struct.new(:request, :first_keycode, :count, :synthetic)
    
    Alembic::X11.register_event(34, :decode_mapping_notify_event, false)
    
    def decode_mapping_notify_event (s)
      x = MappingNotifyEvent.new
      x.request, x.first_keycode, x.count, x.synthetic = s.slice!(0, 6).unpack("x1CCCx1C")
      x.synthetic = x.synthetic != 0
      x
    end
    
    Alembic::Enumerants::PIXMAP_NONE = 0
    
    Alembic::Enumerants::CURSOR_NONE = 0
    
    Alembic::Enumerants::FONT_NONE = 0
    
    Alembic::Enumerants::WINDOW_CLASS_COPY_FROM_PARENT = 0
    Alembic::Enumerants::WINDOW_CLASS_INPUT_OUTPUT = 1
    Alembic::Enumerants::WINDOW_CLASS_INPUT_ONLY = 2
    
    Alembic::Enumerants::CW_BACK_PIXMAP = 1
    Alembic::Enumerants::CW_BACK_PIXEL = 2
    Alembic::Enumerants::CW_BORDER_PIXMAP = 4
    Alembic::Enumerants::CW_BORDER_PIXEL = 8
    Alembic::Enumerants::CW_BIT_GRAVITY = 16
    Alembic::Enumerants::CW_WIN_GRAVITY = 32
    Alembic::Enumerants::CW_BACKING_STORE = 64
    Alembic::Enumerants::CW_BACKING_PLANES = 128
    Alembic::Enumerants::CW_BACKING_PIXEL = 256
    Alembic::Enumerants::CW_OVERRIDE_REDIRECT = 512
    Alembic::Enumerants::CW_SAVE_UNDER = 1024
    Alembic::Enumerants::CW_EVENT_MASK = 2048
    Alembic::Enumerants::CW_DONT_PROPAGATE = 4096
    Alembic::Enumerants::CW_COLORMAP = 8192
    Alembic::Enumerants::CW_CURSOR = 16384
    
    Alembic::Enumerants::BACK_PIXMAP_NONE = 0
    Alembic::Enumerants::BACK_PIXMAP_PARENT_RELATIVE = 1
    
    Alembic::Enumerants::GRAVITY_BIT_FORGET = 0
    Alembic::Enumerants::GRAVITY_WIN_UNMAP = 0
    Alembic::Enumerants::GRAVITY_NORTH_WEST = 1
    Alembic::Enumerants::GRAVITY_NORTH = 2
    Alembic::Enumerants::GRAVITY_NORTH_EAST = 3
    Alembic::Enumerants::GRAVITY_WEST = 4
    Alembic::Enumerants::GRAVITY_CENTER = 5
    Alembic::Enumerants::GRAVITY_EAST = 6
    Alembic::Enumerants::GRAVITY_SOUTH_WEST = 7
    Alembic::Enumerants::GRAVITY_SOUTH = 8
    Alembic::Enumerants::GRAVITY_SOUTH_EAST = 9
    Alembic::Enumerants::GRAVITY_STATIC = 10
    
    def create_window (depth, wid, parent, x, y, width, height, border_width, klass, visual, value_mask, *value_list)
      s = 1.chr.encode('BINARY')
      s << [depth, Window.to_xid(connection, wid), Window.to_xid(connection, parent), x, y, width, height, border_width, klass, visual, value_mask, *value_list].pack("CLLssSSSSLLL*")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    class Window
      def create_window (depth, wid, x, y, width, height, border_width, klass, visual, value_mask, *value_list)
        @conn.create_window(depth, wid, self, x, y, width, height, border_width, klass, visual, value_mask, *value_list)
      end
    end
    
    def change_window_attributes (window, value_mask, *value_list)
      s = 2.chr.encode('BINARY')
      s << [Window.to_xid(connection, window), value_mask, *value_list].pack("x1LLL*")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    class Window
      def change_window_attributes (value_mask, *value_list)
        @conn.change_window_attributes(self, value_mask, *value_list)
      end
    end
    
    Alembic::Enumerants::MAP_STATE_UNMAPPED = 0
    Alembic::Enumerants::MAP_STATE_UNVIEWABLE = 1
    Alembic::Enumerants::MAP_STATE_VIEWABLE = 2
    
    GetWindowAttributesReply = Struct.new(:backing_store, :visual, :klass, :bit_gravity, :win_gravity, :backing_planes, :backing_pixel, :save_under, :map_is_installed, :map_state, :override_redirect, :colormap, :all_event_masks, :your_event_mask, :do_not_propagate_mask)
    
    def get_window_attributes (window)
      s = 3.chr.encode('BINARY')
      s << [Window.to_xid(connection, window)].pack("x1L")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = GetWindowAttributesReply.new
      x.backing_store, x.visual, x.klass, x.bit_gravity, x.win_gravity, x.backing_planes, x.backing_pixel, x.save_under, x.map_is_installed, x.map_state, x.override_redirect, x.colormap, x.all_event_masks, x.your_event_mask, x.do_not_propagate_mask = s.slice!(0, 37).unpack("CLSCCLLCCCCLLLSx2")
      x.save_under = x.save_under != 0
      x.map_is_installed = x.map_is_installed != 0
      x.override_redirect = x.override_redirect != 0
      x.colormap = Colormap[connection, x.colormap]
      x
    end
    
    class Window
      def get_window_attributes ()
        @conn.get_window_attributes(self)
      end
    end
    
    def destroy_window (window)
      s = 4.chr.encode('BINARY')
      s << [Window.to_xid(connection, window)].pack("x1L")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    class Window
      def destroy_window ()
        @conn.destroy_window(self)
      end
    end
    
    def destroy_subwindows (window)
      s = 5.chr.encode('BINARY')
      s << [Window.to_xid(connection, window)].pack("x1L")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    class Window
      def destroy_subwindows ()
        @conn.destroy_subwindows(self)
      end
    end
    
    Alembic::Enumerants::SET_MODE_INSERT = 0
    Alembic::Enumerants::SET_MODE_DELETE = 1
    
    def change_save_set (mode, window)
      s = 6.chr.encode('BINARY')
      s << [mode, Window.to_xid(connection, window)].pack("CL")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    class Window
      def change_save_set (mode)
        @conn.change_save_set(mode, self)
      end
    end
    
    def reparent_window (window, parent, x, y)
      s = 7.chr.encode('BINARY')
      s << [Window.to_xid(connection, window), Window.to_xid(connection, parent), x, y].pack("x1LLss")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    class Window
      def reparent_window (parent, x, y)
        @conn.reparent_window(self, parent, x, y)
      end
    end
    
    def map_window (window)
      s = 8.chr.encode('BINARY')
      s << [Window.to_xid(connection, window)].pack("x1L")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    class Window
      def map_window ()
        @conn.map_window(self)
      end
    end
    
    def map_subwindows (window)
      s = 9.chr.encode('BINARY')
      s << [Window.to_xid(connection, window)].pack("x1L")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    class Window
      def map_subwindows ()
        @conn.map_subwindows(self)
      end
    end
    
    def unmap_window (window)
      s = 10.chr.encode('BINARY')
      s << [Window.to_xid(connection, window)].pack("x1L")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    class Window
      def unmap_window ()
        @conn.unmap_window(self)
      end
    end
    
    def unmap_subwindows (window)
      s = 11.chr.encode('BINARY')
      s << [Window.to_xid(connection, window)].pack("x1L")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    class Window
      def unmap_subwindows ()
        @conn.unmap_subwindows(self)
      end
    end
    
    Alembic::Enumerants::CONFIG_WINDOW_X = 1
    Alembic::Enumerants::CONFIG_WINDOW_Y = 2
    Alembic::Enumerants::CONFIG_WINDOW_WIDTH = 4
    Alembic::Enumerants::CONFIG_WINDOW_HEIGHT = 8
    Alembic::Enumerants::CONFIG_WINDOW_BORDER_WIDTH = 16
    Alembic::Enumerants::CONFIG_WINDOW_SIBLING = 32
    Alembic::Enumerants::CONFIG_WINDOW_STACK_MODE = 64
    
    Alembic::Enumerants::STACK_MODE_ABOVE = 0
    Alembic::Enumerants::STACK_MODE_BELOW = 1
    Alembic::Enumerants::STACK_MODE_TOP_IF = 2
    Alembic::Enumerants::STACK_MODE_BOTTOM_IF = 3
    Alembic::Enumerants::STACK_MODE_OPPOSITE = 4
    
    def configure_window (window, value_mask, *value_list)
      s = 12.chr.encode('BINARY')
      s << [Window.to_xid(connection, window), value_mask, *value_list].pack("x1LSx2L*")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    class Window
      def configure_window (value_mask, *value_list)
        @conn.configure_window(self, value_mask, *value_list)
      end
    end
    
    Alembic::Enumerants::CIRCULATE_RAISE_LOWEST = 0
    Alembic::Enumerants::CIRCULATE_LOWER_HIGHEST = 1
    
    def circulate_window (direction, window)
      s = 13.chr.encode('BINARY')
      s << [direction, Window.to_xid(connection, window)].pack("CL")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    class Window
      def circulate_window (direction)
        @conn.circulate_window(direction, self)
      end
    end
    
    GetGeometryReply = Struct.new(:depth, :root, :x, :y, :width, :height, :border_width)
    
    def get_geometry (drawable)
      s = 14.chr.encode('BINARY')
      s << [Drawable.to_xid(connection, drawable)].pack("x1L")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = GetGeometryReply.new
      x.depth, x.root, x.x, x.y, x.width, x.height, x.border_width = s.slice!(0, 17).unpack("CLssSSSx2")
      x.root = Window[connection, x.root]
      x
    end
    
    class Drawable
      def get_geometry ()
        @conn.get_geometry(self)
      end
    end
    
    QueryTreeReply = Struct.new(:root, :parent, :children_len, :children)
    
    def query_tree (window)
      s = 15.chr.encode('BINARY')
      s << [Window.to_xid(connection, window)].pack("x1L")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = QueryTreeReply.new
      x.root, x.parent, x.children_len, *x.children = s.unpack("x1LLSx14L*")
      x.root = Window[connection, x.root]
      x.parent = Window[connection, x.parent]
      x.children = x.children ? x.children.map{|x|Window[connection, x]} : []
      x
    end
    
    class Window
      def query_tree ()
        @conn.query_tree(self)
      end
    end
    
    InternAtomReply = Struct.new(:atom)
    
    def intern_atom (only_if_exists, name)
      s = 16.chr.encode('BINARY')
      name_len = name.length
      s << [only_if_exists ? 1 : 0, name_len, name].pack("CSx2A*")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = InternAtomReply.new
      x.atom = s.slice!(0, 5).unpack("x1L")
      x.atom = Atom[connection, x.atom]
      x.atom
    end
    
    GetAtomNameReply = Struct.new(:name_len, :name)
    
    def get_atom_name (atom)
      s = 17.chr.encode('BINARY')
      s << [Atom.to_xid(connection, atom)].pack("x1L")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = GetAtomNameReply.new
      x.name_len = s.slice!(0, 25).unpack("x1Sx22")
      x.name = s.slice!(0, x.name_len)
      x.name
    end
    
    class Atom
      def get_atom_name ()
        @conn.get_atom_name(self)
      end
    end
    
    Alembic::Enumerants::PROP_MODE_REPLACE = 0
    Alembic::Enumerants::PROP_MODE_PREPEND = 1
    Alembic::Enumerants::PROP_MODE_APPEND = 2
    
    def change_property (mode, window, property, type, format, data_len, data)
      s = 18.chr.encode('BINARY')
      s << [mode, Window.to_xid(connection, window), Atom.to_xid(connection, property), Atom.to_xid(connection, type), format, data_len, data].pack("CLLLCx3LA*")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    class Window
      def change_property (mode, property, type, format, data_len, data)
        @conn.change_property(mode, self, property, type, format, data_len, data)
      end
    end
    
    def delete_property (window, property)
      s = 19.chr.encode('BINARY')
      s << [Window.to_xid(connection, window), Atom.to_xid(connection, property)].pack("x1LL")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    class Window
      def delete_property (property)
        @conn.delete_property(self, property)
      end
    end
    
    Alembic::Enumerants::GET_PROPERTY_TYPE_ANY = 0
    
    GetPropertyReply = Struct.new(:format, :type, :bytes_after, :value_len, :value)
    
    def get_property (delete, window, property, type, long_offset, long_length)
      s = 20.chr.encode('BINARY')
      s << [delete ? 1 : 0, Window.to_xid(connection, window), Atom.to_xid(connection, property), Atom.to_xid(connection, type), long_offset, long_length].pack("CLLLLL")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = GetPropertyReply.new
      x.format, x.type, x.bytes_after, x.value_len = s.slice!(0, 25).unpack("CLLLx12")
      x.type = Atom[connection, x.type]
      x.value = s.slice!(0, (x.value_len*(x.format/8)))
      x
    end
    
    class Window
      def get_property (delete, property, type, long_offset, long_length)
        @conn.get_property(delete, self, property, type, long_offset, long_length)
      end
    end
    
    ListPropertiesReply = Struct.new(:atoms_len, :atoms)
    
    def list_properties (window)
      s = 21.chr.encode('BINARY')
      s << [Window.to_xid(connection, window)].pack("x1L")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = ListPropertiesReply.new
      x.atoms_len, *x.atoms = s.unpack("x1Sx22L*")
      x.atoms = x.atoms ? x.atoms.map{|x|Atom[connection, x]} : []
      x.atoms
    end
    
    class Window
      def list_properties ()
        @conn.list_properties(self)
      end
    end
    
    def set_selection_owner (owner, selection, time)
      s = 22.chr.encode('BINARY')
      s << [Window.to_xid(connection, owner), Atom.to_xid(connection, selection), time].pack("x1LLL")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    GetSelectionOwnerReply = Struct.new(:owner)
    
    def get_selection_owner (selection)
      s = 23.chr.encode('BINARY')
      s << [Atom.to_xid(connection, selection)].pack("x1L")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = GetSelectionOwnerReply.new
      x.owner = s.slice!(0, 5).unpack("x1L")
      x.owner = Window[connection, x.owner]
      x
    end
    
    class Atom
      def get_selection_owner ()
        @conn.get_selection_owner(self)
      end
    end
    
    def convert_selection (requestor, selection, target, property, time)
      s = 24.chr.encode('BINARY')
      s << [Window.to_xid(connection, requestor), Atom.to_xid(connection, selection), Atom.to_xid(connection, target), Atom.to_xid(connection, property), time].pack("x1LLLLL")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    class Atom
      def convert_selection (requestor, target, property, time)
        @conn.convert_selection(requestor, self, target, property, time)
      end
    end
    
    Alembic::Enumerants::SEND_EVENT_DEST_POINTER_WINDOW = 0
    Alembic::Enumerants::SEND_EVENT_DEST_ITEM_FOCUS = 1
    
    def send_event (propagate, destination, event_mask, event)
      s = 25.chr.encode('BINARY')
      s << [propagate ? 1 : 0, Window.to_xid(connection, destination), event_mask, event].pack("CLLA*")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    class Window
      def send_event (propagate, event_mask, event)
        @conn.send_event(propagate, self, event_mask, event)
      end
    end
    
    Alembic::Enumerants::GRAB_MODE_SYNC = 0
    Alembic::Enumerants::GRAB_MODE_ASYNC = 1
    
    Alembic::Enumerants::GRAB_STATUS_SUCCESS = 0
    Alembic::Enumerants::GRAB_STATUS_ALREADY_GRABBED = 1
    Alembic::Enumerants::GRAB_STATUS_INVALID_TIME = 2
    Alembic::Enumerants::GRAB_STATUS_NOT_VIEWABLE = 3
    Alembic::Enumerants::GRAB_STATUS_FROZEN = 4
    
    GrabPointerReply = Struct.new(:status)
    
    def grab_pointer (owner_events, grab_window, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, time)
      s = 26.chr.encode('BINARY')
      s << [owner_events ? 1 : 0, Window.to_xid(connection, grab_window), event_mask, pointer_mode, keyboard_mode, Window.to_xid(connection, confine_to), Cursor.to_xid(connection, cursor), time].pack("CLSCCLLL")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = GrabPointerReply.new
      x.status = s.slice!(0, 1).unpack("C")
      x
    end
    
    class Window
      def grab_pointer (owner_events, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, time)
        @conn.grab_pointer(owner_events, self, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, time)
      end
    end
    
    def ungrab_pointer (time)
      s = 27.chr.encode('BINARY')
      s << [time].pack("x1L")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    Alembic::Enumerants::BUTTON_INDEX_ANY = 0
    Alembic::Enumerants::BUTTON_INDEX_1 = 1
    Alembic::Enumerants::BUTTON_INDEX_2 = 2
    Alembic::Enumerants::BUTTON_INDEX_3 = 3
    Alembic::Enumerants::BUTTON_INDEX_4 = 4
    Alembic::Enumerants::BUTTON_INDEX_5 = 5
    
    def grab_button (owner_events, grab_window, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, button, modifiers)
      s = 28.chr.encode('BINARY')
      s << [owner_events ? 1 : 0, Window.to_xid(connection, grab_window), event_mask, pointer_mode, keyboard_mode, Window.to_xid(connection, confine_to), Cursor.to_xid(connection, cursor), button, modifiers].pack("CLSCCLLCx1S")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    class Window
      def grab_button (owner_events, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, button, modifiers)
        @conn.grab_button(owner_events, self, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, button, modifiers)
      end
    end
    
    def ungrab_button (button, grab_window, modifiers)
      s = 29.chr.encode('BINARY')
      s << [button, Window.to_xid(connection, grab_window), modifiers].pack("CLSx2")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    class Window
      def ungrab_button (button, modifiers)
        @conn.ungrab_button(button, self, modifiers)
      end
    end
    
    def change_active_pointer_grab (cursor, time, event_mask)
      s = 30.chr.encode('BINARY')
      s << [Cursor.to_xid(connection, cursor), time, event_mask].pack("x1LLSx2")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    GrabKeyboardReply = Struct.new(:status)
    
    def grab_keyboard (owner_events, grab_window, time, pointer_mode, keyboard_mode)
      s = 31.chr.encode('BINARY')
      s << [owner_events ? 1 : 0, Window.to_xid(connection, grab_window), time, pointer_mode, keyboard_mode].pack("CLLCCx2")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = GrabKeyboardReply.new
      x.status = s.slice!(0, 1).unpack("C")
      x
    end
    
    class Window
      def grab_keyboard (owner_events, time, pointer_mode, keyboard_mode)
        @conn.grab_keyboard(owner_events, self, time, pointer_mode, keyboard_mode)
      end
    end
    
    def ungrab_keyboard (time)
      s = 32.chr.encode('BINARY')
      s << [time].pack("x1L")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    Alembic::Enumerants::GRAB_ANY = 0
    
    def grab_key (owner_events, grab_window, modifiers, key, pointer_mode, keyboard_mode)
      s = 33.chr.encode('BINARY')
      s << [owner_events ? 1 : 0, Window.to_xid(connection, grab_window), modifiers, key, pointer_mode, keyboard_mode].pack("CLSCCCx3")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    class Window
      def grab_key (owner_events, modifiers, key, pointer_mode, keyboard_mode)
        @conn.grab_key(owner_events, self, modifiers, key, pointer_mode, keyboard_mode)
      end
    end
    
    def ungrab_key (key, grab_window, modifiers)
      s = 34.chr.encode('BINARY')
      s << [key, Window.to_xid(connection, grab_window), modifiers].pack("CLSx2")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    class Window
      def ungrab_key (key, modifiers)
        @conn.ungrab_key(key, self, modifiers)
      end
    end
    
    Alembic::Enumerants::ALLOW_ASYNC_POINTER = 0
    Alembic::Enumerants::ALLOW_SYNC_POINTER = 1
    Alembic::Enumerants::ALLOW_REPLAY_POINTER = 2
    Alembic::Enumerants::ALLOW_ASYNC_KEYBOARD = 3
    Alembic::Enumerants::ALLOW_SYNC_KEYBOARD = 4
    Alembic::Enumerants::ALLOW_REPLAY_KEYBOARD = 5
    Alembic::Enumerants::ALLOW_ASYNC_BOTH = 6
    Alembic::Enumerants::ALLOW_SYNC_BOTH = 7
    
    def allow_events (mode, time)
      s = 35.chr.encode('BINARY')
      s << [mode, time].pack("CL")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    def grab_server ()
      s = 36.chr.encode('BINARY')
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    def ungrab_server ()
      s = 37.chr.encode('BINARY')
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    QueryPointerReply = Struct.new(:same_screen, :root, :child, :root_x, :root_y, :win_x, :win_y, :mask)
    
    def query_pointer (window)
      s = 38.chr.encode('BINARY')
      s << [Window.to_xid(connection, window)].pack("x1L")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = QueryPointerReply.new
      x.same_screen, x.root, x.child, x.root_x, x.root_y, x.win_x, x.win_y, x.mask = s.slice!(0, 21).unpack("CLLssssSx2")
      x.same_screen = x.same_screen != 0
      x.root = Window[connection, x.root]
      x.child = Window[connection, x.child]
      x
    end
    
    class Window
      def query_pointer ()
        @conn.query_pointer(self)
      end
    end
    
    TIMECOORD = Struct.new(:time, :x, :y)
    
    def encode_timecoord (s, time, x, y)
      s << [time, x, y].pack("Lss")
      s
    end
    
    def decode_timecoord (s)
      x = TIMECOORD.new
      x.time, x.x, x.y = s.slice!(0, 8).unpack("Lss")
      x
    end
    
    GetMotionEventsReply = Struct.new(:events_len, :events)
    
    def get_motion_events (window, start, stop)
      s = 39.chr.encode('BINARY')
      s << [Window.to_xid(connection, window), start, stop].pack("x1LLL")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = GetMotionEventsReply.new
      x.events_len = s.slice!(0, 25).unpack("x1Lx20")
      x.events = x.events_len.times.map{decode_timecoord(s)}
      x
    end
    
    class Window
      def get_motion_events (start, stop)
        @conn.get_motion_events(self, start, stop)
      end
    end
    
    TranslateCoordinatesReply = Struct.new(:same_screen, :child, :dst_x, :dst_y)
    
    def translate_coordinates (src_window, dst_window, src_x, src_y)
      s = 40.chr.encode('BINARY')
      s << [Window.to_xid(connection, src_window), Window.to_xid(connection, dst_window), src_x, src_y].pack("x1LLss")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = TranslateCoordinatesReply.new
      x.same_screen, x.child, x.dst_x, x.dst_y = s.slice!(0, 9).unpack("CLss")
      x.same_screen = x.same_screen != 0
      x.child = Window[connection, x.child]
      x
    end
    
    class Window
      def translate_coordinates (src_window, src_x, src_y)
        @conn.translate_coordinates(src_window, self, src_x, src_y)
      end
    end
    
    def warp_pointer (src_window, dst_window, src_x, src_y, src_width, src_height, dst_x, dst_y)
      s = 41.chr.encode('BINARY')
      s << [Window.to_xid(connection, src_window), Window.to_xid(connection, dst_window), src_x, src_y, src_width, src_height, dst_x, dst_y].pack("x1LLssSSss")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    class Window
      def warp_pointer (src_window, src_x, src_y, src_width, src_height, dst_x, dst_y)
        @conn.warp_pointer(src_window, self, src_x, src_y, src_width, src_height, dst_x, dst_y)
      end
    end
    
    Alembic::Enumerants::INPUT_FOCUS_NONE = 0
    Alembic::Enumerants::INPUT_FOCUS_POINTER_ROOT = 1
    Alembic::Enumerants::INPUT_FOCUS_PARENT = 2
    Alembic::Enumerants::INPUT_FOCUS_FOLLOW_KEYBOARD = 3
    
    def set_input_focus (revert_to, focus, time)
      s = 42.chr.encode('BINARY')
      s << [revert_to, Window.to_xid(connection, focus), time].pack("CLL")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    class Window
      def set_input_focus (revert_to, time)
        @conn.set_input_focus(revert_to, self, time)
      end
    end
    
    GetInputFocusReply = Struct.new(:revert_to, :focus)
    
    def get_input_focus ()
      s = 43.chr.encode('BINARY')
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = GetInputFocusReply.new
      x.revert_to, x.focus = s.slice!(0, 5).unpack("CL")
      x.focus = Window[connection, x.focus]
      x
    end
    
    QueryKeymapReply = Struct.new(:keys)
    
    def query_keymap ()
      s = 44.chr.encode('BINARY')
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = QueryKeymapReply.new
      s.slice!(0, 1)
      x.keys = 32.times.map{s.slice!(0, 1).unpack("C")[0]}
      x
    end
    
    def open_font (fid, name)
      s = 45.chr.encode('BINARY')
      name_len = name.length
      s << [Font.to_xid(connection, fid), name_len, name].pack("x1LSx2A*")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    def close_font (font)
      s = 46.chr.encode('BINARY')
      s << [Font.to_xid(connection, font)].pack("x1L")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    Alembic::Enumerants::FONT_DRAW_LEFT_TO_RIGHT = 0
    Alembic::Enumerants::FONT_DRAW_RIGHT_TO_LEFT = 1
    
    FONTPROP = Struct.new(:name, :value)
    
    def encode_fontprop (s, name, value)
      s << [Atom.to_xid(connection, name), value].pack("LL")
      s
    end
    
    def decode_fontprop (s)
      x = FONTPROP.new
      x.name, x.value = s.slice!(0, 8).unpack("LL")
      x.name = Atom[connection, x.name]
      x
    end
    
    CHARINFO = Struct.new(:left_side_bearing, :right_side_bearing, :character_width, :ascent, :descent, :attributes)
    
    def encode_charinfo (s, left_side_bearing, right_side_bearing, character_width, ascent, descent, attributes)
      s << [left_side_bearing, right_side_bearing, character_width, ascent, descent, attributes].pack("sssssS")
      s
    end
    
    def decode_charinfo (s)
      x = CHARINFO.new
      x.left_side_bearing, x.right_side_bearing, x.character_width, x.ascent, x.descent, x.attributes = s.slice!(0, 12).unpack("sssssS")
      x
    end
    
    QueryFontReply = Struct.new(:min_bounds, :max_bounds, :min_char_or_byte2, :max_char_or_byte2, :default_char, :properties_len, :draw_direction, :min_byte1, :max_byte1, :all_chars_exist, :font_ascent, :font_descent, :char_infos_len, :properties, :char_infos)
    
    def query_font (font)
      s = 47.chr.encode('BINARY')
      s << [Fontable.to_xid(connection, font)].pack("x1L")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = QueryFontReply.new
      s.slice!(0, 1)
      x.min_bounds = decode_charinfo(s)
      s.slice!(0, 4)
      x.max_bounds = decode_charinfo(s)
      x.min_char_or_byte2, x.max_char_or_byte2, x.default_char, x.properties_len, x.draw_direction, x.min_byte1, x.max_byte1, x.all_chars_exist, x.font_ascent, x.font_descent, x.char_infos_len = s.slice!(0, 24).unpack("x4SSSSCCCCssL")
      x.all_chars_exist = x.all_chars_exist != 0
      x.properties = x.properties_len.times.map{decode_fontprop(s)}
      x.char_infos = x.char_infos_len.times.map{decode_charinfo(s)}
      x
    end
    
    QueryTextExtentsReply = Struct.new(:draw_direction, :font_ascent, :font_descent, :overall_ascent, :overall_descent, :overall_width, :overall_left, :overall_right)
    
    def query_text_extents (font, string)
      s = 48.chr.encode('BINARY')
      s << [(string_len&1) ? 1 : 0].pack("C")
      s << [Fontable.to_xid(connection, font)].pack("L")
      s << string.map{|x|encode_char2b(x)}
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = QueryTextExtentsReply.new
      x.draw_direction, x.font_ascent, x.font_descent, x.overall_ascent, x.overall_descent, x.overall_width, x.overall_left, x.overall_right = s.slice!(0, 21).unpack("Csssslll")
      x
    end
    
    STR = Struct.new(:name_len, :name)
    
    def encode_str (s, name)
      name_len = name.length
      s << [name_len, name].pack("CA*")
      s
    end
    
    def decode_str (s)
      x = STR.new
      x.name_len = s.slice!(0, 1).unpack("C")
      x.name = s.slice!(0, x.name_len)
      x
    end
    
    ListFontsReply = Struct.new(:names_len, :names)
    
    def list_fonts (max_names, pattern)
      s = 49.chr.encode('BINARY')
      pattern_len = pattern.length
      s << [max_names, pattern_len, pattern].pack("x1SSA*")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = ListFontsReply.new
      x.names_len = s.slice!(0, 25).unpack("x1Sx22")
      x.names = x.names_len.times.map{decode_str(s)}
      x
    end
    
    ListFontsWithInfoReply = Struct.new(:name_len, :min_bounds, :max_bounds, :min_char_or_byte2, :max_char_or_byte2, :default_char, :properties_len, :draw_direction, :min_byte1, :max_byte1, :all_chars_exist, :font_ascent, :font_descent, :replies_hint, :properties, :name)
    
    def list_fonts_with_info (max_names, pattern)
      s = 50.chr.encode('BINARY')
      pattern_len = pattern.length
      s << [max_names, pattern_len, pattern].pack("x1SSA*")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = ListFontsWithInfoReply.new
      x.name_len = s.slice!(0, 1).unpack("C")
      x.min_bounds = decode_charinfo(s)
      s.slice!(0, 4)
      x.max_bounds = decode_charinfo(s)
      x.min_char_or_byte2, x.max_char_or_byte2, x.default_char, x.properties_len, x.draw_direction, x.min_byte1, x.max_byte1, x.all_chars_exist, x.font_ascent, x.font_descent, x.replies_hint = s.slice!(0, 24).unpack("x4SSSSCCCCssL")
      x.all_chars_exist = x.all_chars_exist != 0
      x.properties = x.properties_len.times.map{decode_fontprop(s)}
      x.name = s.slice!(0, x.name_len)
      x
    end
    
    def set_font_path (font)
      s = 51.chr.encode('BINARY')
      font_qty = font.length
      s << [font_qty].pack("x1Sx2")
      s << font.map{|x|encode_str(x)}
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    GetFontPathReply = Struct.new(:path_len, :path)
    
    def get_font_path ()
      s = 52.chr.encode('BINARY')
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = GetFontPathReply.new
      x.path_len = s.slice!(0, 25).unpack("x1Sx22")
      x.path = x.path_len.times.map{decode_str(s)}
      x
    end
    
    def create_pixmap (depth, pid, drawable, width, height)
      s = 53.chr.encode('BINARY')
      s << [depth, Pixmap.to_xid(connection, pid), Drawable.to_xid(connection, drawable), width, height].pack("CLLSS")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    def free_pixmap (pixmap)
      s = 54.chr.encode('BINARY')
      s << [Pixmap.to_xid(connection, pixmap)].pack("x1L")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    Alembic::Enumerants::GC_FUNCTION = 1
    Alembic::Enumerants::GC_PLANE_MASK = 2
    Alembic::Enumerants::GC_FOREGROUND = 4
    Alembic::Enumerants::GC_BACKGROUND = 8
    Alembic::Enumerants::GC_LINE_WIDTH = 16
    Alembic::Enumerants::GC_LINE_STYLE = 32
    Alembic::Enumerants::GC_CAP_STYLE = 64
    Alembic::Enumerants::GC_JOIN_STYLE = 128
    Alembic::Enumerants::GC_FILL_STYLE = 256
    Alembic::Enumerants::GC_FILL_RULE = 512
    Alembic::Enumerants::GC_TILE = 1024
    Alembic::Enumerants::GC_STIPPLE = 2048
    Alembic::Enumerants::GC_TILE_STIPPLE_ORIGIN_X = 4096
    Alembic::Enumerants::GC_TILE_STIPPLE_ORIGIN_Y = 8192
    Alembic::Enumerants::GC_FONT = 16384
    Alembic::Enumerants::GC_SUBWINDOW_MODE = 32768
    Alembic::Enumerants::GC_GRAPHICS_EXPOSURES = 65536
    Alembic::Enumerants::GC_CLIP_ORIGIN_X = 131072
    Alembic::Enumerants::GC_CLIP_ORIGIN_Y = 262144
    Alembic::Enumerants::GC_CLIP_MASK = 524288
    Alembic::Enumerants::GC_DASH_OFFSET = 1048576
    Alembic::Enumerants::GC_DASH_LIST = 2097152
    Alembic::Enumerants::GC_ARC_MODE = 4194304
    
    Alembic::Enumerants::GX_CLEAR = 0
    Alembic::Enumerants::GX_AND = 1
    Alembic::Enumerants::GX_AND_REVERSE = 2
    Alembic::Enumerants::GX_COPY = 3
    Alembic::Enumerants::GX_AND_INVERTED = 4
    Alembic::Enumerants::GX_NOOP = 5
    Alembic::Enumerants::GX_XOR = 6
    Alembic::Enumerants::GX_OR = 7
    Alembic::Enumerants::GX_NOR = 8
    Alembic::Enumerants::GX_EQUIV = 9
    Alembic::Enumerants::GX_INVERT = 10
    Alembic::Enumerants::GX_OR_REVERSE = 11
    Alembic::Enumerants::GX_COPY_INVERTED = 12
    Alembic::Enumerants::GX_OR_INVERTED = 13
    Alembic::Enumerants::GX_NAND = 14
    Alembic::Enumerants::GX_SET = 15
    
    Alembic::Enumerants::LINE_STYLE_SOLID = 0
    Alembic::Enumerants::LINE_STYLE_ON_OFF_DASH = 1
    Alembic::Enumerants::LINE_STYLE_DOUBLE_DASH = 2
    
    Alembic::Enumerants::CAP_STYLE_NOT_LAST = 0
    Alembic::Enumerants::CAP_STYLE_BUTT = 1
    Alembic::Enumerants::CAP_STYLE_ROUND = 2
    Alembic::Enumerants::CAP_STYLE_PROJECTING = 3
    
    Alembic::Enumerants::JOIN_STYLE_MITER = 0
    Alembic::Enumerants::JOIN_STYLE_ROUND = 1
    Alembic::Enumerants::JOIN_STYLE_BEVEL = 2
    
    Alembic::Enumerants::FILL_STYLE_SOLID = 0
    Alembic::Enumerants::FILL_STYLE_TILED = 1
    Alembic::Enumerants::FILL_STYLE_STIPPLED = 2
    Alembic::Enumerants::FILL_STYLE_OPAQUE_STIPPLED = 3
    
    Alembic::Enumerants::FILL_RULE_EVEN_ODD = 0
    Alembic::Enumerants::FILL_RULE_WINDING = 1
    
    Alembic::Enumerants::SUBWINDOW_MODE_CLIP_BY_CHILDREN = 0
    Alembic::Enumerants::SUBWINDOW_MODE_INCLUDE_INFERIORS = 1
    
    Alembic::Enumerants::ARC_MODE_CHORD = 0
    Alembic::Enumerants::ARC_MODE_PIE_SLICE = 1
    
    def create_gc (cid, drawable, value_mask, *value_list)
      s = 55.chr.encode('BINARY')
      s << [Gcontext.to_xid(connection, cid), Drawable.to_xid(connection, drawable), value_mask, *value_list].pack("x1LLLL*")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    def change_gc (gc, value_mask, *value_list)
      s = 56.chr.encode('BINARY')
      s << [Gcontext.to_xid(connection, gc), value_mask, *value_list].pack("x1LLL*")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    def copy_gc (src_gc, dst_gc, value_mask)
      s = 57.chr.encode('BINARY')
      s << [Gcontext.to_xid(connection, src_gc), Gcontext.to_xid(connection, dst_gc), value_mask].pack("x1LLL")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    def set_dashes (gc, dash_offset, dashes)
      s = 58.chr.encode('BINARY')
      dashes_len = dashes.length
      s << [Gcontext.to_xid(connection, gc), dash_offset, dashes_len, *dashes].pack("x1LSSC*")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    Alembic::Enumerants::CLIP_ORDERING_UNSORTED = 0
    Alembic::Enumerants::CLIP_ORDERING_Y_SORTED = 1
    Alembic::Enumerants::CLIP_ORDERING_YX_SORTED = 2
    Alembic::Enumerants::CLIP_ORDERING_YX_BANDED = 3
    
    def set_clip_rectangles (ordering, gc, clip_x_origin, clip_y_origin, rectangles)
      s = 59.chr.encode('BINARY')
      s << [ordering, Gcontext.to_xid(connection, gc), clip_x_origin, clip_y_origin].pack("CLss")
      s << rectangles.map{|x|encode_rectangle(x)}
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    def free_gc (gc)
      s = 60.chr.encode('BINARY')
      s << [Gcontext.to_xid(connection, gc)].pack("x1L")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    def clear_area (exposures, window, x, y, width, height)
      s = 61.chr.encode('BINARY')
      s << [exposures ? 1 : 0, Window.to_xid(connection, window), x, y, width, height].pack("CLssSS")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    class Window
      def clear_area (exposures, x, y, width, height)
        @conn.clear_area(exposures, self, x, y, width, height)
      end
    end
    
    def copy_area (src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height)
      s = 62.chr.encode('BINARY')
      s << [Drawable.to_xid(connection, src_drawable), Drawable.to_xid(connection, dst_drawable), Gcontext.to_xid(connection, gc), src_x, src_y, dst_x, dst_y, width, height].pack("x1LLLssssSS")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    def copy_plane (src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height, bit_plane)
      s = 63.chr.encode('BINARY')
      s << [Drawable.to_xid(connection, src_drawable), Drawable.to_xid(connection, dst_drawable), Gcontext.to_xid(connection, gc), src_x, src_y, dst_x, dst_y, width, height, bit_plane].pack("x1LLLssssSSL")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    Alembic::Enumerants::COORD_MODE_ORIGIN = 0
    Alembic::Enumerants::COORD_MODE_PREVIOUS = 1
    
    def poly_point (coordinate_mode, drawable, gc, points)
      s = 64.chr.encode('BINARY')
      s << [coordinate_mode, Drawable.to_xid(connection, drawable), Gcontext.to_xid(connection, gc)].pack("CLL")
      s << points.map{|x|encode_point(x)}
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    def poly_line (coordinate_mode, drawable, gc, points)
      s = 65.chr.encode('BINARY')
      s << [coordinate_mode, Drawable.to_xid(connection, drawable), Gcontext.to_xid(connection, gc)].pack("CLL")
      s << points.map{|x|encode_point(x)}
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    SEGMENT = Struct.new(:x1, :y1, :x2, :y2)
    
    def encode_segment (s, x1, y1, x2, y2)
      s << [x1, y1, x2, y2].pack("ssss")
      s
    end
    
    def decode_segment (s)
      x = SEGMENT.new
      x.x1, x.y1, x.x2, x.y2 = s.slice!(0, 8).unpack("ssss")
      x
    end
    
    def poly_segment (drawable, gc, segments)
      s = 66.chr.encode('BINARY')
      s << [Drawable.to_xid(connection, drawable), Gcontext.to_xid(connection, gc)].pack("x1LL")
      s << segments.map{|x|encode_segment(x)}
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    def poly_rectangle (drawable, gc, rectangles)
      s = 67.chr.encode('BINARY')
      s << [Drawable.to_xid(connection, drawable), Gcontext.to_xid(connection, gc)].pack("x1LL")
      s << rectangles.map{|x|encode_rectangle(x)}
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    def poly_arc (drawable, gc, arcs)
      s = 68.chr.encode('BINARY')
      s << [Drawable.to_xid(connection, drawable), Gcontext.to_xid(connection, gc)].pack("x1LL")
      s << arcs.map{|x|encode_arc(x)}
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    Alembic::Enumerants::POLY_SHAPE_COMPLEX = 0
    Alembic::Enumerants::POLY_SHAPE_NONCONVEX = 1
    Alembic::Enumerants::POLY_SHAPE_CONVEX = 2
    
    def fill_poly (drawable, gc, shape, coordinate_mode, points)
      s = 69.chr.encode('BINARY')
      s << [Drawable.to_xid(connection, drawable), Gcontext.to_xid(connection, gc), shape, coordinate_mode].pack("x1LLCCx2")
      s << points.map{|x|encode_point(x)}
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    def poly_fill_rectangle (drawable, gc, rectangles)
      s = 70.chr.encode('BINARY')
      s << [Drawable.to_xid(connection, drawable), Gcontext.to_xid(connection, gc)].pack("x1LL")
      s << rectangles.map{|x|encode_rectangle(x)}
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    def poly_fill_arc (drawable, gc, arcs)
      s = 71.chr.encode('BINARY')
      s << [Drawable.to_xid(connection, drawable), Gcontext.to_xid(connection, gc)].pack("x1LL")
      s << arcs.map{|x|encode_arc(x)}
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    Alembic::Enumerants::IMAGE_FORMAT_XY_BITMAP = 0
    Alembic::Enumerants::IMAGE_FORMAT_XY_PIXMAP = 1
    Alembic::Enumerants::IMAGE_FORMAT_Z_PIXMAP = 2
    
    def put_image (format, drawable, gc, width, height, dst_x, dst_y, left_pad, depth, data)
      s = 72.chr.encode('BINARY')
      s << [format, Drawable.to_xid(connection, drawable), Gcontext.to_xid(connection, gc), width, height, dst_x, dst_y, left_pad, depth, data].pack("CLLSSssCCx2A*")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    GetImageReply = Struct.new(:depth, :visual, :data)
    
    def get_image (format, drawable, x, y, width, height, plane_mask)
      s = 73.chr.encode('BINARY')
      s << [format, Drawable.to_xid(connection, drawable), x, y, width, height, plane_mask].pack("CLssSSL")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = GetImageReply.new
      x.depth, x.visual = s.slice!(0, 25).unpack("CLx20")
      x.data = s.slice!(0, (x.length*4))
      x
    end
    
    def poly_text8 (drawable, gc, x, y, items)
      s = 74.chr.encode('BINARY')
      s << [Drawable.to_xid(connection, drawable), Gcontext.to_xid(connection, gc), x, y, items].pack("x1LLssA*")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    def poly_text16 (drawable, gc, x, y, items)
      s = 75.chr.encode('BINARY')
      s << [Drawable.to_xid(connection, drawable), Gcontext.to_xid(connection, gc), x, y, items].pack("x1LLssA*")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    def image_text8 (drawable, gc, x, y, string)
      s = 76.chr.encode('BINARY')
      string_len = string.length
      s << [string_len, Drawable.to_xid(connection, drawable), Gcontext.to_xid(connection, gc), x, y, string].pack("CLLssA*")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    def image_text16 (drawable, gc, x, y, string)
      s = 77.chr.encode('BINARY')
      string_len = string.length
      s << [string_len, Drawable.to_xid(connection, drawable), Gcontext.to_xid(connection, gc), x, y].pack("CLLss")
      s << string.map{|x|encode_char2b(x)}
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    Alembic::Enumerants::COLORMAP_ALLOC_NONE = 0
    Alembic::Enumerants::COLORMAP_ALLOC_ALL = 1
    
    def create_colormap (alloc, mid, window, visual)
      s = 78.chr.encode('BINARY')
      s << [alloc, Colormap.to_xid(connection, mid), Window.to_xid(connection, window), visual].pack("CLLL")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    def free_colormap (cmap)
      s = 79.chr.encode('BINARY')
      s << [Colormap.to_xid(connection, cmap)].pack("x1L")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    def copy_colormap_and_free (mid, src_cmap)
      s = 80.chr.encode('BINARY')
      s << [Colormap.to_xid(connection, mid), Colormap.to_xid(connection, src_cmap)].pack("x1LL")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    def install_colormap (cmap)
      s = 81.chr.encode('BINARY')
      s << [Colormap.to_xid(connection, cmap)].pack("x1L")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    def uninstall_colormap (cmap)
      s = 82.chr.encode('BINARY')
      s << [Colormap.to_xid(connection, cmap)].pack("x1L")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    ListInstalledColormapsReply = Struct.new(:cmaps_len, :cmaps)
    
    def list_installed_colormaps (window)
      s = 83.chr.encode('BINARY')
      s << [Window.to_xid(connection, window)].pack("x1L")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = ListInstalledColormapsReply.new
      x.cmaps_len, *x.cmaps = s.unpack("x1Sx22L*")
      x.cmaps = x.cmaps ? x.cmaps.map{|x|Colormap[connection, x]} : []
      x
    end
    
    AllocColorReply = Struct.new(:red, :green, :blue, :pixel)
    
    def alloc_color (cmap, red, green, blue)
      s = 84.chr.encode('BINARY')
      s << [Colormap.to_xid(connection, cmap), red, green, blue].pack("x1LSSSx2")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = AllocColorReply.new
      x.red, x.green, x.blue, x.pixel = s.slice!(0, 13).unpack("x1SSSx2L")
      x
    end
    
    AllocNamedColorReply = Struct.new(:pixel, :exact_red, :exact_green, :exact_blue, :visual_red, :visual_green, :visual_blue)
    
    def alloc_named_color (cmap, name)
      s = 85.chr.encode('BINARY')
      name_len = name.length
      s << [Colormap.to_xid(connection, cmap), name_len, name].pack("x1LSx2A*")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = AllocNamedColorReply.new
      x.pixel, x.exact_red, x.exact_green, x.exact_blue, x.visual_red, x.visual_green, x.visual_blue = s.slice!(0, 17).unpack("x1LSSSSSS")
      x
    end
    
    AllocColorCellsReply = Struct.new(:pixels_len, :masks_len, :pixels, :masks)
    
    def alloc_color_cells (contiguous, cmap, colors, planes)
      s = 86.chr.encode('BINARY')
      s << [contiguous ? 1 : 0, Colormap.to_xid(connection, cmap), colors, planes].pack("CLSS")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = AllocColorCellsReply.new
      x.pixels_len, x.masks_len = s.slice!(0, 25).unpack("x1SSx20")
      x.pixels = x.pixels_len.times.map{s.slice!(0, 4).unpack("L")[0]}
      *x.masks = s.unpack("L*")
      x
    end
    
    AllocColorPlanesReply = Struct.new(:pixels_len, :red_mask, :green_mask, :blue_mask, :pixels)
    
    def alloc_color_planes (contiguous, cmap, colors, reds, greens, blues)
      s = 87.chr.encode('BINARY')
      s << [contiguous ? 1 : 0, Colormap.to_xid(connection, cmap), colors, reds, greens, blues].pack("CLSSSS")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = AllocColorPlanesReply.new
      x.pixels_len, x.red_mask, x.green_mask, x.blue_mask, *x.pixels = s.unpack("x1Sx2LLLx8L*")
      x
    end
    
    def free_colors (cmap, plane_mask, pixels)
      s = 88.chr.encode('BINARY')
      s << [Colormap.to_xid(connection, cmap), plane_mask, *pixels].pack("x1LLL*")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    Alembic::Enumerants::COLOR_FLAG_RED = 1
    Alembic::Enumerants::COLOR_FLAG_GREEN = 2
    Alembic::Enumerants::COLOR_FLAG_BLUE = 4
    
    COLORITEM = Struct.new(:pixel, :red, :green, :blue, :flags)
    
    def encode_coloritem (s, pixel, red, green, blue, flags)
      s << [pixel, red, green, blue, flags].pack("LSSSCx1")
      s
    end
    
    def decode_coloritem (s)
      x = COLORITEM.new
      x.pixel, x.red, x.green, x.blue, x.flags = s.slice!(0, 12).unpack("LSSSCx1")
      x
    end
    
    def store_colors (cmap, items)
      s = 89.chr.encode('BINARY')
      s << [Colormap.to_xid(connection, cmap)].pack("x1L")
      s << items.map{|x|encode_coloritem(x)}
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    def store_named_color (flags, cmap, pixel, name)
      s = 90.chr.encode('BINARY')
      name_len = name.length
      s << [flags, Colormap.to_xid(connection, cmap), pixel, name_len, name].pack("CLLSx2A*")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    RGB = Struct.new(:red, :green, :blue)
    
    def encode_rgb (s, red, green, blue)
      s << [red, green, blue].pack("SSSx2")
      s
    end
    
    def decode_rgb (s)
      x = RGB.new
      x.red, x.green, x.blue = s.slice!(0, 8).unpack("SSSx2")
      x
    end
    
    QueryColorsReply = Struct.new(:colors_len, :colors)
    
    def query_colors (cmap, pixels)
      s = 91.chr.encode('BINARY')
      s << [Colormap.to_xid(connection, cmap), *pixels].pack("x1LL*")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = QueryColorsReply.new
      x.colors_len = s.slice!(0, 25).unpack("x1Sx22")
      x.colors = x.colors_len.times.map{decode_rgb(s)}
      x
    end
    
    LookupColorReply = Struct.new(:exact_red, :exact_green, :exact_blue, :visual_red, :visual_green, :visual_blue)
    
    def lookup_color (cmap, name)
      s = 92.chr.encode('BINARY')
      name_len = name.length
      s << [Colormap.to_xid(connection, cmap), name_len, name].pack("x1LSx2A*")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = LookupColorReply.new
      x.exact_red, x.exact_green, x.exact_blue, x.visual_red, x.visual_green, x.visual_blue = s.slice!(0, 13).unpack("x1SSSSSS")
      x
    end
    
    def create_cursor (cid, source, mask, fore_red, fore_green, fore_blue, back_red, back_green, back_blue, x, y)
      s = 93.chr.encode('BINARY')
      s << [Cursor.to_xid(connection, cid), Pixmap.to_xid(connection, source), Pixmap.to_xid(connection, mask), fore_red, fore_green, fore_blue, back_red, back_green, back_blue, x, y].pack("x1LLLSSSSSSSS")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    def create_glyph_cursor (cid, source_font, mask_font, source_char, mask_char, fore_red, fore_green, fore_blue, back_red, back_green, back_blue)
      s = 94.chr.encode('BINARY')
      s << [Cursor.to_xid(connection, cid), Font.to_xid(connection, source_font), Font.to_xid(connection, mask_font), source_char, mask_char, fore_red, fore_green, fore_blue, back_red, back_green, back_blue].pack("x1LLLSSSSSSSS")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    def free_cursor (cursor)
      s = 95.chr.encode('BINARY')
      s << [Cursor.to_xid(connection, cursor)].pack("x1L")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    def recolor_cursor (cursor, fore_red, fore_green, fore_blue, back_red, back_green, back_blue)
      s = 96.chr.encode('BINARY')
      s << [Cursor.to_xid(connection, cursor), fore_red, fore_green, fore_blue, back_red, back_green, back_blue].pack("x1LSSSSSS")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    Alembic::Enumerants::QUERY_SHAPE_OF_LARGEST_CURSOR = 0
    Alembic::Enumerants::QUERY_SHAPE_OF_FASTEST_TILE = 1
    Alembic::Enumerants::QUERY_SHAPE_OF_FASTEST_STIPPLE = 2
    
    QueryBestSizeReply = Struct.new(:width, :height)
    
    def query_best_size (klass, drawable, width, height)
      s = 97.chr.encode('BINARY')
      s << [klass, Drawable.to_xid(connection, drawable), width, height].pack("CLSS")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = QueryBestSizeReply.new
      x.width, x.height = s.slice!(0, 5).unpack("x1SS")
      x
    end
    
    QueryExtensionReply = Struct.new(:present, :major_opcode, :first_event, :first_error)
    
    def query_extension (name)
      s = 98.chr.encode('BINARY')
      name_len = name.length
      s << [name_len, name].pack("x1Sx2A*")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = QueryExtensionReply.new
      x.present, x.major_opcode, x.first_event, x.first_error = s.slice!(0, 5).unpack("x1CCCC")
      x.present = x.present != 0
      x
    end
    
    ListExtensionsReply = Struct.new(:names_len, :names)
    
    def list_extensions ()
      s = 99.chr.encode('BINARY')
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = ListExtensionsReply.new
      x.names_len = s.slice!(0, 25).unpack("Cx24")
      x.names = x.names_len.times.map{decode_str(s)}
      x
    end
    
    def change_keyboard_mapping (keycode_count, first_keycode, keysyms_per_keycode, keysyms)
      s = 100.chr.encode('BINARY')
      s << [keycode_count, first_keycode, keysyms_per_keycode, *keysyms].pack("CCCx2L*")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    GetKeyboardMappingReply = Struct.new(:keysyms_per_keycode, :keysyms)
    
    def get_keyboard_mapping (first_keycode, count)
      s = 101.chr.encode('BINARY')
      s << [first_keycode, count].pack("x1CC")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = GetKeyboardMappingReply.new
      x.keysyms_per_keycode, *x.keysyms = s.unpack("Cx24L*")
      x
    end
    
    Alembic::Enumerants::KB_KEY_CLICK_PERCENT = 1
    Alembic::Enumerants::KB_BELL_PERCENT = 2
    Alembic::Enumerants::KB_BELL_PITCH = 4
    Alembic::Enumerants::KB_BELL_DURATION = 8
    Alembic::Enumerants::KB_LED = 16
    Alembic::Enumerants::KB_LED_MODE = 32
    Alembic::Enumerants::KB_KEY = 64
    Alembic::Enumerants::KB_AUTO_REPEAT_MODE = 128
    
    Alembic::Enumerants::LED_MODE_OFF = 0
    Alembic::Enumerants::LED_MODE_ON = 1
    
    Alembic::Enumerants::AUTO_REPEAT_MODE_OFF = 0
    Alembic::Enumerants::AUTO_REPEAT_MODE_ON = 1
    Alembic::Enumerants::AUTO_REPEAT_MODE_DEFAULT = 2
    
    def change_keyboard_control (value_mask, *value_list)
      s = 102.chr.encode('BINARY')
      s << [value_mask, *value_list].pack("x1LL*")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    GetKeyboardControlReply = Struct.new(:global_auto_repeat, :led_mask, :key_click_percent, :bell_percent, :bell_pitch, :bell_duration, :auto_repeats)
    
    def get_keyboard_control ()
      s = 103.chr.encode('BINARY')
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = GetKeyboardControlReply.new
      x.global_auto_repeat, x.led_mask, x.key_click_percent, x.bell_percent, x.bell_pitch, x.bell_duration = s.slice!(0, 13).unpack("CLCCSSx2")
      x.auto_repeats = 32.times.map{s.slice!(0, 1).unpack("C")[0]}
      x
    end
    
    def bell (percent)
      s = 104.chr.encode('BINARY')
      s << [percent].pack("c")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    def change_pointer_control (acceleration_numerator, acceleration_denominator, threshold, do_acceleration, do_threshold)
      s = 105.chr.encode('BINARY')
      s << [acceleration_numerator, acceleration_denominator, threshold, do_acceleration ? 1 : 0, do_threshold ? 1 : 0].pack("x1sssCC")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    GetPointerControlReply = Struct.new(:acceleration_numerator, :acceleration_denominator, :threshold)
    
    def get_pointer_control ()
      s = 106.chr.encode('BINARY')
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = GetPointerControlReply.new
      x.acceleration_numerator, x.acceleration_denominator, x.threshold = s.slice!(0, 25).unpack("x1SSSx18")
      x
    end
    
    Alembic::Enumerants::BLANKING_NOT_PREFERRED = 0
    Alembic::Enumerants::BLANKING_PREFERRED = 1
    Alembic::Enumerants::BLANKING_DEFAULT = 2
    
    Alembic::Enumerants::EXPOSURES_NOT_ALLOWED = 0
    Alembic::Enumerants::EXPOSURES_ALLOWED = 1
    Alembic::Enumerants::EXPOSURES_DEFAULT = 2
    
    def set_screen_saver (timeout, interval, prefer_blanking, allow_exposures)
      s = 107.chr.encode('BINARY')
      s << [timeout, interval, prefer_blanking, allow_exposures].pack("x1ssCC")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    GetScreenSaverReply = Struct.new(:timeout, :interval, :prefer_blanking, :allow_exposures)
    
    def get_screen_saver ()
      s = 108.chr.encode('BINARY')
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = GetScreenSaverReply.new
      x.timeout, x.interval, x.prefer_blanking, x.allow_exposures = s.slice!(0, 25).unpack("x1SSCCx18")
      x
    end
    
    Alembic::Enumerants::HOST_MODE_INSERT = 0
    Alembic::Enumerants::HOST_MODE_DELETE = 1
    
    Alembic::Enumerants::FAMILY_INTERNET = 0
    Alembic::Enumerants::FAMILY_DE_CNET = 1
    Alembic::Enumerants::FAMILY_CHAOS = 2
    Alembic::Enumerants::FAMILY_SERVER_INTERPRETED = 5
    Alembic::Enumerants::FAMILY_INTERNET6 = 6
    
    def change_hosts (mode, family, address)
      s = 109.chr.encode('BINARY')
      address_len = address.length
      s << [mode, family, address_len, address].pack("CCx1SA*")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    HOST = Struct.new(:family, :address_len, :address)
    
    def encode_host (s, family, address)
      address_len = address.length
      s << [family, address_len, address].pack("Cx1SA*")
      s
    end
    
    def decode_host (s)
      x = HOST.new
      x.family, x.address_len = s.slice!(0, 4).unpack("Cx1S")
      x.address = s.slice!(0, x.address_len)
      x
    end
    
    ListHostsReply = Struct.new(:mode, :hosts_len, :hosts)
    
    def list_hosts ()
      s = 110.chr.encode('BINARY')
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = ListHostsReply.new
      x.mode, x.hosts_len = s.slice!(0, 25).unpack("CSx22")
      x.hosts = x.hosts_len.times.map{decode_host(s)}
      x
    end
    
    Alembic::Enumerants::ACCESS_CONTROL_DISABLE = 0
    Alembic::Enumerants::ACCESS_CONTROL_ENABLE = 1
    
    def set_access_control (mode)
      s = 111.chr.encode('BINARY')
      s << [mode].pack("C")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    Alembic::Enumerants::CLOSE_DOWN_DESTROY_ALL = 0
    Alembic::Enumerants::CLOSE_DOWN_RETAIN_PERMANENT = 1
    Alembic::Enumerants::CLOSE_DOWN_RETAIN_TEMPORARY = 2
    
    def set_close_down_mode (mode)
      s = 112.chr.encode('BINARY')
      s << [mode].pack("C")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    Alembic::Enumerants::KILL_ALL_TEMPORARY = 0
    
    def kill_client (resource)
      s = 113.chr.encode('BINARY')
      s << [resource].pack("x1L")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    def rotate_properties (window, delta, atoms)
      s = 114.chr.encode('BINARY')
      atoms_len = atoms.length
      s << [Window.to_xid(connection, window), atoms_len, delta, *atoms].pack("x1LSsL*")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    Alembic::Enumerants::SCREEN_SAVER_RESET = 0
    Alembic::Enumerants::SCREEN_SAVER_ACTIVE = 1
    
    def force_screen_saver (mode)
      s = 115.chr.encode('BINARY')
      s << [mode].pack("C")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
    Alembic::Enumerants::MAPPING_STATUS_SUCCESS = 0
    Alembic::Enumerants::MAPPING_STATUS_BUSY = 1
    Alembic::Enumerants::MAPPING_STATUS_FAILURE = 2
    
    SetPointerMappingReply = Struct.new(:status)
    
    def set_pointer_mapping (map)
      s = 116.chr.encode('BINARY')
      map_len = map.length
      s << [map_len, *map].pack("CC*")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = SetPointerMappingReply.new
      x.status = s.slice!(0, 1).unpack("C")
      x
    end
    
    GetPointerMappingReply = Struct.new(:map_len, :map)
    
    def get_pointer_mapping ()
      s = 117.chr.encode('BINARY')
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = GetPointerMappingReply.new
      x.map_len = s.slice!(0, 25).unpack("Cx24")
      x.map = x.map_len.times.map{s.slice!(0, 1).unpack("C")[0]}
      x
    end
    
    Alembic::Enumerants::MAP_INDEX_SHIFT = 0
    Alembic::Enumerants::MAP_INDEX_LOCK = 1
    Alembic::Enumerants::MAP_INDEX_CONTROL = 2
    Alembic::Enumerants::MAP_INDEX_1 = 3
    Alembic::Enumerants::MAP_INDEX_2 = 4
    Alembic::Enumerants::MAP_INDEX_3 = 5
    Alembic::Enumerants::MAP_INDEX_4 = 6
    Alembic::Enumerants::MAP_INDEX_5 = 7
    
    SetModifierMappingReply = Struct.new(:status)
    
    def set_modifier_mapping (keycodes_per_modifier, keycodes)
      s = 118.chr.encode('BINARY')
      s << [keycodes_per_modifier, *keycodes].pack("CC*")
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = SetModifierMappingReply.new
      x.status = s.slice!(0, 1).unpack("C")
      x
    end
    
    GetModifierMappingReply = Struct.new(:keycodes_per_modifier, :keycodes)
    
    def get_modifier_mapping ()
      s = 119.chr.encode('BINARY')
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
      s = read_reply(connection.seq)
      x = GetModifierMappingReply.new
      x.keycodes_per_modifier = s.slice!(0, 25).unpack("Cx24")
      x.keycodes = (x.keycodes_per_modifier*8).times.map{s.slice!(0, 1).unpack("C")[0]}
      x
    end
    
    def no_operation ()
      s = 127.chr.encode('BINARY')
      s << ' ' * (-(s.length + 2) & 3)
      s[2, 0] = [(s.length + 2) / 4].pack('S')
      write(s)
      connection.seq += 1
    end
    
  end
end
