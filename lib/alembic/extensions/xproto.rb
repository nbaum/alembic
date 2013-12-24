module Alembic
  module Extensions
    module Xproto
      extend Alembic::ExtensionMethods
      
      extension_xname nil
      
      module Methods
      end
      
      CHAR2B = Struct.new(:byte1, :byte2)
      
      module Methods
        def encode_char2b (s, byte1, byte2)
          s << [byte1, byte2].pack("CC")
          s
        end
      end
      
      module Methods
        def decode_char2b (s)
          x = CHAR2B.new
          x.byte1, x.byte2, = s.slice!(0, 2).unpack("CC")
          x
        end
      end
      
      Drawable = Class.new(Resource)
      
      module Methods
        def alloc_drawable ()
          Drawable.new(self, alloc_xid)
        end
      end
      Window = Class.new(Drawable)
      
      module Methods
        def alloc_window ()
          Window.new(self, alloc_xid)
        end
      end
      Pixmap = Class.new(Drawable)
      
      module Methods
        def alloc_pixmap ()
          Pixmap.new(self, alloc_xid)
        end
      end
      Cursor = Class.new(Resource)
      
      module Methods
        def alloc_cursor ()
          Cursor.new(self, alloc_xid)
        end
      end
      Fontable = Class.new(Resource)
      
      module Methods
        def alloc_fontable ()
          Fontable.new(self, alloc_xid)
        end
      end
      Font = Class.new(Fontable)
      
      module Methods
        def alloc_font ()
          Font.new(self, alloc_xid)
        end
      end
      Gcontext = Class.new(Fontable)
      
      module Methods
        def alloc_gcontext ()
          Gcontext.new(self, alloc_xid)
        end
      end
      Colormap = Class.new(Resource)
      
      module Methods
        def alloc_colormap ()
          Colormap.new(self, alloc_xid)
        end
      end
      Atom = Class.new(Resource)
      
      module Methods
        def alloc_atom ()
          Atom.new(self, alloc_xid)
        end
      end
      POINT = Struct.new(:x, :y)
      
      module Methods
        def encode_point (s, x, y)
          s << [x, y].pack("ss")
          s
        end
      end
      
      module Methods
        def decode_point (s)
          x = POINT.new
          x.x, x.y, = s.slice!(0, 4).unpack("ss")
          x
        end
      end
      
      RECTANGLE = Struct.new(:x, :y, :width, :height)
      
      module Methods
        def encode_rectangle (s, x, y, width, height)
          s << [x, y, width, height].pack("ssSS")
          s
        end
      end
      
      module Methods
        def decode_rectangle (s)
          x = RECTANGLE.new
          x.x, x.y, x.width, x.height, = s.slice!(0, 8).unpack("ssSS")
          x
        end
      end
      
      ARC = Struct.new(:x, :y, :width, :height, :angle1, :angle2)
      
      module Methods
        def encode_arc (s, x, y, width, height, angle1, angle2)
          s << [x, y, width, height, angle1, angle2].pack("ssSSss")
          s
        end
      end
      
      module Methods
        def decode_arc (s)
          x = ARC.new
          x.x, x.y, x.width, x.height, x.angle1, x.angle2, = s.slice!(0, 12).unpack("ssSSss")
          x
        end
      end
      
      FORMAT = Struct.new(:depth, :bits_per_pixel, :scanline_pad)
      
      module Methods
        def encode_format (s, depth, bits_per_pixel, scanline_pad)
          s << [depth, bits_per_pixel, scanline_pad].pack("CCCx5")
          s
        end
      end
      
      module Methods
        def decode_format (s)
          x = FORMAT.new
          x.depth, x.bits_per_pixel, x.scanline_pad, = s.slice!(0, 8).unpack("CCCx5")
          x
        end
      end
      
      VISUAL_CLASS = {:static_gray=>0, :gray_scale=>1, :static_color=>2, :pseudo_color=>3, :true_color=>4, :direct_color=>5}
      VISUAL_CLASS_I = {0=>:static_gray, 1=>:gray_scale, 2=>:static_color, 3=>:pseudo_color, 4=>:true_color, 5=>:direct_color}
      
      VISUAL_CLASS_STATIC_GRAY = 0
      VISUAL_CLASS_GRAY_SCALE = 1
      VISUAL_CLASS_STATIC_COLOR = 2
      VISUAL_CLASS_PSEUDO_COLOR = 3
      VISUAL_CLASS_TRUE_COLOR = 4
      VISUAL_CLASS_DIRECT_COLOR = 5
      
      VISUAL_CLASS.extend Alembic::ValueParamHelper
      
      VISUALTYPE = Struct.new(:visual_id, :klass, :bits_per_rgb_value, :colormap_entries, :red_mask, :green_mask, :blue_mask)
      
      module Methods
        def encode_visualtype (s, visual_id, klass, bits_per_rgb_value, colormap_entries, red_mask, green_mask, blue_mask)
          s << [visual_id, klass, bits_per_rgb_value, colormap_entries, red_mask, green_mask, blue_mask].pack("LCCSLLLx4")
          s
        end
      end
      
      module Methods
        def decode_visualtype (s)
          x = VISUALTYPE.new
          x.visual_id, x.klass, x.bits_per_rgb_value, x.colormap_entries, x.red_mask, x.green_mask, x.blue_mask, = s.slice!(0, 24).unpack("LCCSLLLx4")
          x
        end
      end
      
      DEPTH = Struct.new(:depth, :visuals_len, :visuals)
      
      module Methods
        def encode_depth (s, depth, visuals)
          visuals_len = visuals.length
          s << [depth, visuals_len].pack("Cx1Sx4")
          s << visuals.map{|x|encode_visualtype(x)}
          s
        end
      end
      
      module Methods
        def decode_depth (s)
          x = DEPTH.new
          x.depth, x.visuals_len, = s.slice!(0, 8).unpack("Cx1Sx4")
          x.visuals = x.visuals_len.times.map{decode_visualtype(s)}
          x
        end
      end
      
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
      
      EVENT_MASK.extend Alembic::ValueParamHelper
      
      BACKING_STORE = {:not_useful=>0, :when_mapped=>1, :always=>2}
      BACKING_STORE_I = {0=>:not_useful, 1=>:when_mapped, 2=>:always}
      
      BACKING_STORE_NOT_USEFUL = 0
      BACKING_STORE_WHEN_MAPPED = 1
      BACKING_STORE_ALWAYS = 2
      
      BACKING_STORE.extend Alembic::ValueParamHelper
      
      SCREEN = Struct.new(:root, :default_colormap, :white_pixel, :black_pixel, :current_input_masks, :width_in_pixels, :height_in_pixels, :width_in_millimeters, :height_in_millimeters, :min_installed_maps, :max_installed_maps, :root_visual, :backing_stores, :save_unders, :root_depth, :allowed_depths_len, :allowed_depths)
      
      module Methods
        def encode_screen (s, root, default_colormap, white_pixel, black_pixel, current_input_masks, width_in_pixels, height_in_pixels, width_in_millimeters, height_in_millimeters, min_installed_maps, max_installed_maps, root_visual, backing_stores, save_unders, root_depth, allowed_depths)
          allowed_depths_len = allowed_depths.length
          s << [Window.to_xid(self, root), Colormap.to_xid(self, default_colormap), white_pixel, black_pixel, current_input_masks, width_in_pixels, height_in_pixels, width_in_millimeters, height_in_millimeters, min_installed_maps, max_installed_maps, root_visual, backing_stores, save_unders ? 1 : 0, root_depth, allowed_depths_len].pack("LLLLLSSSSSSLCCCC")
          s << allowed_depths.map{|x|encode_depth(x)}
          s
        end
      end
      
      module Methods
        def decode_screen (s)
          x = SCREEN.new
          x.root, x.default_colormap, x.white_pixel, x.black_pixel, x.current_input_masks, x.width_in_pixels, x.height_in_pixels, x.width_in_millimeters, x.height_in_millimeters, x.min_installed_maps, x.max_installed_maps, x.root_visual, x.backing_stores, x.save_unders, x.root_depth, x.allowed_depths_len, = s.slice!(0, 40).unpack("LLLLLSSSSSSLCCCC")
          x.root = Window[self, x.root]
          x.default_colormap = Colormap[self, x.default_colormap]
          x.save_unders = x.save_unders != 0
          x.allowed_depths = x.allowed_depths_len.times.map{decode_depth(s)}
          x
        end
      end
      
      SetupRequest = Struct.new(:byte_order, :protocol_major_version, :protocol_minor_version, :authorization_protocol_name_len, :authorization_protocol_data_len, :authorization_protocol_name, :authorization_protocol_data)
      
      module Methods
        def encode_setup_request (s, byte_order, protocol_major_version, protocol_minor_version, authorization_protocol_name, authorization_protocol_data)
          authorization_protocol_name_len = authorization_protocol_name.length
          authorization_protocol_data_len = authorization_protocol_data.length
          s << [byte_order, protocol_major_version, protocol_minor_version, authorization_protocol_name_len, authorization_protocol_data_len, pad(authorization_protocol_name), pad(authorization_protocol_data)].pack("Cx1SSSSx2A*A*")
          s
        end
      end
      
      module Methods
        def decode_setup_request (s)
          x = SetupRequest.new
          x.byte_order, x.protocol_major_version, x.protocol_minor_version, x.authorization_protocol_name_len, x.authorization_protocol_data_len, = s.slice!(0, 12).unpack("Cx1SSSSx2")
          x.authorization_protocol_name = s.slice!(0, x.authorization_protocol_name_len)
          x.authorization_protocol_data = s.slice!(0, x.authorization_protocol_data_len)
          x
        end
      end
      
      SetupFailed = Struct.new(:status, :reason_len, :protocol_major_version, :protocol_minor_version, :length, :reason)
      
      module Methods
        def encode_setup_failed (s, status, protocol_major_version, protocol_minor_version, length, reason)
          reason_len = reason.length
          s << [status, reason_len, protocol_major_version, protocol_minor_version, length, pad(reason)].pack("CCSSSA*")
          s
        end
      end
      
      module Methods
        def decode_setup_failed (s)
          x = SetupFailed.new
          x.status, x.reason_len, x.protocol_major_version, x.protocol_minor_version, x.length, = s.slice!(0, 8).unpack("CCSSS")
          x.reason = s.slice!(0, x.reason_len)
          x
        end
      end
      
      SetupAuthenticate = Struct.new(:status, :length, :reason)
      
      module Methods
        def encode_setup_authenticate (s, status, length, reason)
          s << [status, length, pad(reason)].pack("Cx5SA*")
          s
        end
      end
      
      module Methods
        def decode_setup_authenticate (s)
          x = SetupAuthenticate.new
          x.status, x.length, = s.slice!(0, 8).unpack("Cx5S")
          x.reason = s.slice!(0, (x.length * 4))
          x
        end
      end
      
      IMAGE_ORDER = {:lsb_first=>0, :msb_first=>1}
      IMAGE_ORDER_I = {0=>:lsb_first, 1=>:msb_first}
      
      IMAGE_ORDER_LSB_FIRST = 0
      IMAGE_ORDER_MSB_FIRST = 1
      
      IMAGE_ORDER.extend Alembic::ValueParamHelper
      
      Setup = Struct.new(:status, :protocol_major_version, :protocol_minor_version, :length, :release_number, :resource_id_base, :resource_id_mask, :motion_buffer_size, :vendor_len, :maximum_request_length, :roots_len, :pixmap_formats_len, :image_byte_order, :bitmap_format_bit_order, :bitmap_format_scanline_unit, :bitmap_format_scanline_pad, :min_keycode, :max_keycode, :vendor, :pixmap_formats, :roots)
      
      module Methods
        def encode_setup (s, status, protocol_major_version, protocol_minor_version, length, release_number, resource_id_base, resource_id_mask, motion_buffer_size, maximum_request_length, image_byte_order, bitmap_format_bit_order, bitmap_format_scanline_unit, bitmap_format_scanline_pad, min_keycode, max_keycode, vendor, pixmap_formats, roots)
          vendor_len = vendor.length
          pixmap_formats_len = pixmap_formats.length
          roots_len = roots.length
          s << [status, protocol_major_version, protocol_minor_version, length, release_number, resource_id_base, resource_id_mask, motion_buffer_size, vendor_len, maximum_request_length, roots_len, pixmap_formats_len, image_byte_order, bitmap_format_bit_order, bitmap_format_scanline_unit, bitmap_format_scanline_pad, min_keycode, max_keycode, pad(vendor)].pack("Cx1SSSLLLLSSCCCCCCCCx4A*")
          s << pixmap_formats.map{|x|encode_format(x)}
          s << roots.map{|x|encode_screen(x)}
          s
        end
      end
      
      module Methods
        def decode_setup (s)
          x = Setup.new
          x.status, x.protocol_major_version, x.protocol_minor_version, x.length, x.release_number, x.resource_id_base, x.resource_id_mask, x.motion_buffer_size, x.vendor_len, x.maximum_request_length, x.roots_len, x.pixmap_formats_len, x.image_byte_order, x.bitmap_format_bit_order, x.bitmap_format_scanline_unit, x.bitmap_format_scanline_pad, x.min_keycode, x.max_keycode, = s.slice!(0, 40).unpack("Cx1SSSLLLLSSCCCCCCCCx4")
          x.vendor = s.slice!(0, x.vendor_len)
          x.pixmap_formats = x.pixmap_formats_len.times.map{decode_format(s)}
          x.roots = x.roots_len.times.map{decode_screen(s)}
          x
        end
      end
      
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
      
      MOD_MASK.extend Alembic::ValueParamHelper
      
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
      
      KEY_BUT_MASK.extend Alembic::ValueParamHelper
      
      WINDOW = {:none=>0}
      WINDOW_I = {0=>:none}
      
      WINDOW_NONE = 0
      
      WINDOW.extend Alembic::ValueParamHelper
      
      KeyPressEvent = Struct.new(:detail, :time, :root, :event, :child, :root_x, :root_y, :event_x, :event_y, :state, :same_screen, :synthetic)
      
      define_event 2, :key_press_event, false
      
      module Methods
        def encode_key_press_event (detail, time, root, event, child, root_x, root_y, event_x, event_y, state, same_screen)
          s = 2.chr.encode('BINARY')
          s << [detail, time, Window.to_xid(self, root), Window.to_xid(self, event), Window.to_xid(self, child), root_x, root_y, event_x, event_y, state, same_screen ? 1 : 0].pack("CLLLLssssSCx1")
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
      end
      
      module Methods
        def decode_key_press_event (s)
          x = KeyPressEvent.new
          x.detail, x.time, x.root, x.event, x.child, x.root_x, x.root_y, x.event_x, x.event_y, x.state, x.same_screen, x.synthetic, = s.slice!(0, 30).unpack("CLLLLssssSCx1C")
          x.root = Window[self, x.root]
          x.event = Window[self, x.event]
          x.child = Window[self, x.child]
          x.same_screen = x.same_screen != 0
          x.synthetic = x.synthetic != 0
          x
        end
      end
      
      KeyReleaseEvent = Struct.new(:detail, :time, :root, :event, :child, :root_x, :root_y, :event_x, :event_y, :state, :same_screen, :synthetic)
      
      define_event 3, :key_release_event, false
      
      module Methods
        def encode_key_release_event (detail, time, root, event, child, root_x, root_y, event_x, event_y, state, same_screen)
          s = 3.chr.encode('BINARY')
          s << [detail, time, Window.to_xid(self, root), Window.to_xid(self, event), Window.to_xid(self, child), root_x, root_y, event_x, event_y, state, same_screen ? 1 : 0].pack("CLLLLssssSCx1")
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
      end
      
      module Methods
        def decode_key_release_event (s)
          x = KeyReleaseEvent.new
          x.detail, x.time, x.root, x.event, x.child, x.root_x, x.root_y, x.event_x, x.event_y, x.state, x.same_screen, x.synthetic, = s.slice!(0, 30).unpack("CLLLLssssSCx1C")
          x.root = Window[self, x.root]
          x.event = Window[self, x.event]
          x.child = Window[self, x.child]
          x.same_screen = x.same_screen != 0
          x.synthetic = x.synthetic != 0
          x
        end
      end
      
      BUTTON_MASK = {:"1"=>256, :"2"=>512, :"3"=>1024, :"4"=>2048, :"5"=>4096, :any=>32768}
      BUTTON_MASK_I = {256=>:"1", 512=>:"2", 1024=>:"3", 2048=>:"4", 4096=>:"5", 32768=>:any}
      
      BUTTON_MASK_1 = 256
      BUTTON_MASK_2 = 512
      BUTTON_MASK_3 = 1024
      BUTTON_MASK_4 = 2048
      BUTTON_MASK_5 = 4096
      BUTTON_MASK_ANY = 32768
      
      BUTTON_MASK.extend Alembic::ValueParamHelper
      
      ButtonPressEvent = Struct.new(:detail, :time, :root, :event, :child, :root_x, :root_y, :event_x, :event_y, :state, :same_screen, :synthetic)
      
      define_event 4, :button_press_event, false
      
      module Methods
        def encode_button_press_event (detail, time, root, event, child, root_x, root_y, event_x, event_y, state, same_screen)
          s = 4.chr.encode('BINARY')
          s << [detail, time, Window.to_xid(self, root), Window.to_xid(self, event), Window.to_xid(self, child), root_x, root_y, event_x, event_y, state, same_screen ? 1 : 0].pack("CLLLLssssSCx1")
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
      end
      
      module Methods
        def decode_button_press_event (s)
          x = ButtonPressEvent.new
          x.detail, x.time, x.root, x.event, x.child, x.root_x, x.root_y, x.event_x, x.event_y, x.state, x.same_screen, x.synthetic, = s.slice!(0, 30).unpack("CLLLLssssSCx1C")
          x.root = Window[self, x.root]
          x.event = Window[self, x.event]
          x.child = Window[self, x.child]
          x.same_screen = x.same_screen != 0
          x.synthetic = x.synthetic != 0
          x
        end
      end
      
      ButtonReleaseEvent = Struct.new(:detail, :time, :root, :event, :child, :root_x, :root_y, :event_x, :event_y, :state, :same_screen, :synthetic)
      
      define_event 5, :button_release_event, false
      
      module Methods
        def encode_button_release_event (detail, time, root, event, child, root_x, root_y, event_x, event_y, state, same_screen)
          s = 5.chr.encode('BINARY')
          s << [detail, time, Window.to_xid(self, root), Window.to_xid(self, event), Window.to_xid(self, child), root_x, root_y, event_x, event_y, state, same_screen ? 1 : 0].pack("CLLLLssssSCx1")
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
      end
      
      module Methods
        def decode_button_release_event (s)
          x = ButtonReleaseEvent.new
          x.detail, x.time, x.root, x.event, x.child, x.root_x, x.root_y, x.event_x, x.event_y, x.state, x.same_screen, x.synthetic, = s.slice!(0, 30).unpack("CLLLLssssSCx1C")
          x.root = Window[self, x.root]
          x.event = Window[self, x.event]
          x.child = Window[self, x.child]
          x.same_screen = x.same_screen != 0
          x.synthetic = x.synthetic != 0
          x
        end
      end
      
      MOTION = {:normal=>0, :hint=>1}
      MOTION_I = {0=>:normal, 1=>:hint}
      
      MOTION_NORMAL = 0
      MOTION_HINT = 1
      
      MOTION.extend Alembic::ValueParamHelper
      
      MotionNotifyEvent = Struct.new(:detail, :time, :root, :event, :child, :root_x, :root_y, :event_x, :event_y, :state, :same_screen, :synthetic)
      
      define_event 6, :motion_notify_event, false
      
      module Methods
        def encode_motion_notify_event (detail, time, root, event, child, root_x, root_y, event_x, event_y, state, same_screen)
          s = 6.chr.encode('BINARY')
          s << [detail, time, Window.to_xid(self, root), Window.to_xid(self, event), Window.to_xid(self, child), root_x, root_y, event_x, event_y, state, same_screen ? 1 : 0].pack("CLLLLssssSCx1")
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
      end
      
      module Methods
        def decode_motion_notify_event (s)
          x = MotionNotifyEvent.new
          x.detail, x.time, x.root, x.event, x.child, x.root_x, x.root_y, x.event_x, x.event_y, x.state, x.same_screen, x.synthetic, = s.slice!(0, 30).unpack("CLLLLssssSCx1C")
          x.root = Window[self, x.root]
          x.event = Window[self, x.event]
          x.child = Window[self, x.child]
          x.same_screen = x.same_screen != 0
          x.synthetic = x.synthetic != 0
          x
        end
      end
      
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
      
      NOTIFY_DETAIL.extend Alembic::ValueParamHelper
      
      NOTIFY_MODE = {:normal=>0, :grab=>1, :ungrab=>2, :while_grabbed=>3}
      NOTIFY_MODE_I = {0=>:normal, 1=>:grab, 2=>:ungrab, 3=>:while_grabbed}
      
      NOTIFY_MODE_NORMAL = 0
      NOTIFY_MODE_GRAB = 1
      NOTIFY_MODE_UNGRAB = 2
      NOTIFY_MODE_WHILE_GRABBED = 3
      
      NOTIFY_MODE.extend Alembic::ValueParamHelper
      
      EnterNotifyEvent = Struct.new(:detail, :time, :root, :event, :child, :root_x, :root_y, :event_x, :event_y, :state, :mode, :same_screen_focus, :synthetic)
      
      define_event 7, :enter_notify_event, false
      
      module Methods
        def encode_enter_notify_event (detail, time, root, event, child, root_x, root_y, event_x, event_y, state, mode, same_screen_focus)
          s = 7.chr.encode('BINARY')
          s << [detail, time, Window.to_xid(self, root), Window.to_xid(self, event), Window.to_xid(self, child), root_x, root_y, event_x, event_y, state, mode, same_screen_focus].pack("CLLLLssssSCC")
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
      end
      
      module Methods
        def decode_enter_notify_event (s)
          x = EnterNotifyEvent.new
          x.detail, x.time, x.root, x.event, x.child, x.root_x, x.root_y, x.event_x, x.event_y, x.state, x.mode, x.same_screen_focus, x.synthetic, = s.slice!(0, 30).unpack("CLLLLssssSCCC")
          x.root = Window[self, x.root]
          x.event = Window[self, x.event]
          x.child = Window[self, x.child]
          x.synthetic = x.synthetic != 0
          x
        end
      end
      
      LeaveNotifyEvent = Struct.new(:detail, :time, :root, :event, :child, :root_x, :root_y, :event_x, :event_y, :state, :mode, :same_screen_focus, :synthetic)
      
      define_event 8, :leave_notify_event, false
      
      module Methods
        def encode_leave_notify_event (detail, time, root, event, child, root_x, root_y, event_x, event_y, state, mode, same_screen_focus)
          s = 8.chr.encode('BINARY')
          s << [detail, time, Window.to_xid(self, root), Window.to_xid(self, event), Window.to_xid(self, child), root_x, root_y, event_x, event_y, state, mode, same_screen_focus].pack("CLLLLssssSCC")
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
      end
      
      module Methods
        def decode_leave_notify_event (s)
          x = LeaveNotifyEvent.new
          x.detail, x.time, x.root, x.event, x.child, x.root_x, x.root_y, x.event_x, x.event_y, x.state, x.mode, x.same_screen_focus, x.synthetic, = s.slice!(0, 30).unpack("CLLLLssssSCCC")
          x.root = Window[self, x.root]
          x.event = Window[self, x.event]
          x.child = Window[self, x.child]
          x.synthetic = x.synthetic != 0
          x
        end
      end
      
      FocusInEvent = Struct.new(:detail, :event, :mode, :synthetic)
      
      define_event 9, :focus_in_event, false
      
      module Methods
        def encode_focus_in_event (detail, event, mode)
          s = 9.chr.encode('BINARY')
          s << [detail, Window.to_xid(self, event), mode].pack("CLCx3")
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
      end
      
      module Methods
        def decode_focus_in_event (s)
          x = FocusInEvent.new
          x.detail, x.event, x.mode, x.synthetic, = s.slice!(0, 10).unpack("CLCx3C")
          x.event = Window[self, x.event]
          x.synthetic = x.synthetic != 0
          x
        end
      end
      
      FocusOutEvent = Struct.new(:detail, :event, :mode, :synthetic)
      
      define_event 10, :focus_out_event, false
      
      module Methods
        def encode_focus_out_event (detail, event, mode)
          s = 10.chr.encode('BINARY')
          s << [detail, Window.to_xid(self, event), mode].pack("CLCx3")
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
      end
      
      module Methods
        def decode_focus_out_event (s)
          x = FocusOutEvent.new
          x.detail, x.event, x.mode, x.synthetic, = s.slice!(0, 10).unpack("CLCx3C")
          x.event = Window[self, x.event]
          x.synthetic = x.synthetic != 0
          x
        end
      end
      
      KeymapNotifyEvent = Struct.new(:keys, :synthetic)
      
      define_event 11, :keymap_notify_event, true
      
      module Methods
        def encode_keymap_notify_event (keys)
          s = 11.chr.encode('BINARY')
          s << keys.map{|x|[x].pack("C")}
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
      end
      
      module Methods
        def decode_keymap_notify_event (s)
          x = KeymapNotifyEvent.new
          x.keys = s.slice!(0..31).unpack('C*')
          x.synthetic, = s.slice!(0, 1).unpack("C")
          x.synthetic = x.synthetic != 0
          x
        end
      end
      
      ExposeEvent = Struct.new(:window, :x, :y, :width, :height, :count, :synthetic)
      
      define_event 12, :expose_event, false
      
      module Methods
        def encode_expose_event (window, x, y, width, height, count)
          s = 12.chr.encode('BINARY')
          s << [Window.to_xid(self, window), x, y, width, height, count].pack("x1LSSSSSx2")
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
      end
      
      module Methods
        def decode_expose_event (s)
          x = ExposeEvent.new
          x.window, x.x, x.y, x.width, x.height, x.count, x.synthetic, = s.slice!(0, 18).unpack("x1LSSSSSx2C")
          x.window = Window[self, x.window]
          x.synthetic = x.synthetic != 0
          x
        end
      end
      
      GraphicsExposureEvent = Struct.new(:drawable, :x, :y, :width, :height, :minor_opcode, :count, :major_opcode, :synthetic)
      
      define_event 13, :graphics_exposure_event, false
      
      module Methods
        def encode_graphics_exposure_event (drawable, x, y, width, height, minor_opcode, count, major_opcode)
          s = 13.chr.encode('BINARY')
          s << [Drawable.to_xid(self, drawable), x, y, width, height, minor_opcode, count, major_opcode].pack("x1LSSSSSSCx3")
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
      end
      
      module Methods
        def decode_graphics_exposure_event (s)
          x = GraphicsExposureEvent.new
          x.drawable, x.x, x.y, x.width, x.height, x.minor_opcode, x.count, x.major_opcode, x.synthetic, = s.slice!(0, 22).unpack("x1LSSSSSSCx3C")
          x.drawable = Drawable[self, x.drawable]
          x.synthetic = x.synthetic != 0
          x
        end
      end
      
      NoExposureEvent = Struct.new(:drawable, :minor_opcode, :major_opcode, :synthetic)
      
      define_event 14, :no_exposure_event, false
      
      module Methods
        def encode_no_exposure_event (drawable, minor_opcode, major_opcode)
          s = 14.chr.encode('BINARY')
          s << [Drawable.to_xid(self, drawable), minor_opcode, major_opcode].pack("x1LSCx1")
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
      end
      
      module Methods
        def decode_no_exposure_event (s)
          x = NoExposureEvent.new
          x.drawable, x.minor_opcode, x.major_opcode, x.synthetic, = s.slice!(0, 10).unpack("x1LSCx1C")
          x.drawable = Drawable[self, x.drawable]
          x.synthetic = x.synthetic != 0
          x
        end
      end
      
      VISIBILITY = {:unobscured=>0, :partially_obscured=>1, :fully_obscured=>2}
      VISIBILITY_I = {0=>:unobscured, 1=>:partially_obscured, 2=>:fully_obscured}
      
      VISIBILITY_UNOBSCURED = 0
      VISIBILITY_PARTIALLY_OBSCURED = 1
      VISIBILITY_FULLY_OBSCURED = 2
      
      VISIBILITY.extend Alembic::ValueParamHelper
      
      VisibilityNotifyEvent = Struct.new(:window, :state, :synthetic)
      
      define_event 15, :visibility_notify_event, false
      
      module Methods
        def encode_visibility_notify_event (window, state)
          s = 15.chr.encode('BINARY')
          s << [Window.to_xid(self, window), state].pack("x1LCx3")
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
      end
      
      module Methods
        def decode_visibility_notify_event (s)
          x = VisibilityNotifyEvent.new
          x.window, x.state, x.synthetic, = s.slice!(0, 10).unpack("x1LCx3C")
          x.window = Window[self, x.window]
          x.synthetic = x.synthetic != 0
          x
        end
      end
      
      CreateNotifyEvent = Struct.new(:parent, :window, :x, :y, :width, :height, :border_width, :override_redirect, :synthetic)
      
      define_event 16, :create_notify_event, false
      
      module Methods
        def encode_create_notify_event (parent, window, x, y, width, height, border_width, override_redirect)
          s = 16.chr.encode('BINARY')
          s << [Window.to_xid(self, parent), Window.to_xid(self, window), x, y, width, height, border_width, override_redirect ? 1 : 0].pack("x1LLssSSSCx1")
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
      end
      
      module Methods
        def decode_create_notify_event (s)
          x = CreateNotifyEvent.new
          x.parent, x.window, x.x, x.y, x.width, x.height, x.border_width, x.override_redirect, x.synthetic, = s.slice!(0, 22).unpack("x1LLssSSSCx1C")
          x.parent = Window[self, x.parent]
          x.window = Window[self, x.window]
          x.override_redirect = x.override_redirect != 0
          x.synthetic = x.synthetic != 0
          x
        end
      end
      
      DestroyNotifyEvent = Struct.new(:event, :window, :synthetic)
      
      define_event 17, :destroy_notify_event, false
      
      module Methods
        def encode_destroy_notify_event (event, window)
          s = 17.chr.encode('BINARY')
          s << [Window.to_xid(self, event), Window.to_xid(self, window)].pack("x1LL")
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
      end
      
      module Methods
        def decode_destroy_notify_event (s)
          x = DestroyNotifyEvent.new
          x.event, x.window, x.synthetic, = s.slice!(0, 10).unpack("x1LLC")
          x.event = Window[self, x.event]
          x.window = Window[self, x.window]
          x.synthetic = x.synthetic != 0
          x
        end
      end
      
      UnmapNotifyEvent = Struct.new(:event, :window, :from_configure, :synthetic)
      
      define_event 18, :unmap_notify_event, false
      
      module Methods
        def encode_unmap_notify_event (event, window, from_configure)
          s = 18.chr.encode('BINARY')
          s << [Window.to_xid(self, event), Window.to_xid(self, window), from_configure ? 1 : 0].pack("x1LLCx3")
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
      end
      
      module Methods
        def decode_unmap_notify_event (s)
          x = UnmapNotifyEvent.new
          x.event, x.window, x.from_configure, x.synthetic, = s.slice!(0, 14).unpack("x1LLCx3C")
          x.event = Window[self, x.event]
          x.window = Window[self, x.window]
          x.from_configure = x.from_configure != 0
          x.synthetic = x.synthetic != 0
          x
        end
      end
      
      MapNotifyEvent = Struct.new(:event, :window, :override_redirect, :synthetic)
      
      define_event 19, :map_notify_event, false
      
      module Methods
        def encode_map_notify_event (event, window, override_redirect)
          s = 19.chr.encode('BINARY')
          s << [Window.to_xid(self, event), Window.to_xid(self, window), override_redirect ? 1 : 0].pack("x1LLCx3")
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
      end
      
      module Methods
        def decode_map_notify_event (s)
          x = MapNotifyEvent.new
          x.event, x.window, x.override_redirect, x.synthetic, = s.slice!(0, 14).unpack("x1LLCx3C")
          x.event = Window[self, x.event]
          x.window = Window[self, x.window]
          x.override_redirect = x.override_redirect != 0
          x.synthetic = x.synthetic != 0
          x
        end
      end
      
      MapRequestEvent = Struct.new(:parent, :window, :synthetic)
      
      define_event 20, :map_request_event, false
      
      module Methods
        def encode_map_request_event (parent, window)
          s = 20.chr.encode('BINARY')
          s << [Window.to_xid(self, parent), Window.to_xid(self, window)].pack("x1LL")
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
      end
      
      module Methods
        def decode_map_request_event (s)
          x = MapRequestEvent.new
          x.parent, x.window, x.synthetic, = s.slice!(0, 10).unpack("x1LLC")
          x.parent = Window[self, x.parent]
          x.window = Window[self, x.window]
          x.synthetic = x.synthetic != 0
          x
        end
      end
      
      ReparentNotifyEvent = Struct.new(:event, :window, :parent, :x, :y, :override_redirect, :synthetic)
      
      define_event 21, :reparent_notify_event, false
      
      module Methods
        def encode_reparent_notify_event (event, window, parent, x, y, override_redirect)
          s = 21.chr.encode('BINARY')
          s << [Window.to_xid(self, event), Window.to_xid(self, window), Window.to_xid(self, parent), x, y, override_redirect ? 1 : 0].pack("x1LLLssCx3")
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
      end
      
      module Methods
        def decode_reparent_notify_event (s)
          x = ReparentNotifyEvent.new
          x.event, x.window, x.parent, x.x, x.y, x.override_redirect, x.synthetic, = s.slice!(0, 22).unpack("x1LLLssCx3C")
          x.event = Window[self, x.event]
          x.window = Window[self, x.window]
          x.parent = Window[self, x.parent]
          x.override_redirect = x.override_redirect != 0
          x.synthetic = x.synthetic != 0
          x
        end
      end
      
      ConfigureNotifyEvent = Struct.new(:event, :window, :above_sibling, :x, :y, :width, :height, :border_width, :override_redirect, :synthetic)
      
      define_event 22, :configure_notify_event, false
      
      module Methods
        def encode_configure_notify_event (event, window, above_sibling, x, y, width, height, border_width, override_redirect)
          s = 22.chr.encode('BINARY')
          s << [Window.to_xid(self, event), Window.to_xid(self, window), Window.to_xid(self, above_sibling), x, y, width, height, border_width, override_redirect ? 1 : 0].pack("x1LLLssSSSCx1")
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
      end
      
      module Methods
        def decode_configure_notify_event (s)
          x = ConfigureNotifyEvent.new
          x.event, x.window, x.above_sibling, x.x, x.y, x.width, x.height, x.border_width, x.override_redirect, x.synthetic, = s.slice!(0, 26).unpack("x1LLLssSSSCx1C")
          x.event = Window[self, x.event]
          x.window = Window[self, x.window]
          x.above_sibling = Window[self, x.above_sibling]
          x.override_redirect = x.override_redirect != 0
          x.synthetic = x.synthetic != 0
          x
        end
      end
      
      ConfigureRequestEvent = Struct.new(:stack_mode, :parent, :window, :sibling, :x, :y, :width, :height, :border_width, :value_mask, :synthetic)
      
      define_event 23, :configure_request_event, false
      
      module Methods
        def encode_configure_request_event (stack_mode, parent, window, sibling, x, y, width, height, border_width, value_mask)
          s = 23.chr.encode('BINARY')
          s << [stack_mode, Window.to_xid(self, parent), Window.to_xid(self, window), Window.to_xid(self, sibling), x, y, width, height, border_width, value_mask].pack("CLLLssSSSS")
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
      end
      
      module Methods
        def decode_configure_request_event (s)
          x = ConfigureRequestEvent.new
          x.stack_mode, x.parent, x.window, x.sibling, x.x, x.y, x.width, x.height, x.border_width, x.value_mask, x.synthetic, = s.slice!(0, 26).unpack("CLLLssSSSSC")
          x.parent = Window[self, x.parent]
          x.window = Window[self, x.window]
          x.sibling = Window[self, x.sibling]
          x.synthetic = x.synthetic != 0
          x
        end
      end
      
      GravityNotifyEvent = Struct.new(:event, :window, :x, :y, :synthetic)
      
      define_event 24, :gravity_notify_event, false
      
      module Methods
        def encode_gravity_notify_event (event, window, x, y)
          s = 24.chr.encode('BINARY')
          s << [Window.to_xid(self, event), Window.to_xid(self, window), x, y].pack("x1LLss")
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
      end
      
      module Methods
        def decode_gravity_notify_event (s)
          x = GravityNotifyEvent.new
          x.event, x.window, x.x, x.y, x.synthetic, = s.slice!(0, 14).unpack("x1LLssC")
          x.event = Window[self, x.event]
          x.window = Window[self, x.window]
          x.synthetic = x.synthetic != 0
          x
        end
      end
      
      ResizeRequestEvent = Struct.new(:window, :width, :height, :synthetic)
      
      define_event 25, :resize_request_event, false
      
      module Methods
        def encode_resize_request_event (window, width, height)
          s = 25.chr.encode('BINARY')
          s << [Window.to_xid(self, window), width, height].pack("x1LSS")
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
      end
      
      module Methods
        def decode_resize_request_event (s)
          x = ResizeRequestEvent.new
          x.window, x.width, x.height, x.synthetic, = s.slice!(0, 10).unpack("x1LSSC")
          x.window = Window[self, x.window]
          x.synthetic = x.synthetic != 0
          x
        end
      end
      
      PLACE = {:on_top=>0, :on_bottom=>1}
      PLACE_I = {0=>:on_top, 1=>:on_bottom}
      
      PLACE_ON_TOP = 0
      PLACE_ON_BOTTOM = 1
      
      PLACE.extend Alembic::ValueParamHelper
      
      CirculateNotifyEvent = Struct.new(:event, :window, :place, :synthetic)
      
      define_event 26, :circulate_notify_event, false
      
      module Methods
        def encode_circulate_notify_event (event, window, place)
          s = 26.chr.encode('BINARY')
          s << [Window.to_xid(self, event), Window.to_xid(self, window), place].pack("x1LLx4Cx3")
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
      end
      
      module Methods
        def decode_circulate_notify_event (s)
          x = CirculateNotifyEvent.new
          x.event, x.window, x.place, x.synthetic, = s.slice!(0, 18).unpack("x1LLx4Cx3C")
          x.event = Window[self, x.event]
          x.window = Window[self, x.window]
          x.synthetic = x.synthetic != 0
          x
        end
      end
      
      CirculateRequestEvent = Struct.new(:event, :window, :place, :synthetic)
      
      define_event 27, :circulate_request_event, false
      
      module Methods
        def encode_circulate_request_event (event, window, place)
          s = 27.chr.encode('BINARY')
          s << [Window.to_xid(self, event), Window.to_xid(self, window), place].pack("x1LLx4Cx3")
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
      end
      
      module Methods
        def decode_circulate_request_event (s)
          x = CirculateRequestEvent.new
          x.event, x.window, x.place, x.synthetic, = s.slice!(0, 18).unpack("x1LLx4Cx3C")
          x.event = Window[self, x.event]
          x.window = Window[self, x.window]
          x.synthetic = x.synthetic != 0
          x
        end
      end
      
      PROPERTY = {:new_value=>0, :delete=>1}
      PROPERTY_I = {0=>:new_value, 1=>:delete}
      
      PROPERTY_NEW_VALUE = 0
      PROPERTY_DELETE = 1
      
      PROPERTY.extend Alembic::ValueParamHelper
      
      PropertyNotifyEvent = Struct.new(:window, :atom, :time, :state, :synthetic)
      
      define_event 28, :property_notify_event, false
      
      module Methods
        def encode_property_notify_event (window, atom, time, state)
          s = 28.chr.encode('BINARY')
          s << [Window.to_xid(self, window), Atom.to_xid(self, atom), time, state].pack("x1LLLCx3")
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
      end
      
      module Methods
        def decode_property_notify_event (s)
          x = PropertyNotifyEvent.new
          x.window, x.atom, x.time, x.state, x.synthetic, = s.slice!(0, 18).unpack("x1LLLCx3C")
          x.window = Window[self, x.window]
          x.atom = Atom[self, x.atom]
          x.synthetic = x.synthetic != 0
          x
        end
      end
      
      SelectionClearEvent = Struct.new(:time, :owner, :selection, :synthetic)
      
      define_event 29, :selection_clear_event, false
      
      module Methods
        def encode_selection_clear_event (time, owner, selection)
          s = 29.chr.encode('BINARY')
          s << [time, Window.to_xid(self, owner), Atom.to_xid(self, selection)].pack("x1LLL")
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
      end
      
      module Methods
        def decode_selection_clear_event (s)
          x = SelectionClearEvent.new
          x.time, x.owner, x.selection, x.synthetic, = s.slice!(0, 14).unpack("x1LLLC")
          x.owner = Window[self, x.owner]
          x.selection = Atom[self, x.selection]
          x.synthetic = x.synthetic != 0
          x
        end
      end
      
      TIME = {:current_time=>0}
      TIME_I = {0=>:current_time}
      
      TIME_CURRENT_TIME = 0
      
      TIME.extend Alembic::ValueParamHelper
      
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
      
      ATOM.extend Alembic::ValueParamHelper
      
      SelectionRequestEvent = Struct.new(:time, :owner, :requestor, :selection, :target, :property, :synthetic)
      
      define_event 30, :selection_request_event, false
      
      module Methods
        def encode_selection_request_event (time, owner, requestor, selection, target, property)
          s = 30.chr.encode('BINARY')
          s << [time, Window.to_xid(self, owner), Window.to_xid(self, requestor), Atom.to_xid(self, selection), Atom.to_xid(self, target), Atom.to_xid(self, property)].pack("x1LLLLLL")
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
      end
      
      module Methods
        def decode_selection_request_event (s)
          x = SelectionRequestEvent.new
          x.time, x.owner, x.requestor, x.selection, x.target, x.property, x.synthetic, = s.slice!(0, 26).unpack("x1LLLLLLC")
          x.owner = Window[self, x.owner]
          x.requestor = Window[self, x.requestor]
          x.selection = Atom[self, x.selection]
          x.target = Atom[self, x.target]
          x.property = Atom[self, x.property]
          x.synthetic = x.synthetic != 0
          x
        end
      end
      
      SelectionNotifyEvent = Struct.new(:time, :requestor, :selection, :target, :property, :synthetic)
      
      define_event 31, :selection_notify_event, false
      
      module Methods
        def encode_selection_notify_event (time, requestor, selection, target, property)
          s = 31.chr.encode('BINARY')
          s << [time, Window.to_xid(self, requestor), Atom.to_xid(self, selection), Atom.to_xid(self, target), Atom.to_xid(self, property)].pack("x1LLLLL")
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
      end
      
      module Methods
        def decode_selection_notify_event (s)
          x = SelectionNotifyEvent.new
          x.time, x.requestor, x.selection, x.target, x.property, x.synthetic, = s.slice!(0, 22).unpack("x1LLLLLC")
          x.requestor = Window[self, x.requestor]
          x.selection = Atom[self, x.selection]
          x.target = Atom[self, x.target]
          x.property = Atom[self, x.property]
          x.synthetic = x.synthetic != 0
          x
        end
      end
      
      COLORMAP_STATE = {:uninstalled=>0, :installed=>1}
      COLORMAP_STATE_I = {0=>:uninstalled, 1=>:installed}
      
      COLORMAP_STATE_UNINSTALLED = 0
      COLORMAP_STATE_INSTALLED = 1
      
      COLORMAP_STATE.extend Alembic::ValueParamHelper
      
      COLORMAP = {:none=>0}
      COLORMAP_I = {0=>:none}
      
      COLORMAP_NONE = 0
      
      COLORMAP.extend Alembic::ValueParamHelper
      
      ColormapNotifyEvent = Struct.new(:window, :colormap, :new, :state, :synthetic)
      
      define_event 32, :colormap_notify_event, false
      
      module Methods
        def encode_colormap_notify_event (window, colormap, new, state)
          s = 32.chr.encode('BINARY')
          s << [Window.to_xid(self, window), Colormap.to_xid(self, colormap), new ? 1 : 0, state].pack("x1LLCCx2")
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
      end
      
      module Methods
        def decode_colormap_notify_event (s)
          x = ColormapNotifyEvent.new
          x.window, x.colormap, x.new, x.state, x.synthetic, = s.slice!(0, 14).unpack("x1LLCCx2C")
          x.window = Window[self, x.window]
          x.colormap = Colormap[self, x.colormap]
          x.new = x.new != 0
          x.synthetic = x.synthetic != 0
          x
        end
      end
      
      ClientMessageEvent = Struct.new(:format, :window, :type, :data, :synthetic)
      
      define_event 33, :client_message_event, false
      
      module Methods
        def encode_client_message_event (format, window, type, data)
          s = 33.chr.encode('BINARY')
          s << [format, Window.to_xid(self, window), Atom.to_xid(self, type)].pack("CLL")
          s << encode_client_message_data(data)
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
      end
      
      module Methods
        def decode_client_message_event (s)
          x = ClientMessageEvent.new
          x.format, x.window, x.type, = s.slice!(0, 9).unpack("CLL")
          x.window = Window[self, x.window]
          x.type = Atom[self, x.type]
          x.data = decode_client_message_data(s)
          x.synthetic, = s.slice!(0, 1).unpack("C")
          x.synthetic = x.synthetic != 0
          x
        end
      end
      
      MAPPING = {:modifier=>0, :keyboard=>1, :pointer=>2}
      MAPPING_I = {0=>:modifier, 1=>:keyboard, 2=>:pointer}
      
      MAPPING_MODIFIER = 0
      MAPPING_KEYBOARD = 1
      MAPPING_POINTER = 2
      
      MAPPING.extend Alembic::ValueParamHelper
      
      MappingNotifyEvent = Struct.new(:request, :first_keycode, :count, :synthetic)
      
      define_event 34, :mapping_notify_event, false
      
      module Methods
        def encode_mapping_notify_event (request, first_keycode, count)
          s = 34.chr.encode('BINARY')
          s << [request, first_keycode, count].pack("x1CCCx1")
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
      end
      
      module Methods
        def decode_mapping_notify_event (s)
          x = MappingNotifyEvent.new
          x.request, x.first_keycode, x.count, x.synthetic, = s.slice!(0, 6).unpack("x1CCCx1C")
          x.synthetic = x.synthetic != 0
          x
        end
      end
      
      GeEvent = Struct.new(:synthetic)
      
      define_event 35, :ge_event, false
      
      module Methods
        def encode_ge_event ()
          s = 35.chr.encode('BINARY')
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
      end
      
      module Methods
        def decode_ge_event (s)
          x = GeEvent.new
          x.synthetic, = s.slice!(0, 23).unpack("x22C")
          x.synthetic = x.synthetic != 0
          x
        end
      end
      
      RequestError = Class.new(X11Error)
      
      define_error 1, RequestError
      
      ValueError = Class.new(X11Error)
      
      define_error 2, ValueError
      
      WindowError = Class.new(X11Error)
      
      define_error 3, WindowError
      
      PixmapError = Class.new(X11Error)
      
      define_error 4, PixmapError
      
      AtomError = Class.new(X11Error)
      
      define_error 5, AtomError
      
      CursorError = Class.new(X11Error)
      
      define_error 6, CursorError
      
      FontError = Class.new(X11Error)
      
      define_error 7, FontError
      
      MatchError = Class.new(X11Error)
      
      define_error 8, MatchError
      
      DrawableError = Class.new(X11Error)
      
      define_error 9, DrawableError
      
      AccessError = Class.new(X11Error)
      
      define_error 10, AccessError
      
      AllocError = Class.new(X11Error)
      
      define_error 11, AllocError
      
      ColormapError = Class.new(X11Error)
      
      define_error 12, ColormapError
      
      GContextError = Class.new(X11Error)
      
      define_error 13, GContextError
      
      IDChoiceError = Class.new(X11Error)
      
      define_error 14, IDChoiceError
      
      NameError = Class.new(X11Error)
      
      define_error 15, NameError
      
      LengthError = Class.new(X11Error)
      
      define_error 16, LengthError
      
      ImplementationError = Class.new(X11Error)
      
      define_error 17, ImplementationError
      
      WINDOW_CLASS = {:copy_from_parent=>0, :input_output=>1, :input_only=>2}
      WINDOW_CLASS_I = {0=>:copy_from_parent, 1=>:input_output, 2=>:input_only}
      
      WINDOW_CLASS_COPY_FROM_PARENT = 0
      WINDOW_CLASS_INPUT_OUTPUT = 1
      WINDOW_CLASS_INPUT_ONLY = 2
      
      WINDOW_CLASS.extend Alembic::ValueParamHelper
      
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
      
      CW.extend Alembic::ValueParamHelper
      
      BACK_PIXMAP = {:none=>0, :parent_relative=>1}
      BACK_PIXMAP_I = {0=>:none, 1=>:parent_relative}
      
      BACK_PIXMAP_NONE = 0
      BACK_PIXMAP_PARENT_RELATIVE = 1
      
      BACK_PIXMAP.extend Alembic::ValueParamHelper
      
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
      
      GRAVITY.extend Alembic::ValueParamHelper
      
      module Methods
        def create_window! (depth, wid, parent, x, y, width, height, border_width, klass, visual, value_mask, *value_list)
          s = 1.chr.encode('BINARY')
          s << [depth, Window.to_xid(self, wid), Window.to_xid(self, parent), x, y, width, height, border_width, klass, visual, value_mask, *value_list].pack("CLLssSSSSLLL*")
          send_request(s)
        end
        
        def create_window (depth, wid, parent, x, y, width, height, border_width, klass, visual, value_mask, *value_list)
          create_window!(depth, wid, parent, x, y, width, height, border_width, klass, visual, value_mask, *value_list).wait
        end
      end
      
      module Methods
        def change_window_attributes! (window, value_mask, *value_list)
          s = 2.chr.encode('BINARY')
          s << [Window.to_xid(self, window), value_mask, *value_list].pack("x1LLL*")
          send_request(s)
        end
        
        def change_window_attributes (window, value_mask, *value_list)
          change_window_attributes!(window, value_mask, *value_list).wait
        end
      end
      
      MAP_STATE = {:unmapped=>0, :unviewable=>1, :viewable=>2}
      MAP_STATE_I = {0=>:unmapped, 1=>:unviewable, 2=>:viewable}
      
      MAP_STATE_UNMAPPED = 0
      MAP_STATE_UNVIEWABLE = 1
      MAP_STATE_VIEWABLE = 2
      
      MAP_STATE.extend Alembic::ValueParamHelper
      
      GetWindowAttributesReply = Struct.new(:backing_store, :visual, :klass, :bit_gravity, :win_gravity, :backing_planes, :backing_pixel, :save_under, :map_is_installed, :map_state, :override_redirect, :colormap, :all_event_masks, :your_event_mask, :do_not_propagate_mask)
      
      module Methods
        def get_window_attributes! (window)
          s = 3.chr.encode('BINARY')
          s << [Window.to_xid(self, window)].pack("x1L")
          send_request(s) do |s|
            x = GetWindowAttributesReply.new
            x.backing_store, x.visual, x.klass, x.bit_gravity, x.win_gravity, x.backing_planes, x.backing_pixel, x.save_under, x.map_is_installed, x.map_state, x.override_redirect, x.colormap, x.all_event_masks, x.your_event_mask, x.do_not_propagate_mask, = s.slice!(0, 37).unpack("CLSCCLLCCCCLLLSx2")
            x.save_under = x.save_under != 0
            x.map_is_installed = x.map_is_installed != 0
            x.override_redirect = x.override_redirect != 0
            x.colormap = Colormap[self, x.colormap]
            x
          end
        end
        
        def get_window_attributes (window)
          get_window_attributes!(window).wait
        end
      end
      
      module Methods
        def destroy_window! (window)
          s = 4.chr.encode('BINARY')
          s << [Window.to_xid(self, window)].pack("x1L")
          send_request(s)
        end
        
        def destroy_window (window)
          destroy_window!(window).wait
        end
      end
      
      module Methods
        def destroy_subwindows! (window)
          s = 5.chr.encode('BINARY')
          s << [Window.to_xid(self, window)].pack("x1L")
          send_request(s)
        end
        
        def destroy_subwindows (window)
          destroy_subwindows!(window).wait
        end
      end
      
      SET_MODE = {:insert=>0, :delete=>1}
      SET_MODE_I = {0=>:insert, 1=>:delete}
      
      SET_MODE_INSERT = 0
      SET_MODE_DELETE = 1
      
      SET_MODE.extend Alembic::ValueParamHelper
      
      module Methods
        def change_save_set! (mode, window)
          s = 6.chr.encode('BINARY')
          s << [mode, Window.to_xid(self, window)].pack("CL")
          send_request(s)
        end
        
        def change_save_set (mode, window)
          change_save_set!(mode, window).wait
        end
      end
      
      module Methods
        def reparent_window! (window, parent, x, y)
          s = 7.chr.encode('BINARY')
          s << [Window.to_xid(self, window), Window.to_xid(self, parent), x, y].pack("x1LLss")
          send_request(s)
        end
        
        def reparent_window (window, parent, x, y)
          reparent_window!(window, parent, x, y).wait
        end
      end
      
      module Methods
        def map_window! (window)
          s = 8.chr.encode('BINARY')
          s << [Window.to_xid(self, window)].pack("x1L")
          send_request(s)
        end
        
        def map_window (window)
          map_window!(window).wait
        end
      end
      
      module Methods
        def map_subwindows! (window)
          s = 9.chr.encode('BINARY')
          s << [Window.to_xid(self, window)].pack("x1L")
          send_request(s)
        end
        
        def map_subwindows (window)
          map_subwindows!(window).wait
        end
      end
      
      module Methods
        def unmap_window! (window)
          s = 10.chr.encode('BINARY')
          s << [Window.to_xid(self, window)].pack("x1L")
          send_request(s)
        end
        
        def unmap_window (window)
          unmap_window!(window).wait
        end
      end
      
      module Methods
        def unmap_subwindows! (window)
          s = 11.chr.encode('BINARY')
          s << [Window.to_xid(self, window)].pack("x1L")
          send_request(s)
        end
        
        def unmap_subwindows (window)
          unmap_subwindows!(window).wait
        end
      end
      
      CONFIG_WINDOW = {:x=>1, :y=>2, :width=>4, :height=>8, :border_width=>16, :sibling=>32, :stack_mode=>64}
      CONFIG_WINDOW_I = {1=>:x, 2=>:y, 4=>:width, 8=>:height, 16=>:border_width, 32=>:sibling, 64=>:stack_mode}
      
      CONFIG_WINDOW_X = 1
      CONFIG_WINDOW_Y = 2
      CONFIG_WINDOW_WIDTH = 4
      CONFIG_WINDOW_HEIGHT = 8
      CONFIG_WINDOW_BORDER_WIDTH = 16
      CONFIG_WINDOW_SIBLING = 32
      CONFIG_WINDOW_STACK_MODE = 64
      
      CONFIG_WINDOW.extend Alembic::ValueParamHelper
      
      STACK_MODE = {:above=>0, :below=>1, :top_if=>2, :bottom_if=>3, :opposite=>4}
      STACK_MODE_I = {0=>:above, 1=>:below, 2=>:top_if, 3=>:bottom_if, 4=>:opposite}
      
      STACK_MODE_ABOVE = 0
      STACK_MODE_BELOW = 1
      STACK_MODE_TOP_IF = 2
      STACK_MODE_BOTTOM_IF = 3
      STACK_MODE_OPPOSITE = 4
      
      STACK_MODE.extend Alembic::ValueParamHelper
      
      module Methods
        def configure_window! (window, value_mask, *value_list)
          s = 12.chr.encode('BINARY')
          s << [Window.to_xid(self, window), value_mask, *value_list].pack("x1LSx2L*")
          send_request(s)
        end
        
        def configure_window (window, value_mask, *value_list)
          configure_window!(window, value_mask, *value_list).wait
        end
      end
      
      CIRCULATE = {:raise_lowest=>0, :lower_highest=>1}
      CIRCULATE_I = {0=>:raise_lowest, 1=>:lower_highest}
      
      CIRCULATE_RAISE_LOWEST = 0
      CIRCULATE_LOWER_HIGHEST = 1
      
      CIRCULATE.extend Alembic::ValueParamHelper
      
      module Methods
        def circulate_window! (direction, window)
          s = 13.chr.encode('BINARY')
          s << [direction, Window.to_xid(self, window)].pack("CL")
          send_request(s)
        end
        
        def circulate_window (direction, window)
          circulate_window!(direction, window).wait
        end
      end
      
      GetGeometryReply = Struct.new(:depth, :root, :x, :y, :width, :height, :border_width)
      
      module Methods
        def get_geometry! (drawable)
          s = 14.chr.encode('BINARY')
          s << [Drawable.to_xid(self, drawable)].pack("x1L")
          send_request(s) do |s|
            x = GetGeometryReply.new
            x.depth, x.root, x.x, x.y, x.width, x.height, x.border_width, = s.slice!(0, 17).unpack("CLssSSSx2")
            x.root = Window[self, x.root]
            x
          end
        end
        
        def get_geometry (drawable)
          get_geometry!(drawable).wait
        end
      end
      
      QueryTreeReply = Struct.new(:root, :parent, :children_len, :children)
      
      module Methods
        def query_tree! (window)
          s = 15.chr.encode('BINARY')
          s << [Window.to_xid(self, window)].pack("x1L")
          send_request(s) do |s|
            x = QueryTreeReply.new
            x.root, x.parent, x.children_len, *x.children = s.unpack("x1LLSx14L*")
            x.root = Window[self, x.root]
            x.parent = Window[self, x.parent]
            x.children = x.children ? x.children.map{|x|Window[self, x]} : []
            x
          end
        end
        
        def query_tree (window)
          query_tree!(window).wait
        end
      end
      
      InternAtomReply = Struct.new(:atom)
      
      module Methods
        def intern_atom! (only_if_exists, name)
          s = 16.chr.encode('BINARY')
          name_len = name.length
          s << [only_if_exists ? 1 : 0, name_len, pad(name)].pack("CSx2A*")
          send_request(s) do |s|
            x = InternAtomReply.new
            x.atom, = s.slice!(0, 5).unpack("x1L")
            x.atom = Atom[self, x.atom]
            x.atom
          end
        end
        
        def intern_atom (only_if_exists, name)
          intern_atom!(only_if_exists, name).wait
        end
      end
      
      GetAtomNameReply = Struct.new(:name_len, :name)
      
      module Methods
        def get_atom_name! (atom)
          s = 17.chr.encode('BINARY')
          s << [Atom.to_xid(self, atom)].pack("x1L")
          send_request(s) do |s|
            x = GetAtomNameReply.new
            x.name_len, = s.slice!(0, 25).unpack("x1Sx22")
            x.name = s.slice!(0, x.name_len)
            x.name
          end
        end
        
        def get_atom_name (atom)
          get_atom_name!(atom).wait
        end
      end
      
      PROP_MODE = {:replace=>0, :prepend=>1, :append=>2}
      PROP_MODE_I = {0=>:replace, 1=>:prepend, 2=>:append}
      
      PROP_MODE_REPLACE = 0
      PROP_MODE_PREPEND = 1
      PROP_MODE_APPEND = 2
      
      PROP_MODE.extend Alembic::ValueParamHelper
      
      module Methods
        def change_property! (mode, window, property, type, format, data_len, data)
          s = 18.chr.encode('BINARY')
          s << [mode, Window.to_xid(self, window), Atom.to_xid(self, property), Atom.to_xid(self, type), format, data_len, pad(data)].pack("CLLLCx3LA*")
          send_request(s)
        end
        
        def change_property (mode, window, property, type, format, data_len, data)
          change_property!(mode, window, property, type, format, data_len, data).wait
        end
      end
      
      module Methods
        def delete_property! (window, property)
          s = 19.chr.encode('BINARY')
          s << [Window.to_xid(self, window), Atom.to_xid(self, property)].pack("x1LL")
          send_request(s)
        end
        
        def delete_property (window, property)
          delete_property!(window, property).wait
        end
      end
      
      GET_PROPERTY_TYPE = {:any=>0}
      GET_PROPERTY_TYPE_I = {0=>:any}
      
      GET_PROPERTY_TYPE_ANY = 0
      
      GET_PROPERTY_TYPE.extend Alembic::ValueParamHelper
      
      GetPropertyReply = Struct.new(:format, :type, :bytes_after, :value_len, :value)
      
      module Methods
        def get_property! (delete, window, property, type, long_offset, long_length)
          s = 20.chr.encode('BINARY')
          s << [delete ? 1 : 0, Window.to_xid(self, window), Atom.to_xid(self, property), Atom.to_xid(self, type), long_offset, long_length].pack("CLLLLL")
          send_request(s) do |s|
            x = GetPropertyReply.new
            x.format, x.type, x.bytes_after, x.value_len, = s.slice!(0, 25).unpack("CLLLx12")
            x.type = Atom[self, x.type]
            x.value = s.slice!(0, (x.value_len * (x.format / 8)))
            x
          end
        end
        
        def get_property (delete, window, property, type, long_offset, long_length)
          get_property!(delete, window, property, type, long_offset, long_length).wait
        end
      end
      
      ListPropertiesReply = Struct.new(:atoms_len, :atoms)
      
      module Methods
        def list_properties! (window)
          s = 21.chr.encode('BINARY')
          s << [Window.to_xid(self, window)].pack("x1L")
          send_request(s) do |s|
            x = ListPropertiesReply.new
            x.atoms_len, *x.atoms = s.unpack("x1Sx22L*")
            x.atoms = x.atoms ? x.atoms.map{|x|Atom[self, x]} : []
            x.atoms
          end
        end
        
        def list_properties (window)
          list_properties!(window).wait
        end
      end
      
      module Methods
        def set_selection_owner! (owner, selection, time)
          s = 22.chr.encode('BINARY')
          s << [Window.to_xid(self, owner), Atom.to_xid(self, selection), time].pack("x1LLL")
          send_request(s)
        end
        
        def set_selection_owner (owner, selection, time)
          set_selection_owner!(owner, selection, time).wait
        end
      end
      
      GetSelectionOwnerReply = Struct.new(:owner)
      
      module Methods
        def get_selection_owner! (selection)
          s = 23.chr.encode('BINARY')
          s << [Atom.to_xid(self, selection)].pack("x1L")
          send_request(s) do |s|
            x = GetSelectionOwnerReply.new
            x.owner, = s.slice!(0, 5).unpack("x1L")
            x.owner = Window[self, x.owner]
            x.owner
          end
        end
        
        def get_selection_owner (selection)
          get_selection_owner!(selection).wait
        end
      end
      
      module Methods
        def convert_selection! (requestor, selection, target, property, time)
          s = 24.chr.encode('BINARY')
          s << [Window.to_xid(self, requestor), Atom.to_xid(self, selection), Atom.to_xid(self, target), Atom.to_xid(self, property), time].pack("x1LLLLL")
          send_request(s)
        end
        
        def convert_selection (requestor, selection, target, property, time)
          convert_selection!(requestor, selection, target, property, time).wait
        end
      end
      
      SEND_EVENT_DEST = {:pointer_window=>0, :item_focus=>1}
      SEND_EVENT_DEST_I = {0=>:pointer_window, 1=>:item_focus}
      
      SEND_EVENT_DEST_POINTER_WINDOW = 0
      SEND_EVENT_DEST_ITEM_FOCUS = 1
      
      SEND_EVENT_DEST.extend Alembic::ValueParamHelper
      
      module Methods
        def send_event! (propagate, destination, event_mask, event)
          s = 25.chr.encode('BINARY')
          s << [propagate ? 1 : 0, Window.to_xid(self, destination), event_mask, pad(event)].pack("CLLA*")
          send_request(s)
        end
        
        def send_event (propagate, destination, event_mask, event)
          send_event!(propagate, destination, event_mask, event).wait
        end
      end
      
      GRAB_MODE = {:sync=>0, :async=>1}
      GRAB_MODE_I = {0=>:sync, 1=>:async}
      
      GRAB_MODE_SYNC = 0
      GRAB_MODE_ASYNC = 1
      
      GRAB_MODE.extend Alembic::ValueParamHelper
      
      GRAB_STATUS = {:success=>0, :already_grabbed=>1, :invalid_time=>2, :not_viewable=>3, :frozen=>4}
      GRAB_STATUS_I = {0=>:success, 1=>:already_grabbed, 2=>:invalid_time, 3=>:not_viewable, 4=>:frozen}
      
      GRAB_STATUS_SUCCESS = 0
      GRAB_STATUS_ALREADY_GRABBED = 1
      GRAB_STATUS_INVALID_TIME = 2
      GRAB_STATUS_NOT_VIEWABLE = 3
      GRAB_STATUS_FROZEN = 4
      
      GRAB_STATUS.extend Alembic::ValueParamHelper
      
      CURSOR = {:none=>0}
      CURSOR_I = {0=>:none}
      
      CURSOR_NONE = 0
      
      CURSOR.extend Alembic::ValueParamHelper
      
      GrabPointerReply = Struct.new(:status)
      
      module Methods
        def grab_pointer! (owner_events, grab_window, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, time)
          s = 26.chr.encode('BINARY')
          s << [owner_events ? 1 : 0, Window.to_xid(self, grab_window), event_mask, pointer_mode, keyboard_mode, Window.to_xid(self, confine_to), Cursor.to_xid(self, cursor), time].pack("CLSCCLLL")
          send_request(s) do |s|
            x = GrabPointerReply.new
            x.status, = s.slice!(0, 1).unpack("C")
            x.status
          end
        end
        
        def grab_pointer (owner_events, grab_window, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, time)
          grab_pointer!(owner_events, grab_window, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, time).wait
        end
      end
      
      module Methods
        def ungrab_pointer! (time)
          s = 27.chr.encode('BINARY')
          s << [time].pack("x1L")
          send_request(s)
        end
        
        def ungrab_pointer (time)
          ungrab_pointer!(time).wait
        end
      end
      
      BUTTON_INDEX = {:any=>0, :"1"=>1, :"2"=>2, :"3"=>3, :"4"=>4, :"5"=>5}
      BUTTON_INDEX_I = {0=>:any, 1=>:"1", 2=>:"2", 3=>:"3", 4=>:"4", 5=>:"5"}
      
      BUTTON_INDEX_ANY = 0
      BUTTON_INDEX_1 = 1
      BUTTON_INDEX_2 = 2
      BUTTON_INDEX_3 = 3
      BUTTON_INDEX_4 = 4
      BUTTON_INDEX_5 = 5
      
      BUTTON_INDEX.extend Alembic::ValueParamHelper
      
      module Methods
        def grab_button! (owner_events, grab_window, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, button, modifiers)
          s = 28.chr.encode('BINARY')
          s << [owner_events ? 1 : 0, Window.to_xid(self, grab_window), event_mask, pointer_mode, keyboard_mode, Window.to_xid(self, confine_to), Cursor.to_xid(self, cursor), button, modifiers].pack("CLSCCLLCx1S")
          send_request(s)
        end
        
        def grab_button (owner_events, grab_window, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, button, modifiers)
          grab_button!(owner_events, grab_window, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, button, modifiers).wait
        end
      end
      
      module Methods
        def ungrab_button! (button, grab_window, modifiers)
          s = 29.chr.encode('BINARY')
          s << [button, Window.to_xid(self, grab_window), modifiers].pack("CLSx2")
          send_request(s)
        end
        
        def ungrab_button (button, grab_window, modifiers)
          ungrab_button!(button, grab_window, modifiers).wait
        end
      end
      
      module Methods
        def change_active_pointer_grab! (cursor, time, event_mask)
          s = 30.chr.encode('BINARY')
          s << [Cursor.to_xid(self, cursor), time, event_mask].pack("x1LLSx2")
          send_request(s)
        end
        
        def change_active_pointer_grab (cursor, time, event_mask)
          change_active_pointer_grab!(cursor, time, event_mask).wait
        end
      end
      
      GrabKeyboardReply = Struct.new(:status)
      
      module Methods
        def grab_keyboard! (owner_events, grab_window, time, pointer_mode, keyboard_mode)
          s = 31.chr.encode('BINARY')
          s << [owner_events ? 1 : 0, Window.to_xid(self, grab_window), time, pointer_mode, keyboard_mode].pack("CLLCCx2")
          send_request(s) do |s|
            x = GrabKeyboardReply.new
            x.status, = s.slice!(0, 1).unpack("C")
            x.status
          end
        end
        
        def grab_keyboard (owner_events, grab_window, time, pointer_mode, keyboard_mode)
          grab_keyboard!(owner_events, grab_window, time, pointer_mode, keyboard_mode).wait
        end
      end
      
      module Methods
        def ungrab_keyboard! (time)
          s = 32.chr.encode('BINARY')
          s << [time].pack("x1L")
          send_request(s)
        end
        
        def ungrab_keyboard (time)
          ungrab_keyboard!(time).wait
        end
      end
      
      GRAB = {:any=>0}
      GRAB_I = {0=>:any}
      
      GRAB_ANY = 0
      
      GRAB.extend Alembic::ValueParamHelper
      
      module Methods
        def grab_key! (owner_events, grab_window, modifiers, key, pointer_mode, keyboard_mode)
          s = 33.chr.encode('BINARY')
          s << [owner_events ? 1 : 0, Window.to_xid(self, grab_window), modifiers, key, pointer_mode, keyboard_mode].pack("CLSCCCx3")
          send_request(s)
        end
        
        def grab_key (owner_events, grab_window, modifiers, key, pointer_mode, keyboard_mode)
          grab_key!(owner_events, grab_window, modifiers, key, pointer_mode, keyboard_mode).wait
        end
      end
      
      module Methods
        def ungrab_key! (key, grab_window, modifiers)
          s = 34.chr.encode('BINARY')
          s << [key, Window.to_xid(self, grab_window), modifiers].pack("CLSx2")
          send_request(s)
        end
        
        def ungrab_key (key, grab_window, modifiers)
          ungrab_key!(key, grab_window, modifiers).wait
        end
      end
      
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
      
      ALLOW.extend Alembic::ValueParamHelper
      
      module Methods
        def allow_events! (mode, time)
          s = 35.chr.encode('BINARY')
          s << [mode, time].pack("CL")
          send_request(s)
        end
        
        def allow_events (mode, time)
          allow_events!(mode, time).wait
        end
      end
      
      module Methods
        def grab_server! ()
          s = 36.chr.encode('BINARY')
          send_request(s)
        end
        
        def grab_server ()
          grab_server!().wait
        end
      end
      
      module Methods
        def ungrab_server! ()
          s = 37.chr.encode('BINARY')
          send_request(s)
        end
        
        def ungrab_server ()
          ungrab_server!().wait
        end
      end
      
      QueryPointerReply = Struct.new(:same_screen, :root, :child, :root_x, :root_y, :win_x, :win_y, :mask)
      
      module Methods
        def query_pointer! (window)
          s = 38.chr.encode('BINARY')
          s << [Window.to_xid(self, window)].pack("x1L")
          send_request(s) do |s|
            x = QueryPointerReply.new
            x.same_screen, x.root, x.child, x.root_x, x.root_y, x.win_x, x.win_y, x.mask, = s.slice!(0, 21).unpack("CLLssssSx2")
            x.same_screen = x.same_screen != 0
            x.root = Window[self, x.root]
            x.child = Window[self, x.child]
            x
          end
        end
        
        def query_pointer (window)
          query_pointer!(window).wait
        end
      end
      
      TIMECOORD = Struct.new(:time, :x, :y)
      
      module Methods
        def encode_timecoord (s, time, x, y)
          s << [time, x, y].pack("Lss")
          s
        end
      end
      
      module Methods
        def decode_timecoord (s)
          x = TIMECOORD.new
          x.time, x.x, x.y, = s.slice!(0, 8).unpack("Lss")
          x
        end
      end
      
      GetMotionEventsReply = Struct.new(:events_len, :events)
      
      module Methods
        def get_motion_events! (window, start, stop)
          s = 39.chr.encode('BINARY')
          s << [Window.to_xid(self, window), start, stop].pack("x1LLL")
          send_request(s) do |s|
            x = GetMotionEventsReply.new
            x.events_len, = s.slice!(0, 25).unpack("x1Lx20")
            x.events = x.events_len.times.map{decode_timecoord(s)}
            x.events
          end
        end
        
        def get_motion_events (window, start, stop)
          get_motion_events!(window, start, stop).wait
        end
      end
      
      TranslateCoordinatesReply = Struct.new(:same_screen, :child, :dst_x, :dst_y)
      
      module Methods
        def translate_coordinates! (src_window, dst_window, src_x, src_y)
          s = 40.chr.encode('BINARY')
          s << [Window.to_xid(self, src_window), Window.to_xid(self, dst_window), src_x, src_y].pack("x1LLss")
          send_request(s) do |s|
            x = TranslateCoordinatesReply.new
            x.same_screen, x.child, x.dst_x, x.dst_y, = s.slice!(0, 9).unpack("CLss")
            x.same_screen = x.same_screen != 0
            x.child = Window[self, x.child]
            x
          end
        end
        
        def translate_coordinates (src_window, dst_window, src_x, src_y)
          translate_coordinates!(src_window, dst_window, src_x, src_y).wait
        end
      end
      
      module Methods
        def warp_pointer! (src_window, dst_window, src_x, src_y, src_width, src_height, dst_x, dst_y)
          s = 41.chr.encode('BINARY')
          s << [Window.to_xid(self, src_window), Window.to_xid(self, dst_window), src_x, src_y, src_width, src_height, dst_x, dst_y].pack("x1LLssSSss")
          send_request(s)
        end
        
        def warp_pointer (src_window, dst_window, src_x, src_y, src_width, src_height, dst_x, dst_y)
          warp_pointer!(src_window, dst_window, src_x, src_y, src_width, src_height, dst_x, dst_y).wait
        end
      end
      
      INPUT_FOCUS = {:none=>0, :pointer_root=>1, :parent=>2, :follow_keyboard=>3}
      INPUT_FOCUS_I = {0=>:none, 1=>:pointer_root, 2=>:parent, 3=>:follow_keyboard}
      
      INPUT_FOCUS_NONE = 0
      INPUT_FOCUS_POINTER_ROOT = 1
      INPUT_FOCUS_PARENT = 2
      INPUT_FOCUS_FOLLOW_KEYBOARD = 3
      
      INPUT_FOCUS.extend Alembic::ValueParamHelper
      
      module Methods
        def set_input_focus! (revert_to, focus, time)
          s = 42.chr.encode('BINARY')
          s << [revert_to, Window.to_xid(self, focus), time].pack("CLL")
          send_request(s)
        end
        
        def set_input_focus (revert_to, focus, time)
          set_input_focus!(revert_to, focus, time).wait
        end
      end
      
      GetInputFocusReply = Struct.new(:revert_to, :focus)
      
      module Methods
        def get_input_focus! ()
          s = 43.chr.encode('BINARY')
          send_request(s) do |s|
            x = GetInputFocusReply.new
            x.revert_to, x.focus, = s.slice!(0, 5).unpack("CL")
            x.focus = Window[self, x.focus]
            x
          end
        end
        
        def get_input_focus ()
          get_input_focus!().wait
        end
      end
      
      QueryKeymapReply = Struct.new(:keys)
      
      module Methods
        def query_keymap! ()
          s = 44.chr.encode('BINARY')
          send_request(s) do |s|
            x = QueryKeymapReply.new
            s.slice!(0, 1)
            x.keys = s.slice!(0..32).unpack('C*')
            x.keys
          end
        end
        
        def query_keymap ()
          query_keymap!().wait
        end
      end
      
      module Methods
        def open_font! (fid, name)
          s = 45.chr.encode('BINARY')
          name_len = name.length
          s << [Font.to_xid(self, fid), name_len, pad(name)].pack("x1LSx2A*")
          send_request(s)
        end
        
        def open_font (fid, name)
          open_font!(fid, name).wait
        end
      end
      
      module Methods
        def close_font! (font)
          s = 46.chr.encode('BINARY')
          s << [Font.to_xid(self, font)].pack("x1L")
          send_request(s)
        end
        
        def close_font (font)
          close_font!(font).wait
        end
      end
      
      FONT_DRAW = {:left_to_right=>0, :right_to_left=>1}
      FONT_DRAW_I = {0=>:left_to_right, 1=>:right_to_left}
      
      FONT_DRAW_LEFT_TO_RIGHT = 0
      FONT_DRAW_RIGHT_TO_LEFT = 1
      
      FONT_DRAW.extend Alembic::ValueParamHelper
      
      FONTPROP = Struct.new(:name, :value)
      
      module Methods
        def encode_fontprop (s, name, value)
          s << [Atom.to_xid(self, name), value].pack("LL")
          s
        end
      end
      
      module Methods
        def decode_fontprop (s)
          x = FONTPROP.new
          x.name, x.value, = s.slice!(0, 8).unpack("LL")
          x.name = Atom[self, x.name]
          x
        end
      end
      
      CHARINFO = Struct.new(:left_side_bearing, :right_side_bearing, :character_width, :ascent, :descent, :attributes)
      
      module Methods
        def encode_charinfo (s, left_side_bearing, right_side_bearing, character_width, ascent, descent, attributes)
          s << [left_side_bearing, right_side_bearing, character_width, ascent, descent, attributes].pack("sssssS")
          s
        end
      end
      
      module Methods
        def decode_charinfo (s)
          x = CHARINFO.new
          x.left_side_bearing, x.right_side_bearing, x.character_width, x.ascent, x.descent, x.attributes, = s.slice!(0, 12).unpack("sssssS")
          x
        end
      end
      
      QueryFontReply = Struct.new(:min_bounds, :max_bounds, :min_char_or_byte2, :max_char_or_byte2, :default_char, :properties_len, :draw_direction, :min_byte1, :max_byte1, :all_chars_exist, :font_ascent, :font_descent, :char_infos_len, :properties, :char_infos)
      
      module Methods
        def query_font! (font)
          s = 47.chr.encode('BINARY')
          s << [Fontable.to_xid(self, font)].pack("x1L")
          send_request(s) do |s|
            x = QueryFontReply.new
            s.slice!(0, 1)
            x.min_bounds = decode_charinfo(s)
            s.slice!(0, 4)
            x.max_bounds = decode_charinfo(s)
            x.min_char_or_byte2, x.max_char_or_byte2, x.default_char, x.properties_len, x.draw_direction, x.min_byte1, x.max_byte1, x.all_chars_exist, x.font_ascent, x.font_descent, x.char_infos_len, = s.slice!(0, 24).unpack("x4SSSSCCCCssL")
            x.all_chars_exist = x.all_chars_exist != 0
            x.properties = x.properties_len.times.map{decode_fontprop(s)}
            x.char_infos = x.char_infos_len.times.map{decode_charinfo(s)}
            x
          end
        end
        
        def query_font (font)
          query_font!(font).wait
        end
      end
      
      QueryTextExtentsReply = Struct.new(:draw_direction, :font_ascent, :font_descent, :overall_ascent, :overall_descent, :overall_width, :overall_left, :overall_right)
      
      module Methods
        def query_text_extents! (font, string)
          s = 48.chr.encode('BINARY')
          s << raise('this doesn\'t work')
          s << [Fontable.to_xid(self, font)].pack("L")
          s << string.map{|x|encode_char2b(x)}
          send_request(s) do |s|
            x = QueryTextExtentsReply.new
            x.draw_direction, x.font_ascent, x.font_descent, x.overall_ascent, x.overall_descent, x.overall_width, x.overall_left, x.overall_right, = s.slice!(0, 21).unpack("Csssslll")
            x
          end
        end
        
        def query_text_extents (font, string)
          query_text_extents!(font, string).wait
        end
      end
      
      STR = Struct.new(:name_len, :name)
      
      module Methods
        def encode_str (s, name)
          name_len = name.length
          s << [name_len, pad(name)].pack("CA*")
          s
        end
      end
      
      module Methods
        def decode_str (s)
          x = STR.new
          x.name_len, = s.slice!(0, 1).unpack("C")
          x.name = s.slice!(0, x.name_len)
          x
        end
      end
      
      ListFontsReply = Struct.new(:names_len, :names)
      
      module Methods
        def list_fonts! (max_names, pattern)
          s = 49.chr.encode('BINARY')
          pattern_len = pattern.length
          s << [max_names, pattern_len, pad(pattern)].pack("x1SSA*")
          send_request(s) do |s|
            x = ListFontsReply.new
            x.names_len, = s.slice!(0, 25).unpack("x1Sx22")
            x.names = x.names_len.times.map{decode_str(s)}
            x.names
          end
        end
        
        def list_fonts (max_names, pattern)
          list_fonts!(max_names, pattern).wait
        end
      end
      
      ListFontsWithInfoReply = Struct.new(:name_len, :min_bounds, :max_bounds, :min_char_or_byte2, :max_char_or_byte2, :default_char, :properties_len, :draw_direction, :min_byte1, :max_byte1, :all_chars_exist, :font_ascent, :font_descent, :replies_hint, :properties, :name)
      
      module Methods
        def list_fonts_with_info! (max_names, pattern)
          s = 50.chr.encode('BINARY')
          pattern_len = pattern.length
          s << [max_names, pattern_len, pad(pattern)].pack("x1SSA*")
          send_request(s) do |s|
            x = ListFontsWithInfoReply.new
            x.name_len, = s.slice!(0, 1).unpack("C")
            x.min_bounds = decode_charinfo(s)
            s.slice!(0, 4)
            x.max_bounds = decode_charinfo(s)
            x.min_char_or_byte2, x.max_char_or_byte2, x.default_char, x.properties_len, x.draw_direction, x.min_byte1, x.max_byte1, x.all_chars_exist, x.font_ascent, x.font_descent, x.replies_hint, = s.slice!(0, 24).unpack("x4SSSSCCCCssL")
            x.all_chars_exist = x.all_chars_exist != 0
            x.properties = x.properties_len.times.map{decode_fontprop(s)}
            x.name = s.slice!(0, x.name_len)
            x
          end
        end
        
        def list_fonts_with_info (max_names, pattern)
          list_fonts_with_info!(max_names, pattern).wait
        end
      end
      
      module Methods
        def set_font_path! (font)
          s = 51.chr.encode('BINARY')
          font_qty = font.length
          s << [font_qty].pack("x1Sx2")
          s << font.map{|x|encode_str(x)}
          send_request(s)
        end
        
        def set_font_path (font)
          set_font_path!(font).wait
        end
      end
      
      GetFontPathReply = Struct.new(:path_len, :path)
      
      module Methods
        def get_font_path! ()
          s = 52.chr.encode('BINARY')
          send_request(s) do |s|
            x = GetFontPathReply.new
            x.path_len, = s.slice!(0, 25).unpack("x1Sx22")
            x.path = x.path_len.times.map{decode_str(s)}
            x.path
          end
        end
        
        def get_font_path ()
          get_font_path!().wait
        end
      end
      
      module Methods
        def create_pixmap! (depth, pid, drawable, width, height)
          s = 53.chr.encode('BINARY')
          s << [depth, Pixmap.to_xid(self, pid), Drawable.to_xid(self, drawable), width, height].pack("CLLSS")
          send_request(s)
        end
        
        def create_pixmap (depth, pid, drawable, width, height)
          create_pixmap!(depth, pid, drawable, width, height).wait
        end
      end
      
      module Methods
        def free_pixmap! (pixmap)
          s = 54.chr.encode('BINARY')
          s << [Pixmap.to_xid(self, pixmap)].pack("x1L")
          send_request(s)
        end
        
        def free_pixmap (pixmap)
          free_pixmap!(pixmap).wait
        end
      end
      
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
      
      GC.extend Alembic::ValueParamHelper
      
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
      
      GX.extend Alembic::ValueParamHelper
      
      LINE_STYLE = {:solid=>0, :on_off_dash=>1, :double_dash=>2}
      LINE_STYLE_I = {0=>:solid, 1=>:on_off_dash, 2=>:double_dash}
      
      LINE_STYLE_SOLID = 0
      LINE_STYLE_ON_OFF_DASH = 1
      LINE_STYLE_DOUBLE_DASH = 2
      
      LINE_STYLE.extend Alembic::ValueParamHelper
      
      CAP_STYLE = {:not_last=>0, :butt=>1, :round=>2, :projecting=>3}
      CAP_STYLE_I = {0=>:not_last, 1=>:butt, 2=>:round, 3=>:projecting}
      
      CAP_STYLE_NOT_LAST = 0
      CAP_STYLE_BUTT = 1
      CAP_STYLE_ROUND = 2
      CAP_STYLE_PROJECTING = 3
      
      CAP_STYLE.extend Alembic::ValueParamHelper
      
      JOIN_STYLE = {:miter=>0, :round=>1, :bevel=>2}
      JOIN_STYLE_I = {0=>:miter, 1=>:round, 2=>:bevel}
      
      JOIN_STYLE_MITER = 0
      JOIN_STYLE_ROUND = 1
      JOIN_STYLE_BEVEL = 2
      
      JOIN_STYLE.extend Alembic::ValueParamHelper
      
      FILL_STYLE = {:solid=>0, :tiled=>1, :stippled=>2, :opaque_stippled=>3}
      FILL_STYLE_I = {0=>:solid, 1=>:tiled, 2=>:stippled, 3=>:opaque_stippled}
      
      FILL_STYLE_SOLID = 0
      FILL_STYLE_TILED = 1
      FILL_STYLE_STIPPLED = 2
      FILL_STYLE_OPAQUE_STIPPLED = 3
      
      FILL_STYLE.extend Alembic::ValueParamHelper
      
      FILL_RULE = {:even_odd=>0, :winding=>1}
      FILL_RULE_I = {0=>:even_odd, 1=>:winding}
      
      FILL_RULE_EVEN_ODD = 0
      FILL_RULE_WINDING = 1
      
      FILL_RULE.extend Alembic::ValueParamHelper
      
      SUBWINDOW_MODE = {:clip_by_children=>0, :include_inferiors=>1}
      SUBWINDOW_MODE_I = {0=>:clip_by_children, 1=>:include_inferiors}
      
      SUBWINDOW_MODE_CLIP_BY_CHILDREN = 0
      SUBWINDOW_MODE_INCLUDE_INFERIORS = 1
      
      SUBWINDOW_MODE.extend Alembic::ValueParamHelper
      
      ARC_MODE = {:chord=>0, :pie_slice=>1}
      ARC_MODE_I = {0=>:chord, 1=>:pie_slice}
      
      ARC_MODE_CHORD = 0
      ARC_MODE_PIE_SLICE = 1
      
      ARC_MODE.extend Alembic::ValueParamHelper
      
      module Methods
        def create_gc! (cid, drawable, value_mask, *value_list)
          s = 55.chr.encode('BINARY')
          s << [Gcontext.to_xid(self, cid), Drawable.to_xid(self, drawable), value_mask, *value_list].pack("x1LLLL*")
          send_request(s)
        end
        
        def create_gc (cid, drawable, value_mask, *value_list)
          create_gc!(cid, drawable, value_mask, *value_list).wait
        end
      end
      
      module Methods
        def change_gc! (gc, value_mask, *value_list)
          s = 56.chr.encode('BINARY')
          s << [Gcontext.to_xid(self, gc), value_mask, *value_list].pack("x1LLL*")
          send_request(s)
        end
        
        def change_gc (gc, value_mask, *value_list)
          change_gc!(gc, value_mask, *value_list).wait
        end
      end
      
      module Methods
        def copy_gc! (src_gc, dst_gc, value_mask)
          s = 57.chr.encode('BINARY')
          s << [Gcontext.to_xid(self, src_gc), Gcontext.to_xid(self, dst_gc), value_mask].pack("x1LLL")
          send_request(s)
        end
        
        def copy_gc (src_gc, dst_gc, value_mask)
          copy_gc!(src_gc, dst_gc, value_mask).wait
        end
      end
      
      module Methods
        def set_dashes! (gc, dash_offset, dashes)
          s = 58.chr.encode('BINARY')
          dashes_len = dashes.length
          s << [Gcontext.to_xid(self, gc), dash_offset, dashes_len, *dashes].pack("x1LSSC*")
          send_request(s)
        end
        
        def set_dashes (gc, dash_offset, dashes)
          set_dashes!(gc, dash_offset, dashes).wait
        end
      end
      
      CLIP_ORDERING = {:unsorted=>0, :y_sorted=>1, :yx_sorted=>2, :yx_banded=>3}
      CLIP_ORDERING_I = {0=>:unsorted, 1=>:y_sorted, 2=>:yx_sorted, 3=>:yx_banded}
      
      CLIP_ORDERING_UNSORTED = 0
      CLIP_ORDERING_Y_SORTED = 1
      CLIP_ORDERING_YX_SORTED = 2
      CLIP_ORDERING_YX_BANDED = 3
      
      CLIP_ORDERING.extend Alembic::ValueParamHelper
      
      module Methods
        def set_clip_rectangles! (ordering, gc, clip_x_origin, clip_y_origin, rectangles)
          s = 59.chr.encode('BINARY')
          s << [ordering, Gcontext.to_xid(self, gc), clip_x_origin, clip_y_origin].pack("CLss")
          s << rectangles.map{|x|encode_rectangle(x)}
          send_request(s)
        end
        
        def set_clip_rectangles (ordering, gc, clip_x_origin, clip_y_origin, rectangles)
          set_clip_rectangles!(ordering, gc, clip_x_origin, clip_y_origin, rectangles).wait
        end
      end
      
      module Methods
        def free_gc! (gc)
          s = 60.chr.encode('BINARY')
          s << [Gcontext.to_xid(self, gc)].pack("x1L")
          send_request(s)
        end
        
        def free_gc (gc)
          free_gc!(gc).wait
        end
      end
      
      module Methods
        def clear_area! (exposures, window, x, y, width, height)
          s = 61.chr.encode('BINARY')
          s << [exposures ? 1 : 0, Window.to_xid(self, window), x, y, width, height].pack("CLssSS")
          send_request(s)
        end
        
        def clear_area (exposures, window, x, y, width, height)
          clear_area!(exposures, window, x, y, width, height).wait
        end
      end
      
      module Methods
        def copy_area! (src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height)
          s = 62.chr.encode('BINARY')
          s << [Drawable.to_xid(self, src_drawable), Drawable.to_xid(self, dst_drawable), Gcontext.to_xid(self, gc), src_x, src_y, dst_x, dst_y, width, height].pack("x1LLLssssSS")
          send_request(s)
        end
        
        def copy_area (src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height)
          copy_area!(src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height).wait
        end
      end
      
      module Methods
        def copy_plane! (src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height, bit_plane)
          s = 63.chr.encode('BINARY')
          s << [Drawable.to_xid(self, src_drawable), Drawable.to_xid(self, dst_drawable), Gcontext.to_xid(self, gc), src_x, src_y, dst_x, dst_y, width, height, bit_plane].pack("x1LLLssssSSL")
          send_request(s)
        end
        
        def copy_plane (src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height, bit_plane)
          copy_plane!(src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height, bit_plane).wait
        end
      end
      
      COORD_MODE = {:origin=>0, :previous=>1}
      COORD_MODE_I = {0=>:origin, 1=>:previous}
      
      COORD_MODE_ORIGIN = 0
      COORD_MODE_PREVIOUS = 1
      
      COORD_MODE.extend Alembic::ValueParamHelper
      
      module Methods
        def poly_point! (coordinate_mode, drawable, gc, points)
          s = 64.chr.encode('BINARY')
          s << [coordinate_mode, Drawable.to_xid(self, drawable), Gcontext.to_xid(self, gc)].pack("CLL")
          s << points.map{|x|encode_point(x)}
          send_request(s)
        end
        
        def poly_point (coordinate_mode, drawable, gc, points)
          poly_point!(coordinate_mode, drawable, gc, points).wait
        end
      end
      
      module Methods
        def poly_line! (coordinate_mode, drawable, gc, points)
          s = 65.chr.encode('BINARY')
          s << [coordinate_mode, Drawable.to_xid(self, drawable), Gcontext.to_xid(self, gc)].pack("CLL")
          s << points.map{|x|encode_point(x)}
          send_request(s)
        end
        
        def poly_line (coordinate_mode, drawable, gc, points)
          poly_line!(coordinate_mode, drawable, gc, points).wait
        end
      end
      
      SEGMENT = Struct.new(:x1, :y1, :x2, :y2)
      
      module Methods
        def encode_segment (s, x1, y1, x2, y2)
          s << [x1, y1, x2, y2].pack("ssss")
          s
        end
      end
      
      module Methods
        def decode_segment (s)
          x = SEGMENT.new
          x.x1, x.y1, x.x2, x.y2, = s.slice!(0, 8).unpack("ssss")
          x
        end
      end
      
      module Methods
        def poly_segment! (drawable, gc, segments)
          s = 66.chr.encode('BINARY')
          s << [Drawable.to_xid(self, drawable), Gcontext.to_xid(self, gc)].pack("x1LL")
          s << segments.map{|x|encode_segment(x)}
          send_request(s)
        end
        
        def poly_segment (drawable, gc, segments)
          poly_segment!(drawable, gc, segments).wait
        end
      end
      
      module Methods
        def poly_rectangle! (drawable, gc, rectangles)
          s = 67.chr.encode('BINARY')
          s << [Drawable.to_xid(self, drawable), Gcontext.to_xid(self, gc)].pack("x1LL")
          s << rectangles.map{|x|encode_rectangle(x)}
          send_request(s)
        end
        
        def poly_rectangle (drawable, gc, rectangles)
          poly_rectangle!(drawable, gc, rectangles).wait
        end
      end
      
      module Methods
        def poly_arc! (drawable, gc, arcs)
          s = 68.chr.encode('BINARY')
          s << [Drawable.to_xid(self, drawable), Gcontext.to_xid(self, gc)].pack("x1LL")
          s << arcs.map{|x|encode_arc(x)}
          send_request(s)
        end
        
        def poly_arc (drawable, gc, arcs)
          poly_arc!(drawable, gc, arcs).wait
        end
      end
      
      POLY_SHAPE = {:complex=>0, :nonconvex=>1, :convex=>2}
      POLY_SHAPE_I = {0=>:complex, 1=>:nonconvex, 2=>:convex}
      
      POLY_SHAPE_COMPLEX = 0
      POLY_SHAPE_NONCONVEX = 1
      POLY_SHAPE_CONVEX = 2
      
      POLY_SHAPE.extend Alembic::ValueParamHelper
      
      module Methods
        def fill_poly! (drawable, gc, shape, coordinate_mode, points)
          s = 69.chr.encode('BINARY')
          s << [Drawable.to_xid(self, drawable), Gcontext.to_xid(self, gc), shape, coordinate_mode].pack("x1LLCCx2")
          s << points.map{|x|encode_point(x)}
          send_request(s)
        end
        
        def fill_poly (drawable, gc, shape, coordinate_mode, points)
          fill_poly!(drawable, gc, shape, coordinate_mode, points).wait
        end
      end
      
      module Methods
        def poly_fill_rectangle! (drawable, gc, rectangles)
          s = 70.chr.encode('BINARY')
          s << [Drawable.to_xid(self, drawable), Gcontext.to_xid(self, gc)].pack("x1LL")
          s << rectangles.map{|x|encode_rectangle(x)}
          send_request(s)
        end
        
        def poly_fill_rectangle (drawable, gc, rectangles)
          poly_fill_rectangle!(drawable, gc, rectangles).wait
        end
      end
      
      module Methods
        def poly_fill_arc! (drawable, gc, arcs)
          s = 71.chr.encode('BINARY')
          s << [Drawable.to_xid(self, drawable), Gcontext.to_xid(self, gc)].pack("x1LL")
          s << arcs.map{|x|encode_arc(x)}
          send_request(s)
        end
        
        def poly_fill_arc (drawable, gc, arcs)
          poly_fill_arc!(drawable, gc, arcs).wait
        end
      end
      
      IMAGE_FORMAT = {:xy_bitmap=>0, :xy_pixmap=>1, :z_pixmap=>2}
      IMAGE_FORMAT_I = {0=>:xy_bitmap, 1=>:xy_pixmap, 2=>:z_pixmap}
      
      IMAGE_FORMAT_XY_BITMAP = 0
      IMAGE_FORMAT_XY_PIXMAP = 1
      IMAGE_FORMAT_Z_PIXMAP = 2
      
      IMAGE_FORMAT.extend Alembic::ValueParamHelper
      
      module Methods
        def put_image! (format, drawable, gc, width, height, dst_x, dst_y, left_pad, depth, data)
          s = 72.chr.encode('BINARY')
          s << [format, Drawable.to_xid(self, drawable), Gcontext.to_xid(self, gc), width, height, dst_x, dst_y, left_pad, depth, pad(data)].pack("CLLSSssCCx2A*")
          send_request(s)
        end
        
        def put_image (format, drawable, gc, width, height, dst_x, dst_y, left_pad, depth, data)
          put_image!(format, drawable, gc, width, height, dst_x, dst_y, left_pad, depth, data).wait
        end
      end
      
      GetImageReply = Struct.new(:depth, :visual, :data)
      
      module Methods
        def get_image! (format, drawable, x, y, width, height, plane_mask)
          s = 73.chr.encode('BINARY')
          s << [format, Drawable.to_xid(self, drawable), x, y, width, height, plane_mask].pack("CLssSSL")
          send_request(s) do |s|
            x = GetImageReply.new
            x.depth, x.visual, = s.slice!(0, 25).unpack("CLx20")
            x.data = s.slice!(0, (x.length * 4))
            x
          end
        end
        
        def get_image (format, drawable, x, y, width, height, plane_mask)
          get_image!(format, drawable, x, y, width, height, plane_mask).wait
        end
      end
      
      module Methods
        def poly_text8! (drawable, gc, x, y, items)
          s = 74.chr.encode('BINARY')
          s << [Drawable.to_xid(self, drawable), Gcontext.to_xid(self, gc), x, y, pad(items)].pack("x1LLssA*")
          send_request(s)
        end
        
        def poly_text8 (drawable, gc, x, y, items)
          poly_text8!(drawable, gc, x, y, items).wait
        end
      end
      
      module Methods
        def poly_text16! (drawable, gc, x, y, items)
          s = 75.chr.encode('BINARY')
          s << [Drawable.to_xid(self, drawable), Gcontext.to_xid(self, gc), x, y, pad(items)].pack("x1LLssA*")
          send_request(s)
        end
        
        def poly_text16 (drawable, gc, x, y, items)
          poly_text16!(drawable, gc, x, y, items).wait
        end
      end
      
      module Methods
        def image_text8! (drawable, gc, x, y, string)
          s = 76.chr.encode('BINARY')
          string_len = string.length
          s << [string_len, Drawable.to_xid(self, drawable), Gcontext.to_xid(self, gc), x, y, pad(string)].pack("CLLssA*")
          send_request(s)
        end
        
        def image_text8 (drawable, gc, x, y, string)
          image_text8!(drawable, gc, x, y, string).wait
        end
      end
      
      module Methods
        def image_text16! (drawable, gc, x, y, string)
          s = 77.chr.encode('BINARY')
          string_len = string.length
          s << [string_len, Drawable.to_xid(self, drawable), Gcontext.to_xid(self, gc), x, y].pack("CLLss")
          s << string.map{|x|encode_char2b(x)}
          send_request(s)
        end
        
        def image_text16 (drawable, gc, x, y, string)
          image_text16!(drawable, gc, x, y, string).wait
        end
      end
      
      COLORMAP_ALLOC = {:none=>0, :all=>1}
      COLORMAP_ALLOC_I = {0=>:none, 1=>:all}
      
      COLORMAP_ALLOC_NONE = 0
      COLORMAP_ALLOC_ALL = 1
      
      COLORMAP_ALLOC.extend Alembic::ValueParamHelper
      
      module Methods
        def create_colormap! (alloc, mid, window, visual)
          s = 78.chr.encode('BINARY')
          s << [alloc, Colormap.to_xid(self, mid), Window.to_xid(self, window), visual].pack("CLLL")
          send_request(s)
        end
        
        def create_colormap (alloc, mid, window, visual)
          create_colormap!(alloc, mid, window, visual).wait
        end
      end
      
      module Methods
        def free_colormap! (cmap)
          s = 79.chr.encode('BINARY')
          s << [Colormap.to_xid(self, cmap)].pack("x1L")
          send_request(s)
        end
        
        def free_colormap (cmap)
          free_colormap!(cmap).wait
        end
      end
      
      module Methods
        def copy_colormap_and_free! (mid, src_cmap)
          s = 80.chr.encode('BINARY')
          s << [Colormap.to_xid(self, mid), Colormap.to_xid(self, src_cmap)].pack("x1LL")
          send_request(s)
        end
        
        def copy_colormap_and_free (mid, src_cmap)
          copy_colormap_and_free!(mid, src_cmap).wait
        end
      end
      
      module Methods
        def install_colormap! (cmap)
          s = 81.chr.encode('BINARY')
          s << [Colormap.to_xid(self, cmap)].pack("x1L")
          send_request(s)
        end
        
        def install_colormap (cmap)
          install_colormap!(cmap).wait
        end
      end
      
      module Methods
        def uninstall_colormap! (cmap)
          s = 82.chr.encode('BINARY')
          s << [Colormap.to_xid(self, cmap)].pack("x1L")
          send_request(s)
        end
        
        def uninstall_colormap (cmap)
          uninstall_colormap!(cmap).wait
        end
      end
      
      ListInstalledColormapsReply = Struct.new(:cmaps_len, :cmaps)
      
      module Methods
        def list_installed_colormaps! (window)
          s = 83.chr.encode('BINARY')
          s << [Window.to_xid(self, window)].pack("x1L")
          send_request(s) do |s|
            x = ListInstalledColormapsReply.new
            x.cmaps_len, *x.cmaps = s.unpack("x1Sx22L*")
            x.cmaps = x.cmaps ? x.cmaps.map{|x|Colormap[self, x]} : []
            x.cmaps
          end
        end
        
        def list_installed_colormaps (window)
          list_installed_colormaps!(window).wait
        end
      end
      
      AllocColorReply = Struct.new(:red, :green, :blue, :pixel)
      
      module Methods
        def alloc_color! (cmap, red, green, blue)
          s = 84.chr.encode('BINARY')
          s << [Colormap.to_xid(self, cmap), red, green, blue].pack("x1LSSSx2")
          send_request(s) do |s|
            x = AllocColorReply.new
            x.red, x.green, x.blue, x.pixel, = s.slice!(0, 13).unpack("x1SSSx2L")
            x
          end
        end
        
        def alloc_color (cmap, red, green, blue)
          alloc_color!(cmap, red, green, blue).wait
        end
      end
      
      AllocNamedColorReply = Struct.new(:pixel, :exact_red, :exact_green, :exact_blue, :visual_red, :visual_green, :visual_blue)
      
      module Methods
        def alloc_named_color! (cmap, name)
          s = 85.chr.encode('BINARY')
          name_len = name.length
          s << [Colormap.to_xid(self, cmap), name_len, pad(name)].pack("x1LSx2A*")
          send_request(s) do |s|
            x = AllocNamedColorReply.new
            x.pixel, x.exact_red, x.exact_green, x.exact_blue, x.visual_red, x.visual_green, x.visual_blue, = s.slice!(0, 17).unpack("x1LSSSSSS")
            x
          end
        end
        
        def alloc_named_color (cmap, name)
          alloc_named_color!(cmap, name).wait
        end
      end
      
      AllocColorCellsReply = Struct.new(:pixels_len, :masks_len, :pixels, :masks)
      
      module Methods
        def alloc_color_cells! (contiguous, cmap, colors, planes)
          s = 86.chr.encode('BINARY')
          s << [contiguous ? 1 : 0, Colormap.to_xid(self, cmap), colors, planes].pack("CLSS")
          send_request(s) do |s|
            x = AllocColorCellsReply.new
            x.pixels_len, x.masks_len, = s.slice!(0, 25).unpack("x1SSx20")
            x.pixels = s.slice!(0..4*(x.pixels_len)).unpack('L*')
            *x.masks = s.unpack("L*")
            x
          end
        end
        
        def alloc_color_cells (contiguous, cmap, colors, planes)
          alloc_color_cells!(contiguous, cmap, colors, planes).wait
        end
      end
      
      AllocColorPlanesReply = Struct.new(:pixels_len, :red_mask, :green_mask, :blue_mask, :pixels)
      
      module Methods
        def alloc_color_planes! (contiguous, cmap, colors, reds, greens, blues)
          s = 87.chr.encode('BINARY')
          s << [contiguous ? 1 : 0, Colormap.to_xid(self, cmap), colors, reds, greens, blues].pack("CLSSSS")
          send_request(s) do |s|
            x = AllocColorPlanesReply.new
            x.pixels_len, x.red_mask, x.green_mask, x.blue_mask, *x.pixels = s.unpack("x1Sx2LLLx8L*")
            x
          end
        end
        
        def alloc_color_planes (contiguous, cmap, colors, reds, greens, blues)
          alloc_color_planes!(contiguous, cmap, colors, reds, greens, blues).wait
        end
      end
      
      module Methods
        def free_colors! (cmap, plane_mask, pixels)
          s = 88.chr.encode('BINARY')
          s << [Colormap.to_xid(self, cmap), plane_mask, *pixels].pack("x1LLL*")
          send_request(s)
        end
        
        def free_colors (cmap, plane_mask, pixels)
          free_colors!(cmap, plane_mask, pixels).wait
        end
      end
      
      COLOR_FLAG = {:red=>1, :green=>2, :blue=>4}
      COLOR_FLAG_I = {1=>:red, 2=>:green, 4=>:blue}
      
      COLOR_FLAG_RED = 1
      COLOR_FLAG_GREEN = 2
      COLOR_FLAG_BLUE = 4
      
      COLOR_FLAG.extend Alembic::ValueParamHelper
      
      COLORITEM = Struct.new(:pixel, :red, :green, :blue, :flags)
      
      module Methods
        def encode_coloritem (s, pixel, red, green, blue, flags)
          s << [pixel, red, green, blue, flags].pack("LSSSCx1")
          s
        end
      end
      
      module Methods
        def decode_coloritem (s)
          x = COLORITEM.new
          x.pixel, x.red, x.green, x.blue, x.flags, = s.slice!(0, 12).unpack("LSSSCx1")
          x
        end
      end
      
      module Methods
        def store_colors! (cmap, items)
          s = 89.chr.encode('BINARY')
          s << [Colormap.to_xid(self, cmap)].pack("x1L")
          s << items.map{|x|encode_coloritem(x)}
          send_request(s)
        end
        
        def store_colors (cmap, items)
          store_colors!(cmap, items).wait
        end
      end
      
      module Methods
        def store_named_color! (flags, cmap, pixel, name)
          s = 90.chr.encode('BINARY')
          name_len = name.length
          s << [flags, Colormap.to_xid(self, cmap), pixel, name_len, pad(name)].pack("CLLSx2A*")
          send_request(s)
        end
        
        def store_named_color (flags, cmap, pixel, name)
          store_named_color!(flags, cmap, pixel, name).wait
        end
      end
      
      RGB = Struct.new(:red, :green, :blue)
      
      module Methods
        def encode_rgb (s, red, green, blue)
          s << [red, green, blue].pack("SSSx2")
          s
        end
      end
      
      module Methods
        def decode_rgb (s)
          x = RGB.new
          x.red, x.green, x.blue, = s.slice!(0, 8).unpack("SSSx2")
          x
        end
      end
      
      QueryColorsReply = Struct.new(:colors_len, :colors)
      
      module Methods
        def query_colors! (cmap, pixels)
          s = 91.chr.encode('BINARY')
          s << [Colormap.to_xid(self, cmap), *pixels].pack("x1LL*")
          send_request(s) do |s|
            x = QueryColorsReply.new
            x.colors_len, = s.slice!(0, 25).unpack("x1Sx22")
            x.colors = x.colors_len.times.map{decode_rgb(s)}
            x.colors
          end
        end
        
        def query_colors (cmap, pixels)
          query_colors!(cmap, pixels).wait
        end
      end
      
      LookupColorReply = Struct.new(:exact_red, :exact_green, :exact_blue, :visual_red, :visual_green, :visual_blue)
      
      module Methods
        def lookup_color! (cmap, name)
          s = 92.chr.encode('BINARY')
          name_len = name.length
          s << [Colormap.to_xid(self, cmap), name_len, pad(name)].pack("x1LSx2A*")
          send_request(s) do |s|
            x = LookupColorReply.new
            x.exact_red, x.exact_green, x.exact_blue, x.visual_red, x.visual_green, x.visual_blue, = s.slice!(0, 13).unpack("x1SSSSSS")
            x
          end
        end
        
        def lookup_color (cmap, name)
          lookup_color!(cmap, name).wait
        end
      end
      
      PIXMAP = {:none=>0}
      PIXMAP_I = {0=>:none}
      
      PIXMAP_NONE = 0
      
      PIXMAP.extend Alembic::ValueParamHelper
      
      module Methods
        def create_cursor! (cid, source, mask, fore_red, fore_green, fore_blue, back_red, back_green, back_blue, x, y)
          s = 93.chr.encode('BINARY')
          s << [Cursor.to_xid(self, cid), Pixmap.to_xid(self, source), Pixmap.to_xid(self, mask), fore_red, fore_green, fore_blue, back_red, back_green, back_blue, x, y].pack("x1LLLSSSSSSSS")
          send_request(s)
        end
        
        def create_cursor (cid, source, mask, fore_red, fore_green, fore_blue, back_red, back_green, back_blue, x, y)
          create_cursor!(cid, source, mask, fore_red, fore_green, fore_blue, back_red, back_green, back_blue, x, y).wait
        end
      end
      
      FONT = {:none=>0}
      FONT_I = {0=>:none}
      
      FONT_NONE = 0
      
      FONT.extend Alembic::ValueParamHelper
      
      module Methods
        def create_glyph_cursor! (cid, source_font, mask_font, source_char, mask_char, fore_red, fore_green, fore_blue, back_red, back_green, back_blue)
          s = 94.chr.encode('BINARY')
          s << [Cursor.to_xid(self, cid), Font.to_xid(self, source_font), Font.to_xid(self, mask_font), source_char, mask_char, fore_red, fore_green, fore_blue, back_red, back_green, back_blue].pack("x1LLLSSSSSSSS")
          send_request(s)
        end
        
        def create_glyph_cursor (cid, source_font, mask_font, source_char, mask_char, fore_red, fore_green, fore_blue, back_red, back_green, back_blue)
          create_glyph_cursor!(cid, source_font, mask_font, source_char, mask_char, fore_red, fore_green, fore_blue, back_red, back_green, back_blue).wait
        end
      end
      
      module Methods
        def free_cursor! (cursor)
          s = 95.chr.encode('BINARY')
          s << [Cursor.to_xid(self, cursor)].pack("x1L")
          send_request(s)
        end
        
        def free_cursor (cursor)
          free_cursor!(cursor).wait
        end
      end
      
      module Methods
        def recolor_cursor! (cursor, fore_red, fore_green, fore_blue, back_red, back_green, back_blue)
          s = 96.chr.encode('BINARY')
          s << [Cursor.to_xid(self, cursor), fore_red, fore_green, fore_blue, back_red, back_green, back_blue].pack("x1LSSSSSS")
          send_request(s)
        end
        
        def recolor_cursor (cursor, fore_red, fore_green, fore_blue, back_red, back_green, back_blue)
          recolor_cursor!(cursor, fore_red, fore_green, fore_blue, back_red, back_green, back_blue).wait
        end
      end
      
      QUERY_SHAPE_OF = {:largest_cursor=>0, :fastest_tile=>1, :fastest_stipple=>2}
      QUERY_SHAPE_OF_I = {0=>:largest_cursor, 1=>:fastest_tile, 2=>:fastest_stipple}
      
      QUERY_SHAPE_OF_LARGEST_CURSOR = 0
      QUERY_SHAPE_OF_FASTEST_TILE = 1
      QUERY_SHAPE_OF_FASTEST_STIPPLE = 2
      
      QUERY_SHAPE_OF.extend Alembic::ValueParamHelper
      
      QueryBestSizeReply = Struct.new(:width, :height)
      
      module Methods
        def query_best_size! (klass, drawable, width, height)
          s = 97.chr.encode('BINARY')
          s << [klass, Drawable.to_xid(self, drawable), width, height].pack("CLSS")
          send_request(s) do |s|
            x = QueryBestSizeReply.new
            x.width, x.height, = s.slice!(0, 5).unpack("x1SS")
            x
          end
        end
        
        def query_best_size (klass, drawable, width, height)
          query_best_size!(klass, drawable, width, height).wait
        end
      end
      
      QueryExtensionReply = Struct.new(:present, :major_opcode, :first_event, :first_error)
      
      module Methods
        def query_extension! (name)
          s = 98.chr.encode('BINARY')
          name_len = name.length
          s << [name_len, pad(name)].pack("x1Sx2A*")
          send_request(s) do |s|
            x = QueryExtensionReply.new
            x.present, x.major_opcode, x.first_event, x.first_error, = s.slice!(0, 5).unpack("x1CCCC")
            x.present = x.present != 0
            x
          end
        end
        
        def query_extension (name)
          query_extension!(name).wait
        end
      end
      
      ListExtensionsReply = Struct.new(:names_len, :names)
      
      module Methods
        def list_extensions! ()
          s = 99.chr.encode('BINARY')
          send_request(s) do |s|
            x = ListExtensionsReply.new
            x.names_len, = s.slice!(0, 25).unpack("Cx24")
            x.names = x.names_len.times.map{decode_str(s)}
            x.names
          end
        end
        
        def list_extensions ()
          list_extensions!().wait
        end
      end
      
      module Methods
        def change_keyboard_mapping! (keycode_count, first_keycode, keysyms_per_keycode, keysyms)
          s = 100.chr.encode('BINARY')
          s << [keycode_count, first_keycode, keysyms_per_keycode, *keysyms].pack("CCCx2L*")
          send_request(s)
        end
        
        def change_keyboard_mapping (keycode_count, first_keycode, keysyms_per_keycode, keysyms)
          change_keyboard_mapping!(keycode_count, first_keycode, keysyms_per_keycode, keysyms).wait
        end
      end
      
      GetKeyboardMappingReply = Struct.new(:keysyms_per_keycode, :keysyms)
      
      module Methods
        def get_keyboard_mapping! (first_keycode, count)
          s = 101.chr.encode('BINARY')
          s << [first_keycode, count].pack("x1CC")
          send_request(s) do |s|
            x = GetKeyboardMappingReply.new
            x.keysyms_per_keycode, *x.keysyms = s.unpack("Cx24L*")
            x
          end
        end
        
        def get_keyboard_mapping (first_keycode, count)
          get_keyboard_mapping!(first_keycode, count).wait
        end
      end
      
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
      
      KB.extend Alembic::ValueParamHelper
      
      LED_MODE = {:off=>0, :on=>1}
      LED_MODE_I = {0=>:off, 1=>:on}
      
      LED_MODE_OFF = 0
      LED_MODE_ON = 1
      
      LED_MODE.extend Alembic::ValueParamHelper
      
      AUTO_REPEAT_MODE = {:off=>0, :on=>1, :default=>2}
      AUTO_REPEAT_MODE_I = {0=>:off, 1=>:on, 2=>:default}
      
      AUTO_REPEAT_MODE_OFF = 0
      AUTO_REPEAT_MODE_ON = 1
      AUTO_REPEAT_MODE_DEFAULT = 2
      
      AUTO_REPEAT_MODE.extend Alembic::ValueParamHelper
      
      module Methods
        def change_keyboard_control! (value_mask, *value_list)
          s = 102.chr.encode('BINARY')
          s << [value_mask, *value_list].pack("x1LL*")
          send_request(s)
        end
        
        def change_keyboard_control (value_mask, *value_list)
          change_keyboard_control!(value_mask, *value_list).wait
        end
      end
      
      GetKeyboardControlReply = Struct.new(:global_auto_repeat, :led_mask, :key_click_percent, :bell_percent, :bell_pitch, :bell_duration, :auto_repeats)
      
      module Methods
        def get_keyboard_control! ()
          s = 103.chr.encode('BINARY')
          send_request(s) do |s|
            x = GetKeyboardControlReply.new
            x.global_auto_repeat, x.led_mask, x.key_click_percent, x.bell_percent, x.bell_pitch, x.bell_duration, = s.slice!(0, 13).unpack("CLCCSSx2")
            x.auto_repeats = s.slice!(0..32).unpack('C*')
            x
          end
        end
        
        def get_keyboard_control ()
          get_keyboard_control!().wait
        end
      end
      
      module Methods
        def bell! (percent)
          s = 104.chr.encode('BINARY')
          s << [percent].pack("c")
          send_request(s)
        end
        
        def bell (percent)
          bell!(percent).wait
        end
      end
      
      module Methods
        def change_pointer_control! (acceleration_numerator, acceleration_denominator, threshold, do_acceleration, do_threshold)
          s = 105.chr.encode('BINARY')
          s << [acceleration_numerator, acceleration_denominator, threshold, do_acceleration ? 1 : 0, do_threshold ? 1 : 0].pack("x1sssCC")
          send_request(s)
        end
        
        def change_pointer_control (acceleration_numerator, acceleration_denominator, threshold, do_acceleration, do_threshold)
          change_pointer_control!(acceleration_numerator, acceleration_denominator, threshold, do_acceleration, do_threshold).wait
        end
      end
      
      GetPointerControlReply = Struct.new(:acceleration_numerator, :acceleration_denominator, :threshold)
      
      module Methods
        def get_pointer_control! ()
          s = 106.chr.encode('BINARY')
          send_request(s) do |s|
            x = GetPointerControlReply.new
            x.acceleration_numerator, x.acceleration_denominator, x.threshold, = s.slice!(0, 25).unpack("x1SSSx18")
            x
          end
        end
        
        def get_pointer_control ()
          get_pointer_control!().wait
        end
      end
      
      BLANKING = {:not_preferred=>0, :preferred=>1, :default=>2}
      BLANKING_I = {0=>:not_preferred, 1=>:preferred, 2=>:default}
      
      BLANKING_NOT_PREFERRED = 0
      BLANKING_PREFERRED = 1
      BLANKING_DEFAULT = 2
      
      BLANKING.extend Alembic::ValueParamHelper
      
      EXPOSURES = {:not_allowed=>0, :allowed=>1, :default=>2}
      EXPOSURES_I = {0=>:not_allowed, 1=>:allowed, 2=>:default}
      
      EXPOSURES_NOT_ALLOWED = 0
      EXPOSURES_ALLOWED = 1
      EXPOSURES_DEFAULT = 2
      
      EXPOSURES.extend Alembic::ValueParamHelper
      
      module Methods
        def set_screen_saver! (timeout, interval, prefer_blanking, allow_exposures)
          s = 107.chr.encode('BINARY')
          s << [timeout, interval, prefer_blanking, allow_exposures].pack("x1ssCC")
          send_request(s)
        end
        
        def set_screen_saver (timeout, interval, prefer_blanking, allow_exposures)
          set_screen_saver!(timeout, interval, prefer_blanking, allow_exposures).wait
        end
      end
      
      GetScreenSaverReply = Struct.new(:timeout, :interval, :prefer_blanking, :allow_exposures)
      
      module Methods
        def get_screen_saver! ()
          s = 108.chr.encode('BINARY')
          send_request(s) do |s|
            x = GetScreenSaverReply.new
            x.timeout, x.interval, x.prefer_blanking, x.allow_exposures, = s.slice!(0, 25).unpack("x1SSCCx18")
            x
          end
        end
        
        def get_screen_saver ()
          get_screen_saver!().wait
        end
      end
      
      HOST_MODE = {:insert=>0, :delete=>1}
      HOST_MODE_I = {0=>:insert, 1=>:delete}
      
      HOST_MODE_INSERT = 0
      HOST_MODE_DELETE = 1
      
      HOST_MODE.extend Alembic::ValueParamHelper
      
      FAMILY = {:internet=>0, :de_cnet=>1, :chaos=>2, :server_interpreted=>5, :internet6=>6}
      FAMILY_I = {0=>:internet, 1=>:de_cnet, 2=>:chaos, 5=>:server_interpreted, 6=>:internet6}
      
      FAMILY_INTERNET = 0
      FAMILY_DE_CNET = 1
      FAMILY_CHAOS = 2
      FAMILY_SERVER_INTERPRETED = 5
      FAMILY_INTERNET6 = 6
      
      FAMILY.extend Alembic::ValueParamHelper
      
      module Methods
        def change_hosts! (mode, family, address)
          s = 109.chr.encode('BINARY')
          address_len = address.length
          s << [mode, family, address_len, pad(address)].pack("CCx1SA*")
          send_request(s)
        end
        
        def change_hosts (mode, family, address)
          change_hosts!(mode, family, address).wait
        end
      end
      
      HOST = Struct.new(:family, :address_len, :address)
      
      module Methods
        def encode_host (s, family, address)
          address_len = address.length
          s << [family, address_len, pad(address)].pack("Cx1SA*")
          s
        end
      end
      
      module Methods
        def decode_host (s)
          x = HOST.new
          x.family, x.address_len, = s.slice!(0, 4).unpack("Cx1S")
          x.address = s.slice!(0, x.address_len)
          x
        end
      end
      
      ListHostsReply = Struct.new(:mode, :hosts_len, :hosts)
      
      module Methods
        def list_hosts! ()
          s = 110.chr.encode('BINARY')
          send_request(s) do |s|
            x = ListHostsReply.new
            x.mode, x.hosts_len, = s.slice!(0, 25).unpack("CSx22")
            x.hosts = x.hosts_len.times.map{decode_host(s)}
            x
          end
        end
        
        def list_hosts ()
          list_hosts!().wait
        end
      end
      
      ACCESS_CONTROL = {:disable=>0, :enable=>1}
      ACCESS_CONTROL_I = {0=>:disable, 1=>:enable}
      
      ACCESS_CONTROL_DISABLE = 0
      ACCESS_CONTROL_ENABLE = 1
      
      ACCESS_CONTROL.extend Alembic::ValueParamHelper
      
      module Methods
        def set_access_control! (mode)
          s = 111.chr.encode('BINARY')
          s << [mode].pack("C")
          send_request(s)
        end
        
        def set_access_control (mode)
          set_access_control!(mode).wait
        end
      end
      
      CLOSE_DOWN = {:destroy_all=>0, :retain_permanent=>1, :retain_temporary=>2}
      CLOSE_DOWN_I = {0=>:destroy_all, 1=>:retain_permanent, 2=>:retain_temporary}
      
      CLOSE_DOWN_DESTROY_ALL = 0
      CLOSE_DOWN_RETAIN_PERMANENT = 1
      CLOSE_DOWN_RETAIN_TEMPORARY = 2
      
      CLOSE_DOWN.extend Alembic::ValueParamHelper
      
      module Methods
        def set_close_down_mode! (mode)
          s = 112.chr.encode('BINARY')
          s << [mode].pack("C")
          send_request(s)
        end
        
        def set_close_down_mode (mode)
          set_close_down_mode!(mode).wait
        end
      end
      
      KILL = {:all_temporary=>0}
      KILL_I = {0=>:all_temporary}
      
      KILL_ALL_TEMPORARY = 0
      
      KILL.extend Alembic::ValueParamHelper
      
      module Methods
        def kill_client! (resource)
          s = 113.chr.encode('BINARY')
          s << [resource].pack("x1L")
          send_request(s)
        end
        
        def kill_client (resource)
          kill_client!(resource).wait
        end
      end
      
      module Methods
        def rotate_properties! (window, delta, atoms)
          s = 114.chr.encode('BINARY')
          atoms_len = atoms.length
          s << [Window.to_xid(self, window), atoms_len, delta, *atoms].pack("x1LSsL*")
          send_request(s)
        end
        
        def rotate_properties (window, delta, atoms)
          rotate_properties!(window, delta, atoms).wait
        end
      end
      
      SCREEN_SAVER = {:reset=>0, :active=>1}
      SCREEN_SAVER_I = {0=>:reset, 1=>:active}
      
      SCREEN_SAVER_RESET = 0
      SCREEN_SAVER_ACTIVE = 1
      
      SCREEN_SAVER.extend Alembic::ValueParamHelper
      
      module Methods
        def force_screen_saver! (mode)
          s = 115.chr.encode('BINARY')
          s << [mode].pack("C")
          send_request(s)
        end
        
        def force_screen_saver (mode)
          force_screen_saver!(mode).wait
        end
      end
      
      MAPPING_STATUS = {:success=>0, :busy=>1, :failure=>2}
      MAPPING_STATUS_I = {0=>:success, 1=>:busy, 2=>:failure}
      
      MAPPING_STATUS_SUCCESS = 0
      MAPPING_STATUS_BUSY = 1
      MAPPING_STATUS_FAILURE = 2
      
      MAPPING_STATUS.extend Alembic::ValueParamHelper
      
      SetPointerMappingReply = Struct.new(:status)
      
      module Methods
        def set_pointer_mapping! (map)
          s = 116.chr.encode('BINARY')
          map_len = map.length
          s << [map_len, *map].pack("CC*")
          send_request(s) do |s|
            x = SetPointerMappingReply.new
            x.status, = s.slice!(0, 1).unpack("C")
            x.status
          end
        end
        
        def set_pointer_mapping (map)
          set_pointer_mapping!(map).wait
        end
      end
      
      GetPointerMappingReply = Struct.new(:map_len, :map)
      
      module Methods
        def get_pointer_mapping! ()
          s = 117.chr.encode('BINARY')
          send_request(s) do |s|
            x = GetPointerMappingReply.new
            x.map_len, = s.slice!(0, 25).unpack("Cx24")
            x.map = s.slice!(0..x.map_len).unpack('C*')
            x.map
          end
        end
        
        def get_pointer_mapping ()
          get_pointer_mapping!().wait
        end
      end
      
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
      
      MAP_INDEX.extend Alembic::ValueParamHelper
      
      SetModifierMappingReply = Struct.new(:status)
      
      module Methods
        def set_modifier_mapping! (keycodes_per_modifier, keycodes)
          s = 118.chr.encode('BINARY')
          s << [keycodes_per_modifier, *keycodes].pack("CC*")
          send_request(s) do |s|
            x = SetModifierMappingReply.new
            x.status, = s.slice!(0, 1).unpack("C")
            x.status
          end
        end
        
        def set_modifier_mapping (keycodes_per_modifier, keycodes)
          set_modifier_mapping!(keycodes_per_modifier, keycodes).wait
        end
      end
      
      GetModifierMappingReply = Struct.new(:keycodes_per_modifier, :keycodes)
      
      module Methods
        def get_modifier_mapping! ()
          s = 119.chr.encode('BINARY')
          send_request(s) do |s|
            x = GetModifierMappingReply.new
            x.keycodes_per_modifier, = s.slice!(0, 25).unpack("Cx24")
            x.keycodes = s.slice!(0..(x.keycodes_per_modifier * 8)).unpack('C*')
            x
          end
        end
        
        def get_modifier_mapping ()
          get_modifier_mapping!().wait
        end
      end
      
      module Methods
        def no_operation! ()
          s = 127.chr.encode('BINARY')
          send_request(s)
        end
        
        def no_operation ()
          no_operation!().wait
        end
      end
      
    end
  end
end
