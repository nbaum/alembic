module Alembic
  module Extensions
    module RandR
      extend Alembic::ExtensionMethods
      
      extension_xname "RANDR"
      
      # randr_query_version (major_version, minor_version)
      # randr_set_screen_config (window, timestamp, config_timestamp, sizeID, rotation, rate)
      # randr_select_input (window, enable)
      # randr_get_screen_info (window)
      # randr_get_screen_size_range (window)
      # randr_set_screen_size (window, width, height, mm_width, mm_height)
      # randr_get_screen_resources (window)
      # randr_get_output_info (output, config_timestamp)
      # randr_list_output_properties (output)
      # randr_query_output_property (output, property)
      # randr_configure_output_property (output, property, pending, range, values)
      # randr_change_output_property (output, property, type, format, mode, num_units, data)
      # randr_delete_output_property (output, property)
      # randr_get_output_property (output, property, type, long_offset, long_length, delete, pending)
      # randr_create_mode (window, mode_info, name)
      # randr_destroy_mode (mode)
      # randr_add_output_mode (output, mode)
      # randr_delete_output_mode (output, mode)
      # randr_get_crtc_info (crtc, config_timestamp)
      # randr_set_crtc_config (crtc, timestamp, config_timestamp, x, y, mode, rotation, outputs)
      # randr_get_crtc_gamma_size (crtc)
      # randr_get_crtc_gamma (crtc)
      # randr_set_crtc_gamma (crtc, red, green, blue)
      # randr_get_screen_resources_current (window)
      # randr_set_crtc_transform (crtc, transform, filter_name, filter_params)
      # randr_get_crtc_transform (crtc)
      # randr_get_panning (crtc)
      # randr_set_panning (crtc, timestamp, left, top, width, height, track_left, track_top, track_width, track_height, border_left, border_top, border_right, border_bottom)
      # randr_set_output_primary (window, output)
      # randr_get_output_primary (window)
      # randr_get_providers (window)
      # randr_get_provider_info (provider, config_timestamp)
      # randr_set_provider_offload_sink (provider, sink_provider, config_timestamp)
      # randr_set_provider_output_source (provider, source_provider, config_timestamp)
      # randr_list_provider_properties (provider)
      # randr_query_provider_property (provider, property)
      # randr_configure_provider_property (provider, property, pending, range, values)
      # randr_change_provider_property (provider, property, type, format, mode, num_items, data)
      # randr_delete_provider_property (provider, property)
      # randr_get_provider_property (provider, property, type, long_offset, long_length, delete, pending)
      
      # randr_screen_change_notify_event (rotation, timestamp, config_timestamp, root, request_window, sizeID, subpixel_order, width, height, mwidth, mheight)
      # randr_notify_event (subCode, u)
      
      include Alembic::Extensions::Xproto
      include Alembic::Extensions::Render
      
      RANDR_ROTATION = {:rotate_0=>1, :rotate_90=>2, :rotate_180=>4, :rotate_270=>8, :reflect_x=>16, :reflect_y=>32}
      RANDR_ROTATION_I = {1=>:rotate_0, 2=>:rotate_90, 4=>:rotate_180, 8=>:rotate_270, 16=>:reflect_x, 32=>:reflect_y}
      
      RANDR_ROTATION_ROTATE_0 = 1
      RANDR_ROTATION_ROTATE_90 = 2
      RANDR_ROTATION_ROTATE_180 = 4
      RANDR_ROTATION_ROTATE_270 = 8
      RANDR_ROTATION_REFLECT_X = 16
      RANDR_ROTATION_REFLECT_Y = 32
      
      RANDR_ROTATION.extend Alembic::ValueParamHelper
      
      RANDR_SET_CONFIG = {:success=>0, :invalid_config_time=>1, :invalid_time=>2, :failed=>3}
      RANDR_SET_CONFIG_I = {0=>:success, 1=>:invalid_config_time, 2=>:invalid_time, 3=>:failed}
      
      RANDR_SET_CONFIG_SUCCESS = 0
      RANDR_SET_CONFIG_INVALID_CONFIG_TIME = 1
      RANDR_SET_CONFIG_INVALID_TIME = 2
      RANDR_SET_CONFIG_FAILED = 3
      
      RANDR_SET_CONFIG.extend Alembic::ValueParamHelper
      
      RANDR_NOTIFY_MASK = {:screen_change=>1, :crtc_change=>2, :output_change=>4, :output_property=>8, :provider_change=>16, :provider_property=>32, :resource_change=>64}
      RANDR_NOTIFY_MASK_I = {1=>:screen_change, 2=>:crtc_change, 4=>:output_change, 8=>:output_property, 16=>:provider_change, 32=>:provider_property, 64=>:resource_change}
      
      RANDR_NOTIFY_MASK_SCREEN_CHANGE = 1
      RANDR_NOTIFY_MASK_CRTC_CHANGE = 2
      RANDR_NOTIFY_MASK_OUTPUT_CHANGE = 4
      RANDR_NOTIFY_MASK_OUTPUT_PROPERTY = 8
      RANDR_NOTIFY_MASK_PROVIDER_CHANGE = 16
      RANDR_NOTIFY_MASK_PROVIDER_PROPERTY = 32
      RANDR_NOTIFY_MASK_RESOURCE_CHANGE = 64
      
      RANDR_NOTIFY_MASK.extend Alembic::ValueParamHelper
      
      RANDR_MODE_FLAG = {:hsync_positive=>1, :hsync_negative=>2, :vsync_positive=>4, :vsync_negative=>8, :interlace=>16, :double_scan=>32, :csync=>64, :csync_positive=>128, :csync_negative=>256, :hskew_present=>512, :bcast=>1024, :pixel_multiplex=>2048, :double_clock=>4096, :halve_clock=>8192}
      RANDR_MODE_FLAG_I = {1=>:hsync_positive, 2=>:hsync_negative, 4=>:vsync_positive, 8=>:vsync_negative, 16=>:interlace, 32=>:double_scan, 64=>:csync, 128=>:csync_positive, 256=>:csync_negative, 512=>:hskew_present, 1024=>:bcast, 2048=>:pixel_multiplex, 4096=>:double_clock, 8192=>:halve_clock}
      
      RANDR_MODE_FLAG_HSYNC_POSITIVE = 1
      RANDR_MODE_FLAG_HSYNC_NEGATIVE = 2
      RANDR_MODE_FLAG_VSYNC_POSITIVE = 4
      RANDR_MODE_FLAG_VSYNC_NEGATIVE = 8
      RANDR_MODE_FLAG_INTERLACE = 16
      RANDR_MODE_FLAG_DOUBLE_SCAN = 32
      RANDR_MODE_FLAG_CSYNC = 64
      RANDR_MODE_FLAG_CSYNC_POSITIVE = 128
      RANDR_MODE_FLAG_CSYNC_NEGATIVE = 256
      RANDR_MODE_FLAG_HSKEW_PRESENT = 512
      RANDR_MODE_FLAG_BCAST = 1024
      RANDR_MODE_FLAG_PIXEL_MULTIPLEX = 2048
      RANDR_MODE_FLAG_DOUBLE_CLOCK = 4096
      RANDR_MODE_FLAG_HALVE_CLOCK = 8192
      
      RANDR_MODE_FLAG.extend Alembic::ValueParamHelper
      
      RANDR_CONNECTION = {:connected=>0, :disconnected=>1, :unknown=>2}
      RANDR_CONNECTION_I = {0=>:connected, 1=>:disconnected, 2=>:unknown}
      
      RANDR_CONNECTION_CONNECTED = 0
      RANDR_CONNECTION_DISCONNECTED = 1
      RANDR_CONNECTION_UNKNOWN = 2
      
      RANDR_CONNECTION.extend Alembic::ValueParamHelper
      
      RANDR_TRANSFORM = {:unit=>1, :scale_up=>2, :scale_down=>4, :projective=>8}
      RANDR_TRANSFORM_I = {1=>:unit, 2=>:scale_up, 4=>:scale_down, 8=>:projective}
      
      RANDR_TRANSFORM_UNIT = 1
      RANDR_TRANSFORM_SCALE_UP = 2
      RANDR_TRANSFORM_SCALE_DOWN = 4
      RANDR_TRANSFORM_PROJECTIVE = 8
      
      RANDR_TRANSFORM.extend Alembic::ValueParamHelper
      
      RANDR_PROVIDER_CAPABILITY = {:source_output=>1, :sink_output=>2, :source_offload=>4, :sink_offload=>8}
      RANDR_PROVIDER_CAPABILITY_I = {1=>:source_output, 2=>:sink_output, 4=>:source_offload, 8=>:sink_offload}
      
      RANDR_PROVIDER_CAPABILITY_SOURCE_OUTPUT = 1
      RANDR_PROVIDER_CAPABILITY_SINK_OUTPUT = 2
      RANDR_PROVIDER_CAPABILITY_SOURCE_OFFLOAD = 4
      RANDR_PROVIDER_CAPABILITY_SINK_OFFLOAD = 8
      
      RANDR_PROVIDER_CAPABILITY.extend Alembic::ValueParamHelper
      
      RANDR_NOTIFY = {:crtc_change=>0, :output_change=>1, :output_property=>2, :provider_change=>3, :provider_property=>4, :resource_change=>5}
      RANDR_NOTIFY_I = {0=>:crtc_change, 1=>:output_change, 2=>:output_property, 3=>:provider_change, 4=>:provider_property, 5=>:resource_change}
      
      RANDR_NOTIFY_CRTC_CHANGE = 0
      RANDR_NOTIFY_OUTPUT_CHANGE = 1
      RANDR_NOTIFY_OUTPUT_PROPERTY = 2
      RANDR_NOTIFY_PROVIDER_CHANGE = 3
      RANDR_NOTIFY_PROVIDER_PROPERTY = 4
      RANDR_NOTIFY_RESOURCE_CHANGE = 5
      
      RANDR_NOTIFY.extend Alembic::ValueParamHelper
      
      define_event 0, :randr_screen_change_notify_event, false
      define_event 1, :randr_notify_event, false
      
      define_error 0, RandrBadOutputError = Class.new(X11Error)
      define_error 1, RandrBadCrtcError = Class.new(X11Error)
      define_error 2, RandrBadModeError = Class.new(X11Error)
      define_error 3, RandrBadProviderError = Class.new(X11Error)
      
      Mode = Class.new(Resource)
      Crtc = Class.new(Resource)
      Output = Class.new(Resource)
      Provider = Class.new(Resource)
      
      module Methods
        
        def randr_query_version! (major_version, minor_version)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 0
          s << [major_version, minor_version].pack("LL")
          send_request(s) do |s|
            x = HashWithMethodMissing.new
            x[:major_version], x[:minor_version], = s.slice!(0, 25).unpack("x1LLx16")
            x
          end
        end
        
        def randr_query_version (major_version, minor_version)
          randr_query_version!(major_version, minor_version).sync.result
        end
        
        def randr_set_screen_config! (window, timestamp, config_timestamp, sizeID, rotation, rate)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 2
          s << [Window.to_xid(self, window), timestamp, config_timestamp, sizeID, rotation, rate].pack("LLLSSSx2")
          send_request(s) do |s|
            x = HashWithMethodMissing.new
            x[:status], x[:new_timestamp], x[:config_timestamp], x[:root], x[:subpixel_order], = s.slice!(0, 25).unpack("CLLLSx10")
            x[:root] = Window[self, x[:root]]
            x
          end
        end
        
        def randr_set_screen_config (window, timestamp, config_timestamp, sizeID, rotation, rate)
          randr_set_screen_config!(window, timestamp, config_timestamp, sizeID, rotation, rate).sync.result
        end
        
        def randr_select_input! (window, enable)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 4
          s << [Window.to_xid(self, window), enable].pack("LSx2")
          send_request(s)
        end
        
        def randr_select_input (window, enable)
          randr_select_input!(window, enable).sync.abandon
        end
        
        def randr_get_screen_info! (window)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 5
          s << [Window.to_xid(self, window)].pack("L")
          send_request(s) do |s|
            x = HashWithMethodMissing.new
            x[:rotations], x[:root], x[:timestamp], x[:config_timestamp], x[:nSizes], x[:sizeID], x[:rotation], x[:rate], x[:nInfo], = s.slice!(0, 25).unpack("CLLLSSSSSx2")
            x[:root] = Window[self, x[:root]]
            x[:sizes] = x[:nSizes].times.map{decode_randr_screen_size(s)}
            x[:rates] = (x[:nInfo] - x[:nSizes]).times.map{decode_randr_refresh_rates(s)}
            x
          end
        end
        
        def randr_get_screen_info (window)
          randr_get_screen_info!(window).sync.result
        end
        
        def randr_get_screen_size_range! (window)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 6
          s << [Window.to_xid(self, window)].pack("L")
          send_request(s) do |s|
            x = HashWithMethodMissing.new
            x[:min_width], x[:min_height], x[:max_width], x[:max_height], = s.slice!(0, 25).unpack("x1SSSSx16")
            x
          end
        end
        
        def randr_get_screen_size_range (window)
          randr_get_screen_size_range!(window).sync.result
        end
        
        def randr_set_screen_size! (window, width, height, mm_width, mm_height)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 7
          s << [Window.to_xid(self, window), width, height, mm_width, mm_height].pack("LSSLL")
          send_request(s)
        end
        
        def randr_set_screen_size (window, width, height, mm_width, mm_height)
          randr_set_screen_size!(window, width, height, mm_width, mm_height).sync.abandon
        end
        
        def randr_get_screen_resources! (window)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 8
          s << [Window.to_xid(self, window)].pack("L")
          send_request(s) do |s|
            x = HashWithMethodMissing.new
            x[:timestamp], x[:config_timestamp], x[:num_crtcs], x[:num_outputs], x[:num_modes], x[:names_len], = s.slice!(0, 25).unpack("x1LLSSSSx8")
            x[:crtcs] = s.slice!(0..4*(x[:num_crtcs])).unpack('L*')
            x[:crtcs] = x[:crtcs] ? x[:crtcs].map{|x|Crtc[self, x]} : []
            x[:outputs] = s.slice!(0..4*(x[:num_outputs])).unpack('L*')
            x[:outputs] = x[:outputs] ? x[:outputs].map{|x|Output[self, x]} : []
            x[:modes] = x[:num_modes].times.map{decode_randr_mode_info(s)}
            x[:names] = s.slice!(0, x[:names_len])
            x
          end
        end
        
        def randr_get_screen_resources (window)
          randr_get_screen_resources!(window).sync.result
        end
        
        def randr_get_output_info! (output, config_timestamp)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 9
          s << [Output.to_xid(self, output), config_timestamp].pack("LL")
          send_request(s) do |s|
            x = HashWithMethodMissing.new
            x[:status], x[:timestamp], x[:crtc], x[:mm_width], x[:mm_height], x[:connection], x[:subpixel_order], x[:num_crtcs], x[:num_modes], x[:num_preferred], x[:num_clones], x[:name_len], = s.slice!(0, 29).unpack("CLLLLCCSSSSS")
            x[:crtc] = Crtc[self, x[:crtc]]
            x[:crtcs] = s.slice!(0..4*(x[:num_crtcs])).unpack('L*')
            x[:crtcs] = x[:crtcs] ? x[:crtcs].map{|x|Crtc[self, x]} : []
            x[:modes] = s.slice!(0..4*(x[:num_modes])).unpack('L*')
            x[:modes] = x[:modes] ? x[:modes].map{|x|Mode[self, x]} : []
            x[:clones] = s.slice!(0..4*(x[:num_clones])).unpack('L*')
            x[:clones] = x[:clones] ? x[:clones].map{|x|Output[self, x]} : []
            x[:name] = s.slice!(0, x[:name_len])
            x
          end
        end
        
        def randr_get_output_info (output, config_timestamp)
          randr_get_output_info!(output, config_timestamp).sync.result
        end
        
        def randr_list_output_properties! (output)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 10
          s << [Output.to_xid(self, output)].pack("L")
          send_request(s) do |s|
            x = HashWithMethodMissing.new
            x[:num_atoms], *x[:atoms] = s.unpack("x1Sx22L*")
            x[:atoms] = x[:atoms] ? x[:atoms].map{|x|Atom[self, x]} : []
            x[:atoms]
          end
        end
        
        def randr_list_output_properties (output)
          randr_list_output_properties!(output).sync.result
        end
        
        def randr_query_output_property! (output, property)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 11
          s << [Output.to_xid(self, output), Atom.to_xid(self, property)].pack("LL")
          send_request(s) do |s|
            x = HashWithMethodMissing.new
            x[:pending], x[:range], x[:immutable], = s.slice!(0, 25).unpack("x1CCCx21")
            x[:pending] = x[:pending] != 0
            x[:range] = x[:range] != 0
            x[:immutable] = x[:immutable] != 0
            x[:validValues] = x[:length].times.map{s.slice!(0, 4).unpack("l")[0]}
            x
          end
        end
        
        def randr_query_output_property (output, property)
          randr_query_output_property!(output, property).sync.result
        end
        
        def randr_configure_output_property! (output, property, pending, range, values)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 12
          s << [Output.to_xid(self, output), Atom.to_xid(self, property), pending ? 1 : 0, range ? 1 : 0, *values].pack("LLCCx2l*")
          send_request(s)
        end
        
        def randr_configure_output_property (output, property, pending, range, values)
          randr_configure_output_property!(output, property, pending, range, values).sync.abandon
        end
        
        def randr_change_output_property! (output, property, type, format, mode, num_units, data)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 13
          s << [Output.to_xid(self, output), Atom.to_xid(self, property), Atom.to_xid(self, type), format, mode, num_units, pad(data)].pack("LLLCCx2LA*")
          send_request(s)
        end
        
        def randr_change_output_property (output, property, type, format, mode, num_units, data)
          randr_change_output_property!(output, property, type, format, mode, num_units, data).sync.abandon
        end
        
        def randr_delete_output_property! (output, property)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 14
          s << [Output.to_xid(self, output), Atom.to_xid(self, property)].pack("LL")
          send_request(s)
        end
        
        def randr_delete_output_property (output, property)
          randr_delete_output_property!(output, property).sync.abandon
        end
        
        def randr_get_output_property! (output, property, type, long_offset, long_length, delete, pending)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 15
          s << [Output.to_xid(self, output), Atom.to_xid(self, property), Atom.to_xid(self, type), long_offset, long_length, delete ? 1 : 0, pending ? 1 : 0].pack("LLLLLCCx2")
          send_request(s) do |s|
            x = HashWithMethodMissing.new
            x[:format], x[:type], x[:bytes_after], x[:num_items], = s.slice!(0, 25).unpack("CLLLx12")
            x[:type] = Atom[self, x[:type]]
            x[:data] = s.slice!(0, (x[:num_items] * (x[:format] / 8)))
            x
          end
        end
        
        def randr_get_output_property (output, property, type, long_offset, long_length, delete, pending)
          randr_get_output_property!(output, property, type, long_offset, long_length, delete, pending).sync.result
        end
        
        def randr_create_mode! (window, mode_info, name)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 16
          s << [Window.to_xid(self, window)].pack("L")
          s << encode_randr_mode_info(''.encode('BINARY'), *mode_info)
          s << [pad(name)].pack("A*")
          send_request(s) do |s|
            x = HashWithMethodMissing.new
            x[:mode], = s.slice!(0, 25).unpack("x1Lx20")
            x[:mode] = Mode[self, x[:mode]]
            x[:mode]
          end
        end
        
        def randr_create_mode (window, mode_info, name)
          randr_create_mode!(window, mode_info, name).sync.result
        end
        
        def randr_destroy_mode! (mode)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 17
          s << [Mode.to_xid(self, mode)].pack("L")
          send_request(s)
        end
        
        def randr_destroy_mode (mode)
          randr_destroy_mode!(mode).sync.abandon
        end
        
        def randr_add_output_mode! (output, mode)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 18
          s << [Output.to_xid(self, output), Mode.to_xid(self, mode)].pack("LL")
          send_request(s)
        end
        
        def randr_add_output_mode (output, mode)
          randr_add_output_mode!(output, mode).sync.abandon
        end
        
        def randr_delete_output_mode! (output, mode)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 19
          s << [Output.to_xid(self, output), Mode.to_xid(self, mode)].pack("LL")
          send_request(s)
        end
        
        def randr_delete_output_mode (output, mode)
          randr_delete_output_mode!(output, mode).sync.abandon
        end
        
        def randr_get_crtc_info! (crtc, config_timestamp)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 20
          s << [Crtc.to_xid(self, crtc), config_timestamp].pack("LL")
          send_request(s) do |s|
            x = HashWithMethodMissing.new
            x[:status], x[:timestamp], x[:x], x[:y], x[:width], x[:height], x[:mode], x[:rotation], x[:rotations], x[:num_outputs], x[:num_possible_outputs], = s.slice!(0, 25).unpack("CLssSSLSSSS")
            x[:mode] = Mode[self, x[:mode]]
            x[:outputs] = s.slice!(0..4*(x[:num_outputs])).unpack('L*')
            x[:outputs] = x[:outputs] ? x[:outputs].map{|x|Output[self, x]} : []
            *x[:possible] = s.unpack("L*")
            x[:possible] = x[:possible] ? x[:possible].map{|x|Output[self, x]} : []
            x
          end
        end
        
        def randr_get_crtc_info (crtc, config_timestamp)
          randr_get_crtc_info!(crtc, config_timestamp).sync.result
        end
        
        def randr_set_crtc_config! (crtc, timestamp, config_timestamp, x, y, mode, rotation, outputs)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 21
          s << [Crtc.to_xid(self, crtc), timestamp, config_timestamp, x, y, Mode.to_xid(self, mode), rotation, *outputs].pack("LLLssLSx2L*")
          send_request(s) do |s|
            x = HashWithMethodMissing.new
            x[:status], x[:timestamp], = s.slice!(0, 25).unpack("CLx20")
            x
          end
        end
        
        def randr_set_crtc_config (crtc, timestamp, config_timestamp, x, y, mode, rotation, outputs)
          randr_set_crtc_config!(crtc, timestamp, config_timestamp, x, y, mode, rotation, outputs).sync.result
        end
        
        def randr_get_crtc_gamma_size! (crtc)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 22
          s << [Crtc.to_xid(self, crtc)].pack("L")
          send_request(s) do |s|
            x = HashWithMethodMissing.new
            x[:size], = s.slice!(0, 25).unpack("x1Sx22")
            x[:size]
          end
        end
        
        def randr_get_crtc_gamma_size (crtc)
          randr_get_crtc_gamma_size!(crtc).sync.result
        end
        
        def randr_get_crtc_gamma! (crtc)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 23
          s << [Crtc.to_xid(self, crtc)].pack("L")
          send_request(s) do |s|
            x = HashWithMethodMissing.new
            x[:size], = s.slice!(0, 25).unpack("x1Sx22")
            x[:red] = s.slice!(0..2*(x[:size])).unpack('S*')
            x[:green] = s.slice!(0..2*(x[:size])).unpack('S*')
            x[:blue] = s.slice!(0..2*(x[:size])).unpack('S*')
            x
          end
        end
        
        def randr_get_crtc_gamma (crtc)
          randr_get_crtc_gamma!(crtc).sync.result
        end
        
        def randr_set_crtc_gamma! (crtc, red, green, blue)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 24
          size = red.length
          size = green.length
          size = blue.length
          s << [Crtc.to_xid(self, crtc), size].pack("LSx2")
          s << red.map{|x|[x].pack("S")}.join
          s << green.map{|x|[x].pack("S")}.join
          s << [*blue].pack("S*")
          send_request(s)
        end
        
        def randr_set_crtc_gamma (crtc, red, green, blue)
          randr_set_crtc_gamma!(crtc, red, green, blue).sync.abandon
        end
        
        def randr_get_screen_resources_current! (window)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 25
          s << [Window.to_xid(self, window)].pack("L")
          send_request(s) do |s|
            x = HashWithMethodMissing.new
            x[:timestamp], x[:config_timestamp], x[:num_crtcs], x[:num_outputs], x[:num_modes], x[:names_len], = s.slice!(0, 25).unpack("x1LLSSSSx8")
            x[:crtcs] = s.slice!(0..4*(x[:num_crtcs])).unpack('L*')
            x[:crtcs] = x[:crtcs] ? x[:crtcs].map{|x|Crtc[self, x]} : []
            x[:outputs] = s.slice!(0..4*(x[:num_outputs])).unpack('L*')
            x[:outputs] = x[:outputs] ? x[:outputs].map{|x|Output[self, x]} : []
            x[:modes] = x[:num_modes].times.map{decode_randr_mode_info(s)}
            x[:names] = s.slice!(0, x[:names_len])
            x
          end
        end
        
        def randr_get_screen_resources_current (window)
          randr_get_screen_resources_current!(window).sync.result
        end
        
        def randr_set_crtc_transform! (crtc, transform, filter_name, filter_params)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 26
          filter_name = filter_name.force_encoding('BINARY')
          filter_len = filter_name.bytesize
          s << [Crtc.to_xid(self, crtc)].pack("L")
          s << encode_render_transform(''.encode('BINARY'), *transform)
          s << [filter_len, pad(filter_name), *filter_params].pack("Sx2A*l*")
          send_request(s)
        end
        
        def randr_set_crtc_transform (crtc, transform, filter_name, filter_params)
          randr_set_crtc_transform!(crtc, transform, filter_name, filter_params).sync.abandon
        end
        
        def randr_get_crtc_transform! (crtc)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 27
          s << [Crtc.to_xid(self, crtc)].pack("L")
          send_request(s) do |s|
            x = HashWithMethodMissing.new
            s.slice!(0, 1)
            x[:pending_transform] = decode_render_transform(s)
            x[:has_transforms], = s.slice!(0, 4).unpack("Cx3")
            x[:has_transforms] = x[:has_transforms] != 0
            x[:current_transform] = decode_render_transform(s)
            x[:pending_len], x[:pending_nparams], x[:current_len], x[:current_nparams], = s.slice!(0, 12).unpack("x4SSSS")
            x[:pending_filter_name] = s.slice!(0, x[:pending_len])
            x[:pending_params] = x[:pending_nparams].times.map{s.slice!(0, 4).unpack("l")[0]}
            x[:current_filter_name] = s.slice!(0, x[:current_len])
            x[:current_params] = x[:current_nparams].times.map{s.slice!(0, 4).unpack("l")[0]}
            x
          end
        end
        
        def randr_get_crtc_transform (crtc)
          randr_get_crtc_transform!(crtc).sync.result
        end
        
        def randr_get_panning! (crtc)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 28
          s << [Crtc.to_xid(self, crtc)].pack("L")
          send_request(s) do |s|
            x = HashWithMethodMissing.new
            x[:status], x[:timestamp], x[:left], x[:top], x[:width], x[:height], x[:track_left], x[:track_top], x[:track_width], x[:track_height], x[:border_left], x[:border_top], x[:border_right], x[:border_bottom], = s.slice!(0, 29).unpack("CLSSSSSSSSssss")
            x
          end
        end
        
        def randr_get_panning (crtc)
          randr_get_panning!(crtc).sync.result
        end
        
        def randr_set_panning! (crtc, timestamp, left, top, width, height, track_left, track_top, track_width, track_height, border_left, border_top, border_right, border_bottom)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 29
          s << [Crtc.to_xid(self, crtc), timestamp, left, top, width, height, track_left, track_top, track_width, track_height, border_left, border_top, border_right, border_bottom].pack("LLSSSSSSSSssss")
          send_request(s) do |s|
            x = HashWithMethodMissing.new
            x[:status], x[:timestamp], = s.slice!(0, 5).unpack("CL")
            x
          end
        end
        
        def randr_set_panning (crtc, timestamp, left, top, width, height, track_left, track_top, track_width, track_height, border_left, border_top, border_right, border_bottom)
          randr_set_panning!(crtc, timestamp, left, top, width, height, track_left, track_top, track_width, track_height, border_left, border_top, border_right, border_bottom).sync.result
        end
        
        def randr_set_output_primary! (window, output)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 30
          s << [Window.to_xid(self, window), Output.to_xid(self, output)].pack("LL")
          send_request(s)
        end
        
        def randr_set_output_primary (window, output)
          randr_set_output_primary!(window, output).sync.abandon
        end
        
        def randr_get_output_primary! (window)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 31
          s << [Window.to_xid(self, window)].pack("L")
          send_request(s) do |s|
            x = HashWithMethodMissing.new
            x[:output], = s.slice!(0, 5).unpack("x1L")
            x[:output] = Output[self, x[:output]]
            x[:output]
          end
        end
        
        def randr_get_output_primary (window)
          randr_get_output_primary!(window).sync.result
        end
        
        def randr_get_providers! (window)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 32
          s << [Window.to_xid(self, window)].pack("L")
          send_request(s) do |s|
            x = HashWithMethodMissing.new
            x[:timestamp], x[:num_providers], *x[:providers] = s.unpack("x1LSx18L*")
            x[:providers] = x[:providers] ? x[:providers].map{|x|Provider[self, x]} : []
            x
          end
        end
        
        def randr_get_providers (window)
          randr_get_providers!(window).sync.result
        end
        
        def randr_get_provider_info! (provider, config_timestamp)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 33
          s << [Provider.to_xid(self, provider), config_timestamp].pack("LL")
          send_request(s) do |s|
            x = HashWithMethodMissing.new
            x[:status], x[:timestamp], x[:capabilities], x[:num_crtcs], x[:num_outputs], x[:num_associated_providers], x[:name_len], = s.slice!(0, 25).unpack("CLLSSSSx8")
            x[:crtcs] = s.slice!(0..4*(x[:num_crtcs])).unpack('L*')
            x[:crtcs] = x[:crtcs] ? x[:crtcs].map{|x|Crtc[self, x]} : []
            x[:outputs] = s.slice!(0..4*(x[:num_outputs])).unpack('L*')
            x[:outputs] = x[:outputs] ? x[:outputs].map{|x|Output[self, x]} : []
            x[:associated_providers] = s.slice!(0..4*(x[:num_associated_providers])).unpack('L*')
            x[:associated_providers] = x[:associated_providers] ? x[:associated_providers].map{|x|Provider[self, x]} : []
            x[:associated_capability] = s.slice!(0..4*(x[:num_associated_providers])).unpack('L*')
            x[:name] = s.slice!(0, x[:name_len])
            x
          end
        end
        
        def randr_get_provider_info (provider, config_timestamp)
          randr_get_provider_info!(provider, config_timestamp).sync.result
        end
        
        def randr_set_provider_offload_sink! (provider, sink_provider, config_timestamp)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 34
          s << [Provider.to_xid(self, provider), Provider.to_xid(self, sink_provider), config_timestamp].pack("LLL")
          send_request(s)
        end
        
        def randr_set_provider_offload_sink (provider, sink_provider, config_timestamp)
          randr_set_provider_offload_sink!(provider, sink_provider, config_timestamp).sync.abandon
        end
        
        def randr_set_provider_output_source! (provider, source_provider, config_timestamp)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 35
          s << [Provider.to_xid(self, provider), Provider.to_xid(self, source_provider), config_timestamp].pack("LLL")
          send_request(s)
        end
        
        def randr_set_provider_output_source (provider, source_provider, config_timestamp)
          randr_set_provider_output_source!(provider, source_provider, config_timestamp).sync.abandon
        end
        
        def randr_list_provider_properties! (provider)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 36
          s << [Provider.to_xid(self, provider)].pack("L")
          send_request(s) do |s|
            x = HashWithMethodMissing.new
            x[:num_atoms], *x[:atoms] = s.unpack("x1Sx22L*")
            x[:atoms] = x[:atoms] ? x[:atoms].map{|x|Atom[self, x]} : []
            x[:atoms]
          end
        end
        
        def randr_list_provider_properties (provider)
          randr_list_provider_properties!(provider).sync.result
        end
        
        def randr_query_provider_property! (provider, property)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 37
          s << [Provider.to_xid(self, provider), Atom.to_xid(self, property)].pack("LL")
          send_request(s) do |s|
            x = HashWithMethodMissing.new
            x[:pending], x[:range], x[:immutable], = s.slice!(0, 25).unpack("x1CCCx21")
            x[:pending] = x[:pending] != 0
            x[:range] = x[:range] != 0
            x[:immutable] = x[:immutable] != 0
            x[:valid_values] = x[:length].times.map{s.slice!(0, 4).unpack("l")[0]}
            x
          end
        end
        
        def randr_query_provider_property (provider, property)
          randr_query_provider_property!(provider, property).sync.result
        end
        
        def randr_configure_provider_property! (provider, property, pending, range, values)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 38
          s << [Provider.to_xid(self, provider), Atom.to_xid(self, property), pending ? 1 : 0, range ? 1 : 0, *values].pack("LLCCx2l*")
          send_request(s)
        end
        
        def randr_configure_provider_property (provider, property, pending, range, values)
          randr_configure_provider_property!(provider, property, pending, range, values).sync.abandon
        end
        
        def randr_change_provider_property! (provider, property, type, format, mode, num_items, data)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 39
          s << [Provider.to_xid(self, provider), Atom.to_xid(self, property), Atom.to_xid(self, type), format, mode, num_items, pad(data)].pack("LLLCCx2LA*")
          send_request(s)
        end
        
        def randr_change_provider_property (provider, property, type, format, mode, num_items, data)
          randr_change_provider_property!(provider, property, type, format, mode, num_items, data).sync.abandon
        end
        
        def randr_delete_provider_property! (provider, property)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 40
          s << [Provider.to_xid(self, provider), Atom.to_xid(self, property)].pack("LL")
          send_request(s)
        end
        
        def randr_delete_provider_property (provider, property)
          randr_delete_provider_property!(provider, property).sync.abandon
        end
        
        def randr_get_provider_property! (provider, property, type, long_offset, long_length, delete, pending)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 41
          s << [Provider.to_xid(self, provider), Atom.to_xid(self, property), Atom.to_xid(self, type), long_offset, long_length, delete ? 1 : 0, pending ? 1 : 0].pack("LLLLLCCx2")
          send_request(s) do |s|
            x = HashWithMethodMissing.new
            x[:format], x[:type], x[:bytes_after], x[:num_items], = s.slice!(0, 25).unpack("CLLLx12")
            x[:type] = Atom[self, x[:type]]
            x[:data] = s.slice!(0, (x[:num_items] * (x[:format] / 8)))
            x
          end
        end
        
        def randr_get_provider_property (provider, property, type, long_offset, long_length, delete, pending)
          randr_get_provider_property!(provider, property, type, long_offset, long_length, delete, pending).sync.result
        end
        
        def encode_randr_screen_change_notify_event (rotation, timestamp, config_timestamp, root, request_window, sizeID, subpixel_order, width, height, mwidth, mheight)
          s = 0.chr.encode('BINARY')
          s << [rotation, timestamp, config_timestamp, Window.to_xid(self, root), Window.to_xid(self, request_window), sizeID, subpixel_order, width, height, mwidth, mheight].pack("CLLLLSSSSSS")
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
        
        def decode_randr_screen_change_notify_event (s)
          x = HashWithMethodMissing.new
          x[:rotation], x[:timestamp], x[:config_timestamp], x[:root], x[:request_window], x[:sizeID], x[:subpixel_order], x[:width], x[:height], x[:mwidth], x[:mheight], = s.slice!(0, 29).unpack("CLLLLSSSSSS")
          x[:root] = Window[self, x[:root]]
          x[:request_window] = Window[self, x[:request_window]]
          x
        end
        
        def encode_randr_notify_event (subCode, u)
          s = 1.chr.encode('BINARY')
          s << [subCode].pack("C")
          s << encode_randr_notify_data(''.encode('BINARY'), *u)
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
        
        def decode_randr_notify_event (s)
          x = HashWithMethodMissing.new
          x[:subCode], = s.slice!(0, 1).unpack("C")
          x[:u] = decode_randr_notify_data(s)
          x
        end
        
        def encode_randr_screen_size (s, width, height, mwidth, mheight)
          s << [width, height, mwidth, mheight].pack("SSSS")
          s
        end
        
        def decode_randr_screen_size (s)
          x = HashWithMethodMissing.new
          x[:width], x[:height], x[:mwidth], x[:mheight], = s.slice!(0, 8).unpack("SSSS")
          x
        end
        
        def encode_randr_refresh_rates (s, rates)
          nRates = rates.length
          s << [nRates, *rates].pack("SS*")
          s
        end
        
        def decode_randr_refresh_rates (s)
          x = HashWithMethodMissing.new
          x[:nRates], = s.slice!(0, 2).unpack("S")
          x[:rates] = s.slice!(0..2*(x[:nRates])).unpack('S*')
          x
        end
        
        def encode_randr_mode_info (s, id, width, height, dot_clock, hsync_start, hsync_end, htotal, hskew, vsync_start, vsync_end, vtotal, name_len, mode_flags)
          s << [id, width, height, dot_clock, hsync_start, hsync_end, htotal, hskew, vsync_start, vsync_end, vtotal, name_len, mode_flags].pack("LSSLSSSSSSSSL")
          s
        end
        
        def decode_randr_mode_info (s)
          x = HashWithMethodMissing.new
          x[:id], x[:width], x[:height], x[:dot_clock], x[:hsync_start], x[:hsync_end], x[:htotal], x[:hskew], x[:vsync_start], x[:vsync_end], x[:vtotal], x[:name_len], x[:mode_flags], = s.slice!(0, 32).unpack("LSSLSSSSSSSSL")
          x
        end
        
        def encode_randr_crtc_change (s, timestamp, window, crtc, mode, rotation, x, y, width, height)
          s << [timestamp, Window.to_xid(self, window), Crtc.to_xid(self, crtc), Mode.to_xid(self, mode), rotation, x, y, width, height].pack("LLLLSx2ssSS")
          s
        end
        
        def decode_randr_crtc_change (s)
          x = HashWithMethodMissing.new
          x[:timestamp], x[:window], x[:crtc], x[:mode], x[:rotation], x[:x], x[:y], x[:width], x[:height], = s.slice!(0, 28).unpack("LLLLSx2ssSS")
          x[:window] = Window[self, x[:window]]
          x[:crtc] = Crtc[self, x[:crtc]]
          x[:mode] = Mode[self, x[:mode]]
          x
        end
        
        def encode_randr_output_change (s, timestamp, config_timestamp, window, output, crtc, mode, rotation, connection, subpixel_order)
          s << [timestamp, config_timestamp, Window.to_xid(self, window), Output.to_xid(self, output), Crtc.to_xid(self, crtc), Mode.to_xid(self, mode), rotation, connection, subpixel_order].pack("LLLLLLSCC")
          s
        end
        
        def decode_randr_output_change (s)
          x = HashWithMethodMissing.new
          x[:timestamp], x[:config_timestamp], x[:window], x[:output], x[:crtc], x[:mode], x[:rotation], x[:connection], x[:subpixel_order], = s.slice!(0, 28).unpack("LLLLLLSCC")
          x[:window] = Window[self, x[:window]]
          x[:output] = Output[self, x[:output]]
          x[:crtc] = Crtc[self, x[:crtc]]
          x[:mode] = Mode[self, x[:mode]]
          x
        end
        
        def encode_randr_output_property (s, window, output, atom, timestamp, status)
          s << [Window.to_xid(self, window), Output.to_xid(self, output), Atom.to_xid(self, atom), timestamp, status].pack("LLLLCx11")
          s
        end
        
        def decode_randr_output_property (s)
          x = HashWithMethodMissing.new
          x[:window], x[:output], x[:atom], x[:timestamp], x[:status], = s.slice!(0, 28).unpack("LLLLCx11")
          x[:window] = Window[self, x[:window]]
          x[:output] = Output[self, x[:output]]
          x[:atom] = Atom[self, x[:atom]]
          x
        end
        
        def encode_randr_provider_change (s, timestamp, window, provider)
          s << [timestamp, Window.to_xid(self, window), Provider.to_xid(self, provider)].pack("LLLx16")
          s
        end
        
        def decode_randr_provider_change (s)
          x = HashWithMethodMissing.new
          x[:timestamp], x[:window], x[:provider], = s.slice!(0, 28).unpack("LLLx16")
          x[:window] = Window[self, x[:window]]
          x[:provider] = Provider[self, x[:provider]]
          x
        end
        
        def encode_randr_provider_property (s, window, provider, atom, timestamp, state)
          s << [Window.to_xid(self, window), Provider.to_xid(self, provider), Atom.to_xid(self, atom), timestamp, state].pack("LLLLCx11")
          s
        end
        
        def decode_randr_provider_property (s)
          x = HashWithMethodMissing.new
          x[:window], x[:provider], x[:atom], x[:timestamp], x[:state], = s.slice!(0, 28).unpack("LLLLCx11")
          x[:window] = Window[self, x[:window]]
          x[:provider] = Provider[self, x[:provider]]
          x[:atom] = Atom[self, x[:atom]]
          x
        end
        
        def encode_randr_resource_change (s, timestamp, window)
          s << [timestamp, Window.to_xid(self, window)].pack("LLx20")
          s
        end
        
        def decode_randr_resource_change (s)
          x = HashWithMethodMissing.new
          x[:timestamp], x[:window], = s.slice!(0, 28).unpack("LLx20")
          x[:window] = Window[self, x[:window]]
          x
        end
        
        def alloc_mode ()
          Mode.new(self, alloc_xid)
        end
        
        def alloc_crtc ()
          Crtc.new(self, alloc_xid)
        end
        
        def alloc_output ()
          Output.new(self, alloc_xid)
        end
        
        def alloc_provider ()
          Provider.new(self, alloc_xid)
        end
      
      end
      
      class Xproto::Window
        def randr_set_screen_config (timestamp, config_timestamp, sizeID, rotation, rate)
          connection.randr_set_screen_config(self, timestamp, config_timestamp, sizeID, rotation, rate)
        end
      end
      
      class Xproto::Window
        def randr_select_input (enable)
          connection.randr_select_input(self, enable)
        end
      end
      
      class Xproto::Window
        def randr_get_screen_info ()
          connection.randr_get_screen_info(self)
        end
      end
      
      class Xproto::Window
        def randr_get_screen_size_range ()
          connection.randr_get_screen_size_range(self)
        end
      end
      
      class Xproto::Window
        def randr_set_screen_size (width, height, mm_width, mm_height)
          connection.randr_set_screen_size(self, width, height, mm_width, mm_height)
        end
      end
      
      class Xproto::Window
        def randr_get_screen_resources ()
          connection.randr_get_screen_resources(self)
        end
      end
      
      class RandR::Output
        def randr_get_output_info (config_timestamp)
          connection.randr_get_output_info(self, config_timestamp)
        end
      end
      
      class RandR::Output
        def randr_list_output_properties ()
          connection.randr_list_output_properties(self)
        end
      end
      
      class RandR::Output
        def randr_query_output_property (property)
          connection.randr_query_output_property(self, property)
        end
      end
      
      class RandR::Output
        def randr_configure_output_property (property, pending, range, values)
          connection.randr_configure_output_property(self, property, pending, range, values)
        end
      end
      
      class RandR::Output
        def randr_change_output_property (property, type, format, mode, num_units, data)
          connection.randr_change_output_property(self, property, type, format, mode, num_units, data)
        end
      end
      
      class RandR::Output
        def randr_delete_output_property (property)
          connection.randr_delete_output_property(self, property)
        end
      end
      
      class RandR::Output
        def randr_get_output_property (property, type, long_offset, long_length, delete, pending)
          connection.randr_get_output_property(self, property, type, long_offset, long_length, delete, pending)
        end
      end
      
      class Xproto::Window
        def randr_create_mode (mode_info, name)
          connection.randr_create_mode(self, mode_info, name)
        end
      end
      
      class RandR::Mode
        def randr_destroy_mode ()
          connection.randr_destroy_mode(self)
        end
      end
      
      class RandR::Output
        def randr_add_output_mode (mode)
          connection.randr_add_output_mode(self, mode)
        end
      end
      
      class RandR::Output
        def randr_delete_output_mode (mode)
          connection.randr_delete_output_mode(self, mode)
        end
      end
      
      class RandR::Crtc
        def randr_get_crtc_info (config_timestamp)
          connection.randr_get_crtc_info(self, config_timestamp)
        end
      end
      
      class RandR::Crtc
        def randr_set_crtc_config (timestamp, config_timestamp, x, y, mode, rotation, outputs)
          connection.randr_set_crtc_config(self, timestamp, config_timestamp, x, y, mode, rotation, outputs)
        end
      end
      
      class RandR::Crtc
        def randr_get_crtc_gamma_size ()
          connection.randr_get_crtc_gamma_size(self)
        end
      end
      
      class RandR::Crtc
        def randr_get_crtc_gamma ()
          connection.randr_get_crtc_gamma(self)
        end
      end
      
      class RandR::Crtc
        def randr_set_crtc_gamma (red, green, blue)
          connection.randr_set_crtc_gamma(self, red, green, blue)
        end
      end
      
      class Xproto::Window
        def randr_get_screen_resources_current ()
          connection.randr_get_screen_resources_current(self)
        end
      end
      
      class RandR::Crtc
        def randr_set_crtc_transform (transform, filter_name, filter_params)
          connection.randr_set_crtc_transform(self, transform, filter_name, filter_params)
        end
      end
      
      class RandR::Crtc
        def randr_get_crtc_transform ()
          connection.randr_get_crtc_transform(self)
        end
      end
      
      class RandR::Crtc
        def randr_get_panning ()
          connection.randr_get_panning(self)
        end
      end
      
      class RandR::Crtc
        def randr_set_panning (timestamp, left, top, width, height, track_left, track_top, track_width, track_height, border_left, border_top, border_right, border_bottom)
          connection.randr_set_panning(self, timestamp, left, top, width, height, track_left, track_top, track_width, track_height, border_left, border_top, border_right, border_bottom)
        end
      end
      
      class Xproto::Window
        def randr_set_output_primary (output)
          connection.randr_set_output_primary(self, output)
        end
      end
      
      class Xproto::Window
        def randr_get_output_primary ()
          connection.randr_get_output_primary(self)
        end
      end
      
      class Xproto::Window
        def randr_get_providers ()
          connection.randr_get_providers(self)
        end
      end
      
      class RandR::Provider
        def randr_get_provider_info (config_timestamp)
          connection.randr_get_provider_info(self, config_timestamp)
        end
      end
      
      class RandR::Provider
        def randr_set_provider_offload_sink (sink_provider, config_timestamp)
          connection.randr_set_provider_offload_sink(self, sink_provider, config_timestamp)
        end
      end
      
      class RandR::Provider
        def randr_set_provider_output_source (source_provider, config_timestamp)
          connection.randr_set_provider_output_source(self, source_provider, config_timestamp)
        end
      end
      
      class RandR::Provider
        def randr_list_provider_properties ()
          connection.randr_list_provider_properties(self)
        end
      end
      
      class RandR::Provider
        def randr_query_provider_property (property)
          connection.randr_query_provider_property(self, property)
        end
      end
      
      class RandR::Provider
        def randr_configure_provider_property (property, pending, range, values)
          connection.randr_configure_provider_property(self, property, pending, range, values)
        end
      end
      
      class RandR::Provider
        def randr_change_provider_property (property, type, format, mode, num_items, data)
          connection.randr_change_provider_property(self, property, type, format, mode, num_items, data)
        end
      end
      
      class RandR::Provider
        def randr_delete_provider_property (property)
          connection.randr_delete_provider_property(self, property)
        end
      end
      
      class RandR::Provider
        def randr_get_provider_property (property, type, long_offset, long_length, delete, pending)
          connection.randr_get_provider_property(self, property, type, long_offset, long_length, delete, pending)
        end
      end
      
    end
  end
end
