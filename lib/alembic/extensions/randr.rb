module Alembic
  module Extensions
    module RandR
      include Alembic::Extension
      
      self.name = "RANDR"
      
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
      
      include Xproto
      include Render
      
      RANDR_ROTATION = {:rotate_0=>1, :rotate_90=>2, :rotate_180=>4, :rotate_270=>8, :reflect_x=>16, :reflect_y=>32}
      RANDR_ROTATION_I = {1=>:rotate_0, 2=>:rotate_90, 4=>:rotate_180, 8=>:rotate_270, 16=>:reflect_x, 32=>:reflect_y}
      
      RANDR_ROTATION_ROTATE_0 = 1
      RANDR_ROTATION_ROTATE_90 = 2
      RANDR_ROTATION_ROTATE_180 = 4
      RANDR_ROTATION_ROTATE_270 = 8
      RANDR_ROTATION_REFLECT_X = 16
      RANDR_ROTATION_REFLECT_Y = 32
      
      RANDR_SET_CONFIG = {:success=>0, :invalid_config_time=>1, :invalid_time=>2, :failed=>3}
      RANDR_SET_CONFIG_I = {0=>:success, 1=>:invalid_config_time, 2=>:invalid_time, 3=>:failed}
      
      RANDR_SET_CONFIG_SUCCESS = 0
      RANDR_SET_CONFIG_INVALID_CONFIG_TIME = 1
      RANDR_SET_CONFIG_INVALID_TIME = 2
      RANDR_SET_CONFIG_FAILED = 3
      
      RANDR_NOTIFY_MASK = {:screen_change=>1, :crtc_change=>2, :output_change=>4, :output_property=>8, :provider_change=>16, :provider_property=>32, :resource_change=>64}
      RANDR_NOTIFY_MASK_I = {1=>:screen_change, 2=>:crtc_change, 4=>:output_change, 8=>:output_property, 16=>:provider_change, 32=>:provider_property, 64=>:resource_change}
      
      RANDR_NOTIFY_MASK_SCREEN_CHANGE = 1
      RANDR_NOTIFY_MASK_CRTC_CHANGE = 2
      RANDR_NOTIFY_MASK_OUTPUT_CHANGE = 4
      RANDR_NOTIFY_MASK_OUTPUT_PROPERTY = 8
      RANDR_NOTIFY_MASK_PROVIDER_CHANGE = 16
      RANDR_NOTIFY_MASK_PROVIDER_PROPERTY = 32
      RANDR_NOTIFY_MASK_RESOURCE_CHANGE = 64
      
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
      
      RANDR_CONNECTION = {:connected=>0, :disconnected=>1, :unknown=>2}
      RANDR_CONNECTION_I = {0=>:connected, 1=>:disconnected, 2=>:unknown}
      
      RANDR_CONNECTION_CONNECTED = 0
      RANDR_CONNECTION_DISCONNECTED = 1
      RANDR_CONNECTION_UNKNOWN = 2
      
      RANDR_TRANSFORM = {:unit=>1, :scale_up=>2, :scale_down=>4, :projective=>8}
      RANDR_TRANSFORM_I = {1=>:unit, 2=>:scale_up, 4=>:scale_down, 8=>:projective}
      
      RANDR_TRANSFORM_UNIT = 1
      RANDR_TRANSFORM_SCALE_UP = 2
      RANDR_TRANSFORM_SCALE_DOWN = 4
      RANDR_TRANSFORM_PROJECTIVE = 8
      
      RANDR_PROVIDER_CAPABILITY = {:source_output=>1, :sink_output=>2, :source_offload=>4, :sink_offload=>8}
      RANDR_PROVIDER_CAPABILITY_I = {1=>:source_output, 2=>:sink_output, 4=>:source_offload, 8=>:sink_offload}
      
      RANDR_PROVIDER_CAPABILITY_SOURCE_OUTPUT = 1
      RANDR_PROVIDER_CAPABILITY_SINK_OUTPUT = 2
      RANDR_PROVIDER_CAPABILITY_SOURCE_OFFLOAD = 4
      RANDR_PROVIDER_CAPABILITY_SINK_OFFLOAD = 8
      
      RANDR_NOTIFY = {:crtc_change=>0, :output_change=>1, :output_property=>2, :provider_change=>3, :provider_property=>4, :resource_change=>5}
      RANDR_NOTIFY_I = {0=>:crtc_change, 1=>:output_change, 2=>:output_property, 3=>:provider_change, 4=>:provider_property, 5=>:resource_change}
      
      RANDR_NOTIFY_CRTC_CHANGE = 0
      RANDR_NOTIFY_OUTPUT_CHANGE = 1
      RANDR_NOTIFY_OUTPUT_PROPERTY = 2
      RANDR_NOTIFY_PROVIDER_CHANGE = 3
      RANDR_NOTIFY_PROVIDER_PROPERTY = 4
      RANDR_NOTIFY_RESOURCE_CHANGE = 5
      
      self.events << [0, "randr_screen_change_notify_event", false]
      self.events << [1, "randr_notify_event", false]
      
      self.errors << [0, "RandrBadOutputError"]
      self.errors << [1, "RandrBadCrtcError"]
      self.errors << [2, "RandrBadModeError"]
      self.errors << [3, "RandrBadProviderError"]
      
      module Methods
        
        def randr_query_version! (major_version, minor_version)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 0
          s << [major_version, minor_version].pack("LL")
          send_request(s, :randr_query_version, true)
        end
        
        def randr_query_version (major_version, minor_version)
          randr_query_version!(major_version, minor_version).wait
        end
        
        def randr_query_version_reply (s)
          x = {}
          x[:major_version], x[:minor_version], = s.slice!(0, 25).unpack("x1LLx16")
          x
        end
        
        def randr_set_screen_config! (window, timestamp, config_timestamp, sizeID, rotation, rate)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 2
          s << [window.to_i, timestamp, config_timestamp, sizeID, rotation, rate].pack("LLLSSSx2")
          send_request(s, :randr_set_screen_config, true)
        end
        
        def randr_set_screen_config (window, timestamp, config_timestamp, sizeID, rotation, rate)
          randr_set_screen_config!(window, timestamp, config_timestamp, sizeID, rotation, rate).wait
        end
        
        def randr_set_screen_config_reply (s)
          x = {}
          x[:status], x[:new_timestamp], x[:config_timestamp], x[:root], x[:subpixel_order], = s.slice!(0, 25).unpack("CLLLSx10")
          x[:root] = find_resource(x[:root], "Window")
          x
        end
        
        def randr_select_input! (window, enable)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 4
          s << [window.to_i, enable].pack("LSx2")
          send_request(s, :randr_select_input, false)
        end
        
        def randr_select_input (window, enable)
          randr_select_input!(window, enable).abandon
        end
        
        def randr_get_screen_info! (window)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 5
          s << [window.to_i].pack("L")
          send_request(s, :randr_get_screen_info, true)
        end
        
        def randr_get_screen_info (window)
          randr_get_screen_info!(window).wait
        end
        
        def randr_get_screen_info_reply (s)
          x = {}
          x[:rotations], x[:root], x[:timestamp], x[:config_timestamp], x[:nSizes], x[:sizeID], x[:rotation], x[:rate], x[:nInfo], = s.slice!(0, 25).unpack("CLLLSSSSSx2")
          x[:root] = find_resource(x[:root], "Window")
          x[:sizes] = x[:nSizes].times.map{decode_randr_screen_size(s)}
          x[:rates] = (x[:nInfo] - x[:nSizes]).times.map{decode_randr_refresh_rates(s)}
          x
        end
        
        def randr_get_screen_size_range! (window)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 6
          s << [window.to_i].pack("L")
          send_request(s, :randr_get_screen_size_range, true)
        end
        
        def randr_get_screen_size_range (window)
          randr_get_screen_size_range!(window).wait
        end
        
        def randr_get_screen_size_range_reply (s)
          x = {}
          x[:min_width], x[:min_height], x[:max_width], x[:max_height], = s.slice!(0, 25).unpack("x1SSSSx16")
          x
        end
        
        def randr_set_screen_size! (window, width, height, mm_width, mm_height)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 7
          s << [window.to_i, width, height, mm_width, mm_height].pack("LSSLL")
          send_request(s, :randr_set_screen_size, false)
        end
        
        def randr_set_screen_size (window, width, height, mm_width, mm_height)
          randr_set_screen_size!(window, width, height, mm_width, mm_height).abandon
        end
        
        def randr_get_screen_resources! (window)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 8
          s << [window.to_i].pack("L")
          send_request(s, :randr_get_screen_resources, true)
        end
        
        def randr_get_screen_resources (window)
          randr_get_screen_resources!(window).wait
        end
        
        def randr_get_screen_resources_reply (s)
          x = {}
          x[:timestamp], x[:config_timestamp], x[:num_crtcs], x[:num_outputs], x[:num_modes], x[:names_len], = s.slice!(0, 25).unpack("x1LLSSSSx8")
          x[:crtcs] = s.slice!(0..4*(x[:num_crtcs])).unpack('L*')
          x[:crtcs] = x[:crtcs] ? x[:crtcs].map{|x|find_resource(x, "Crtc")} : []
          x[:outputs] = s.slice!(0..4*(x[:num_outputs])).unpack('L*')
          x[:outputs] = x[:outputs] ? x[:outputs].map{|x|find_resource(x, "Output")} : []
          x[:modes] = x[:num_modes].times.map{decode_randr_mode_info(s)}
          x[:names] = s.slice!(0, x[:names_len])
          x
        end
        
        def randr_get_output_info! (output, config_timestamp)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 9
          s << [output.to_i, config_timestamp].pack("LL")
          send_request(s, :randr_get_output_info, true)
        end
        
        def randr_get_output_info (output, config_timestamp)
          randr_get_output_info!(output, config_timestamp).wait
        end
        
        def randr_get_output_info_reply (s)
          x = {}
          x[:status], x[:timestamp], x[:crtc], x[:mm_width], x[:mm_height], x[:connection], x[:subpixel_order], x[:num_crtcs], x[:num_modes], x[:num_preferred], x[:num_clones], x[:name_len], = s.slice!(0, 29).unpack("CLLLLCCSSSSS")
          x[:crtc] = find_resource(x[:crtc], "Crtc")
          x[:crtcs] = s.slice!(0..4*(x[:num_crtcs])).unpack('L*')
          x[:crtcs] = x[:crtcs] ? x[:crtcs].map{|x|find_resource(x, "Crtc")} : []
          x[:modes] = s.slice!(0..4*(x[:num_modes])).unpack('L*')
          x[:modes] = x[:modes] ? x[:modes].map{|x|find_resource(x, "Mode")} : []
          x[:clones] = s.slice!(0..4*(x[:num_clones])).unpack('L*')
          x[:clones] = x[:clones] ? x[:clones].map{|x|find_resource(x, "Output")} : []
          x[:name] = s.slice!(0, x[:name_len])
          x
        end
        
        def randr_list_output_properties! (output)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 10
          s << [output.to_i].pack("L")
          send_request(s, :randr_list_output_properties, true)
        end
        
        def randr_list_output_properties (output)
          randr_list_output_properties!(output).wait
        end
        
        def randr_list_output_properties_reply (s)
          x = {}
          x[:num_atoms], *x[:atoms] = s.unpack("x1Sx22L*")
          x[:atoms] = x[:atoms] ? x[:atoms].map{|x|find_atom(x)} : []
          x[:atoms]
        end
        
        def randr_query_output_property! (output, property)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 11
          s << [output.to_i, atom(property)].pack("LL")
          send_request(s, :randr_query_output_property, true)
        end
        
        def randr_query_output_property (output, property)
          randr_query_output_property!(output, property).wait
        end
        
        def randr_query_output_property_reply (s)
          x = {}
          x[:pending], x[:range], x[:immutable], = s.slice!(0, 25).unpack("x1CCCx21")
          x[:pending] = x[:pending] != 0
          x[:range] = x[:range] != 0
          x[:immutable] = x[:immutable] != 0
          x[:validValues] = x[:length].times.map{s.slice!(0, 4).unpack("l")[0]}
          x
        end
        
        def randr_configure_output_property! (output, property, pending, range, values)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 12
          s << [output.to_i, atom(property), pending ? 1 : 0, range ? 1 : 0, *values].pack("LLCCx2l*")
          send_request(s, :randr_configure_output_property, false)
        end
        
        def randr_configure_output_property (output, property, pending, range, values)
          randr_configure_output_property!(output, property, pending, range, values).abandon
        end
        
        def randr_change_output_property! (output, property, type, format, mode, num_units, data)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 13
          s << [output.to_i, atom(property), atom(type), format, mode, num_units, pad(data)].pack("LLLCCx2LA*")
          send_request(s, :randr_change_output_property, false)
        end
        
        def randr_change_output_property (output, property, type, format, mode, num_units, data)
          randr_change_output_property!(output, property, type, format, mode, num_units, data).abandon
        end
        
        def randr_delete_output_property! (output, property)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 14
          s << [output.to_i, atom(property)].pack("LL")
          send_request(s, :randr_delete_output_property, false)
        end
        
        def randr_delete_output_property (output, property)
          randr_delete_output_property!(output, property).abandon
        end
        
        def randr_get_output_property! (output, property, type, long_offset, long_length, delete, pending)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 15
          s << [output.to_i, atom(property), atom(type), long_offset, long_length, delete ? 1 : 0, pending ? 1 : 0].pack("LLLLLCCx2")
          send_request(s, :randr_get_output_property, true)
        end
        
        def randr_get_output_property (output, property, type, long_offset, long_length, delete, pending)
          randr_get_output_property!(output, property, type, long_offset, long_length, delete, pending).wait
        end
        
        def randr_get_output_property_reply (s)
          x = {}
          x[:format], x[:type], x[:bytes_after], x[:num_items], = s.slice!(0, 25).unpack("CLLLx12")
          x[:type] = find_atom(x[:type])
          x[:data] = s.slice!(0, (x[:num_items] * (x[:format] / 8)))
          x
        end
        
        def randr_create_mode! (window, mode_info, name)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 16
          s << [window.to_i].pack("L")
          s << encode_randr_mode_info(''.encode('BINARY'), *mode_info)
          s << [pad(name)].pack("A*")
          send_request(s, :randr_create_mode, true)
        end
        
        def randr_create_mode (window, mode_info, name)
          randr_create_mode!(window, mode_info, name).wait
        end
        
        def randr_create_mode_reply (s)
          x = {}
          x[:mode], = s.slice!(0, 25).unpack("x1Lx20")
          x[:mode] = find_resource(x[:mode], "Mode")
          x[:mode]
        end
        
        def randr_destroy_mode! (mode)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 17
          s << [mode.to_i].pack("L")
          send_request(s, :randr_destroy_mode, false)
        end
        
        def randr_destroy_mode (mode)
          randr_destroy_mode!(mode).abandon
        end
        
        def randr_add_output_mode! (output, mode)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 18
          s << [output.to_i, mode.to_i].pack("LL")
          send_request(s, :randr_add_output_mode, false)
        end
        
        def randr_add_output_mode (output, mode)
          randr_add_output_mode!(output, mode).abandon
        end
        
        def randr_delete_output_mode! (output, mode)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 19
          s << [output.to_i, mode.to_i].pack("LL")
          send_request(s, :randr_delete_output_mode, false)
        end
        
        def randr_delete_output_mode (output, mode)
          randr_delete_output_mode!(output, mode).abandon
        end
        
        def randr_get_crtc_info! (crtc, config_timestamp)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 20
          s << [crtc.to_i, config_timestamp].pack("LL")
          send_request(s, :randr_get_crtc_info, true)
        end
        
        def randr_get_crtc_info (crtc, config_timestamp)
          randr_get_crtc_info!(crtc, config_timestamp).wait
        end
        
        def randr_get_crtc_info_reply (s)
          x = {}
          x[:status], x[:timestamp], x[:x], x[:y], x[:width], x[:height], x[:mode], x[:rotation], x[:rotations], x[:num_outputs], x[:num_possible_outputs], = s.slice!(0, 25).unpack("CLssSSLSSSS")
          x[:mode] = find_resource(x[:mode], "Mode")
          x[:outputs] = s.slice!(0..4*(x[:num_outputs])).unpack('L*')
          x[:outputs] = x[:outputs] ? x[:outputs].map{|x|find_resource(x, "Output")} : []
          *x[:possible] = s.unpack("L*")
          x[:possible] = x[:possible] ? x[:possible].map{|x|find_resource(x, "Output")} : []
          x
        end
        
        def randr_set_crtc_config! (crtc, timestamp, config_timestamp, x, y, mode, rotation, outputs)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 21
          s << [crtc.to_i, timestamp, config_timestamp, x, y, mode.to_i, rotation, *outputs].pack("LLLssLSx2L*")
          send_request(s, :randr_set_crtc_config, true)
        end
        
        def randr_set_crtc_config (crtc, timestamp, config_timestamp, x, y, mode, rotation, outputs)
          randr_set_crtc_config!(crtc, timestamp, config_timestamp, x, y, mode, rotation, outputs).wait
        end
        
        def randr_set_crtc_config_reply (s)
          x = {}
          x[:status], x[:timestamp], = s.slice!(0, 25).unpack("CLx20")
          x
        end
        
        def randr_get_crtc_gamma_size! (crtc)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 22
          s << [crtc.to_i].pack("L")
          send_request(s, :randr_get_crtc_gamma_size, true)
        end
        
        def randr_get_crtc_gamma_size (crtc)
          randr_get_crtc_gamma_size!(crtc).wait
        end
        
        def randr_get_crtc_gamma_size_reply (s)
          x = {}
          x[:size], = s.slice!(0, 25).unpack("x1Sx22")
          x[:size]
        end
        
        def randr_get_crtc_gamma! (crtc)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 23
          s << [crtc.to_i].pack("L")
          send_request(s, :randr_get_crtc_gamma, true)
        end
        
        def randr_get_crtc_gamma (crtc)
          randr_get_crtc_gamma!(crtc).wait
        end
        
        def randr_get_crtc_gamma_reply (s)
          x = {}
          x[:size], = s.slice!(0, 25).unpack("x1Sx22")
          x[:red] = s.slice!(0..2*(x[:size])).unpack('S*')
          x[:green] = s.slice!(0..2*(x[:size])).unpack('S*')
          x[:blue] = s.slice!(0..2*(x[:size])).unpack('S*')
          x
        end
        
        def randr_set_crtc_gamma! (crtc, red, green, blue)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 24
          size = red.length
          size = green.length
          size = blue.length
          s << [crtc.to_i, size].pack("LSx2")
          s << red.map{|x|[x].pack("S")}.join
          s << green.map{|x|[x].pack("S")}.join
          s << [*blue].pack("S*")
          send_request(s, :randr_set_crtc_gamma, false)
        end
        
        def randr_set_crtc_gamma (crtc, red, green, blue)
          randr_set_crtc_gamma!(crtc, red, green, blue).abandon
        end
        
        def randr_get_screen_resources_current! (window)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 25
          s << [window.to_i].pack("L")
          send_request(s, :randr_get_screen_resources_current, true)
        end
        
        def randr_get_screen_resources_current (window)
          randr_get_screen_resources_current!(window).wait
        end
        
        def randr_get_screen_resources_current_reply (s)
          x = {}
          x[:timestamp], x[:config_timestamp], x[:num_crtcs], x[:num_outputs], x[:num_modes], x[:names_len], = s.slice!(0, 25).unpack("x1LLSSSSx8")
          x[:crtcs] = s.slice!(0..4*(x[:num_crtcs])).unpack('L*')
          x[:crtcs] = x[:crtcs] ? x[:crtcs].map{|x|find_resource(x, "Crtc")} : []
          x[:outputs] = s.slice!(0..4*(x[:num_outputs])).unpack('L*')
          x[:outputs] = x[:outputs] ? x[:outputs].map{|x|find_resource(x, "Output")} : []
          x[:modes] = x[:num_modes].times.map{decode_randr_mode_info(s)}
          x[:names] = s.slice!(0, x[:names_len])
          x
        end
        
        def randr_set_crtc_transform! (crtc, transform, filter_name, filter_params)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 26
          filter_name = filter_name.force_encoding('BINARY')
          filter_len = filter_name.bytesize
          s << [crtc.to_i].pack("L")
          s << encode_render_transform(''.encode('BINARY'), *transform)
          s << [filter_len, pad(filter_name), *filter_params].pack("Sx2A*l*")
          send_request(s, :randr_set_crtc_transform, false)
        end
        
        def randr_set_crtc_transform (crtc, transform, filter_name, filter_params)
          randr_set_crtc_transform!(crtc, transform, filter_name, filter_params).abandon
        end
        
        def randr_get_crtc_transform! (crtc)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 27
          s << [crtc.to_i].pack("L")
          send_request(s, :randr_get_crtc_transform, true)
        end
        
        def randr_get_crtc_transform (crtc)
          randr_get_crtc_transform!(crtc).wait
        end
        
        def randr_get_crtc_transform_reply (s)
          x = {}
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
        
        def randr_get_panning! (crtc)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 28
          s << [crtc.to_i].pack("L")
          send_request(s, :randr_get_panning, true)
        end
        
        def randr_get_panning (crtc)
          randr_get_panning!(crtc).wait
        end
        
        def randr_get_panning_reply (s)
          x = {}
          x[:status], x[:timestamp], x[:left], x[:top], x[:width], x[:height], x[:track_left], x[:track_top], x[:track_width], x[:track_height], x[:border_left], x[:border_top], x[:border_right], x[:border_bottom], = s.slice!(0, 29).unpack("CLSSSSSSSSssss")
          x
        end
        
        def randr_set_panning! (crtc, timestamp, left, top, width, height, track_left, track_top, track_width, track_height, border_left, border_top, border_right, border_bottom)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 29
          s << [crtc.to_i, timestamp, left, top, width, height, track_left, track_top, track_width, track_height, border_left, border_top, border_right, border_bottom].pack("LLSSSSSSSSssss")
          send_request(s, :randr_set_panning, true)
        end
        
        def randr_set_panning (crtc, timestamp, left, top, width, height, track_left, track_top, track_width, track_height, border_left, border_top, border_right, border_bottom)
          randr_set_panning!(crtc, timestamp, left, top, width, height, track_left, track_top, track_width, track_height, border_left, border_top, border_right, border_bottom).wait
        end
        
        def randr_set_panning_reply (s)
          x = {}
          x[:status], x[:timestamp], = s.slice!(0, 5).unpack("CL")
          x
        end
        
        def randr_set_output_primary! (window, output)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 30
          s << [window.to_i, output.to_i].pack("LL")
          send_request(s, :randr_set_output_primary, false)
        end
        
        def randr_set_output_primary (window, output)
          randr_set_output_primary!(window, output).abandon
        end
        
        def randr_get_output_primary! (window)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 31
          s << [window.to_i].pack("L")
          send_request(s, :randr_get_output_primary, true)
        end
        
        def randr_get_output_primary (window)
          randr_get_output_primary!(window).wait
        end
        
        def randr_get_output_primary_reply (s)
          x = {}
          x[:output], = s.slice!(0, 5).unpack("x1L")
          x[:output] = find_resource(x[:output], "Output")
          x[:output]
        end
        
        def randr_get_providers! (window)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 32
          s << [window.to_i].pack("L")
          send_request(s, :randr_get_providers, true)
        end
        
        def randr_get_providers (window)
          randr_get_providers!(window).wait
        end
        
        def randr_get_providers_reply (s)
          x = {}
          x[:timestamp], x[:num_providers], *x[:providers] = s.unpack("x1LSx18L*")
          x[:providers] = x[:providers] ? x[:providers].map{|x|find_resource(x, "Provider")} : []
          x
        end
        
        def randr_get_provider_info! (provider, config_timestamp)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 33
          s << [provider.to_i, config_timestamp].pack("LL")
          send_request(s, :randr_get_provider_info, true)
        end
        
        def randr_get_provider_info (provider, config_timestamp)
          randr_get_provider_info!(provider, config_timestamp).wait
        end
        
        def randr_get_provider_info_reply (s)
          x = {}
          x[:status], x[:timestamp], x[:capabilities], x[:num_crtcs], x[:num_outputs], x[:num_associated_providers], x[:name_len], = s.slice!(0, 25).unpack("CLLSSSSx8")
          x[:crtcs] = s.slice!(0..4*(x[:num_crtcs])).unpack('L*')
          x[:crtcs] = x[:crtcs] ? x[:crtcs].map{|x|find_resource(x, "Crtc")} : []
          x[:outputs] = s.slice!(0..4*(x[:num_outputs])).unpack('L*')
          x[:outputs] = x[:outputs] ? x[:outputs].map{|x|find_resource(x, "Output")} : []
          x[:associated_providers] = s.slice!(0..4*(x[:num_associated_providers])).unpack('L*')
          x[:associated_providers] = x[:associated_providers] ? x[:associated_providers].map{|x|find_resource(x, "Provider")} : []
          x[:associated_capability] = s.slice!(0..4*(x[:num_associated_providers])).unpack('L*')
          x[:name] = s.slice!(0, x[:name_len])
          x
        end
        
        def randr_set_provider_offload_sink! (provider, sink_provider, config_timestamp)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 34
          s << [provider.to_i, sink_provider.to_i, config_timestamp].pack("LLL")
          send_request(s, :randr_set_provider_offload_sink, false)
        end
        
        def randr_set_provider_offload_sink (provider, sink_provider, config_timestamp)
          randr_set_provider_offload_sink!(provider, sink_provider, config_timestamp).abandon
        end
        
        def randr_set_provider_output_source! (provider, source_provider, config_timestamp)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 35
          s << [provider.to_i, source_provider.to_i, config_timestamp].pack("LLL")
          send_request(s, :randr_set_provider_output_source, false)
        end
        
        def randr_set_provider_output_source (provider, source_provider, config_timestamp)
          randr_set_provider_output_source!(provider, source_provider, config_timestamp).abandon
        end
        
        def randr_list_provider_properties! (provider)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 36
          s << [provider.to_i].pack("L")
          send_request(s, :randr_list_provider_properties, true)
        end
        
        def randr_list_provider_properties (provider)
          randr_list_provider_properties!(provider).wait
        end
        
        def randr_list_provider_properties_reply (s)
          x = {}
          x[:num_atoms], *x[:atoms] = s.unpack("x1Sx22L*")
          x[:atoms] = x[:atoms] ? x[:atoms].map{|x|find_atom(x)} : []
          x[:atoms]
        end
        
        def randr_query_provider_property! (provider, property)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 37
          s << [provider.to_i, atom(property)].pack("LL")
          send_request(s, :randr_query_provider_property, true)
        end
        
        def randr_query_provider_property (provider, property)
          randr_query_provider_property!(provider, property).wait
        end
        
        def randr_query_provider_property_reply (s)
          x = {}
          x[:pending], x[:range], x[:immutable], = s.slice!(0, 25).unpack("x1CCCx21")
          x[:pending] = x[:pending] != 0
          x[:range] = x[:range] != 0
          x[:immutable] = x[:immutable] != 0
          x[:valid_values] = x[:length].times.map{s.slice!(0, 4).unpack("l")[0]}
          x
        end
        
        def randr_configure_provider_property! (provider, property, pending, range, values)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 38
          s << [provider.to_i, atom(property), pending ? 1 : 0, range ? 1 : 0, *values].pack("LLCCx2l*")
          send_request(s, :randr_configure_provider_property, false)
        end
        
        def randr_configure_provider_property (provider, property, pending, range, values)
          randr_configure_provider_property!(provider, property, pending, range, values).abandon
        end
        
        def randr_change_provider_property! (provider, property, type, format, mode, num_items, data)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 39
          s << [provider.to_i, atom(property), atom(type), format, mode, num_items, pad(data)].pack("LLLCCx2LA*")
          send_request(s, :randr_change_provider_property, false)
        end
        
        def randr_change_provider_property (provider, property, type, format, mode, num_items, data)
          randr_change_provider_property!(provider, property, type, format, mode, num_items, data).abandon
        end
        
        def randr_delete_provider_property! (provider, property)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 40
          s << [provider.to_i, atom(property)].pack("LL")
          send_request(s, :randr_delete_provider_property, false)
        end
        
        def randr_delete_provider_property (provider, property)
          randr_delete_provider_property!(provider, property).abandon
        end
        
        def randr_get_provider_property! (provider, property, type, long_offset, long_length, delete, pending)
          s = opcodes["RANDR"].chr.encode('BINARY')
          s << 41
          s << [provider.to_i, atom(property), atom(type), long_offset, long_length, delete ? 1 : 0, pending ? 1 : 0].pack("LLLLLCCx2")
          send_request(s, :randr_get_provider_property, true)
        end
        
        def randr_get_provider_property (provider, property, type, long_offset, long_length, delete, pending)
          randr_get_provider_property!(provider, property, type, long_offset, long_length, delete, pending).wait
        end
        
        def randr_get_provider_property_reply (s)
          x = {}
          x[:format], x[:type], x[:bytes_after], x[:num_items], = s.slice!(0, 25).unpack("CLLLx12")
          x[:type] = find_atom(x[:type])
          x[:data] = s.slice!(0, (x[:num_items] * (x[:format] / 8)))
          x
        end
        
        def encode_randr_screen_change_notify_event_hash (hash)
          rotation = hash[:rotation]
          timestamp = hash[:timestamp]
          config_timestamp = hash[:config_timestamp]
          root = hash[:root]
          request_window = hash[:request_window]
          sizeID = hash[:sizeID]
          subpixel_order = hash[:subpixel_order]
          width = hash[:width]
          height = hash[:height]
          mwidth = hash[:mwidth]
          mheight = hash[:mheight]
          s = 0.chr.encode('BINARY')
          s << [rotation, timestamp, config_timestamp, root.to_i, request_window.to_i, sizeID, subpixel_order, width, height, mwidth, mheight].pack("CLLLLSSSSSS")
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
        
        def decode_randr_screen_change_notify_event (s)
          x = {}
          x[:rotation], x[:timestamp], x[:config_timestamp], x[:root], x[:request_window], x[:sizeID], x[:subpixel_order], x[:width], x[:height], x[:mwidth], x[:mheight], = s.slice!(0, 29).unpack("CLLLLSSSSSS")
          x[:root] = find_resource(x[:root], "Window")
          x[:request_window] = find_resource(x[:request_window], "Window")
          x
        end
        
        def encode_randr_notify_event_hash (hash)
          subCode = hash[:subCode]
          u = hash[:u]
          s = 1.chr.encode('BINARY')
          s << [subCode].pack("C")
          s << encode_randr_notify_data(''.encode('BINARY'), *u)
          s = s.ljust(30, "\0")
          s[2, 0] = "\0\0"
          s
        end
        
        def decode_randr_notify_event (s)
          x = {}
          x[:subCode], = s.slice!(0, 1).unpack("C")
          x[:u] = decode_randr_notify_data(s)
          x
        end
        
        def encode_randr_screen_size (s, width, height, mwidth, mheight)
          s << [width, height, mwidth, mheight].pack("SSSS")
          s
        end
        
        def decode_randr_screen_size (s)
          x = {}
          x[:width], x[:height], x[:mwidth], x[:mheight], = s.slice!(0, 8).unpack("SSSS")
          x
        end
        
        def encode_randr_refresh_rates (s, rates)
          nRates = rates.length
          s << [nRates, *rates].pack("SS*")
          s
        end
        
        def decode_randr_refresh_rates (s)
          x = {}
          x[:nRates], = s.slice!(0, 2).unpack("S")
          x[:rates] = s.slice!(0..2*(x[:nRates])).unpack('S*')
          x
        end
        
        def encode_randr_mode_info (s, id, width, height, dot_clock, hsync_start, hsync_end, htotal, hskew, vsync_start, vsync_end, vtotal, name_len, mode_flags)
          s << [id, width, height, dot_clock, hsync_start, hsync_end, htotal, hskew, vsync_start, vsync_end, vtotal, name_len, mode_flags].pack("LSSLSSSSSSSSL")
          s
        end
        
        def decode_randr_mode_info (s)
          x = {}
          x[:id], x[:width], x[:height], x[:dot_clock], x[:hsync_start], x[:hsync_end], x[:htotal], x[:hskew], x[:vsync_start], x[:vsync_end], x[:vtotal], x[:name_len], x[:mode_flags], = s.slice!(0, 32).unpack("LSSLSSSSSSSSL")
          x
        end
        
        def encode_randr_crtc_change (s, timestamp, window, crtc, mode, rotation, x, y, width, height)
          s << [timestamp, window.to_i, crtc.to_i, mode.to_i, rotation, x, y, width, height].pack("LLLLSx2ssSS")
          s
        end
        
        def decode_randr_crtc_change (s)
          x = {}
          x[:timestamp], x[:window], x[:crtc], x[:mode], x[:rotation], x[:x], x[:y], x[:width], x[:height], = s.slice!(0, 28).unpack("LLLLSx2ssSS")
          x[:window] = find_resource(x[:window], "Window")
          x[:crtc] = find_resource(x[:crtc], "Crtc")
          x[:mode] = find_resource(x[:mode], "Mode")
          x
        end
        
        def encode_randr_output_change (s, timestamp, config_timestamp, window, output, crtc, mode, rotation, connection, subpixel_order)
          s << [timestamp, config_timestamp, window.to_i, output.to_i, crtc.to_i, mode.to_i, rotation, connection, subpixel_order].pack("LLLLLLSCC")
          s
        end
        
        def decode_randr_output_change (s)
          x = {}
          x[:timestamp], x[:config_timestamp], x[:window], x[:output], x[:crtc], x[:mode], x[:rotation], x[:connection], x[:subpixel_order], = s.slice!(0, 28).unpack("LLLLLLSCC")
          x[:window] = find_resource(x[:window], "Window")
          x[:output] = find_resource(x[:output], "Output")
          x[:crtc] = find_resource(x[:crtc], "Crtc")
          x[:mode] = find_resource(x[:mode], "Mode")
          x
        end
        
        def encode_randr_output_property (s, window, output, atom, timestamp, status)
          s << [window.to_i, output.to_i, atom(atom), timestamp, status].pack("LLLLCx11")
          s
        end
        
        def decode_randr_output_property (s)
          x = {}
          x[:window], x[:output], x[:atom], x[:timestamp], x[:status], = s.slice!(0, 28).unpack("LLLLCx11")
          x[:window] = find_resource(x[:window], "Window")
          x[:output] = find_resource(x[:output], "Output")
          x[:atom] = find_atom(x[:atom])
          x
        end
        
        def encode_randr_provider_change (s, timestamp, window, provider)
          s << [timestamp, window.to_i, provider.to_i].pack("LLLx16")
          s
        end
        
        def decode_randr_provider_change (s)
          x = {}
          x[:timestamp], x[:window], x[:provider], = s.slice!(0, 28).unpack("LLLx16")
          x[:window] = find_resource(x[:window], "Window")
          x[:provider] = find_resource(x[:provider], "Provider")
          x
        end
        
        def encode_randr_provider_property (s, window, provider, atom, timestamp, state)
          s << [window.to_i, provider.to_i, atom(atom), timestamp, state].pack("LLLLCx11")
          s
        end
        
        def decode_randr_provider_property (s)
          x = {}
          x[:window], x[:provider], x[:atom], x[:timestamp], x[:state], = s.slice!(0, 28).unpack("LLLLCx11")
          x[:window] = find_resource(x[:window], "Window")
          x[:provider] = find_resource(x[:provider], "Provider")
          x[:atom] = find_atom(x[:atom])
          x
        end
        
        def encode_randr_resource_change (s, timestamp, window)
          s << [timestamp, window.to_i].pack("LLx20")
          s
        end
        
        def decode_randr_resource_change (s)
          x = {}
          x[:timestamp], x[:window], = s.slice!(0, 28).unpack("LLx20")
          x[:window] = find_resource(x[:window], "Window")
          x
        end
      
      end
    end
  end
end
