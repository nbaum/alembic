require 'alembic/protocol/xproto'

module Alembic
  
  register_extension "SHAPE"
  
  # shape_query_version ()
  # shape_rectangles (operation, destination_kind, ordering, destination_window, x_offset, y_offset, rectangles)
  # shape_mask (operation, destination_kind, destination_window, x_offset, y_offset, source_bitmap)
  # shape_combine (operation, destination_kind, source_kind, destination_window, x_offset, y_offset, source_window)
  # shape_offset (destination_kind, destination_window, x_offset, y_offset)
  # shape_query_extents (destination_window)
  # shape_select_input (destination_window, enable)
  # shape_input_selected (destination_window)
  # shape_get_rectangles (window, source_kind)
  
  # shape_notify_event (shape_kind, affected_window, extents_x, extents_y, extents_width, extents_height, server_time, shaped)
  
  SHAPE_SO = {:set=>0, :union=>1, :intersect=>2, :subtract=>3, :invert=>4}
  SHAPE_SO_I = {0=>:set, 1=>:union, 2=>:intersect, 3=>:subtract, 4=>:invert}
  
  SHAPE_SO_SET = 0
  SHAPE_SO_UNION = 1
  SHAPE_SO_INTERSECT = 2
  SHAPE_SO_SUBTRACT = 3
  SHAPE_SO_INVERT = 4
  
  SHAPE_SK = {:bounding=>0, :clip=>1, :input=>2}
  SHAPE_SK_I = {0=>:bounding, 1=>:clip, 2=>:input}
  
  SHAPE_SK_BOUNDING = 0
  SHAPE_SK_CLIP = 1
  SHAPE_SK_INPUT = 2
  
  register_event "SHAPE", 0, "shape_notify_event", true
  
  module Methods
    
    # :nodoc:
    def shape_query_version! ()
      s = extension_opcode("SHAPE")
      s << 0
      send_request(s, :shape_query_version, true)
    end
    
    # :doc:
    def shape_query_version (*args)
      shape_query_version!(*args).wait
    end
    
    # :nodoc:
    def shape_query_version_reply (s)
      x = {}
      x[:major_version], x[:minor_version], = s.slice!(0, 5).unpack("x1SS")
      x
    end
    
    # :nodoc:
    def shape_rectangles! (operation, destination_kind, ordering, destination_window, x_offset, y_offset, rectangles)
      s = extension_opcode("SHAPE")
      s << 1
      s << [operation, destination_kind, ordering, destination_window.to_i, x_offset, y_offset].pack("CCCx1Lss")
      s << rectangles.map{|x|encode_rectangle(''.encode('BINARY'), *x)}.join
      send_request(s, :shape_rectangles, false)
    end
    
    # :doc:
    def shape_rectangles (*args)
      shape_rectangles!(*args).abandon
    end
    
    # :nodoc:
    def shape_mask! (operation, destination_kind, destination_window, x_offset, y_offset, source_bitmap)
      s = extension_opcode("SHAPE")
      s << 2
      s << [operation, destination_kind, destination_window.to_i, x_offset, y_offset, source_bitmap.to_i].pack("CCx2LssL")
      send_request(s, :shape_mask, false)
    end
    
    # :doc:
    def shape_mask (*args)
      shape_mask!(*args).abandon
    end
    
    # :nodoc:
    def shape_combine! (operation, destination_kind, source_kind, destination_window, x_offset, y_offset, source_window)
      s = extension_opcode("SHAPE")
      s << 3
      s << [operation, destination_kind, source_kind, destination_window.to_i, x_offset, y_offset, source_window.to_i].pack("CCCx1LssL")
      send_request(s, :shape_combine, false)
    end
    
    # :doc:
    def shape_combine (*args)
      shape_combine!(*args).abandon
    end
    
    # :nodoc:
    def shape_offset! (destination_kind, destination_window, x_offset, y_offset)
      s = extension_opcode("SHAPE")
      s << 4
      s << [destination_kind, destination_window.to_i, x_offset, y_offset].pack("Cx3Lss")
      send_request(s, :shape_offset, false)
    end
    
    # :doc:
    def shape_offset (*args)
      shape_offset!(*args).abandon
    end
    
    # :nodoc:
    def shape_query_extents! (destination_window)
      s = extension_opcode("SHAPE")
      s << 5
      s << [destination_window.to_i].pack("L")
      send_request(s, :shape_query_extents, true)
    end
    
    # :doc:
    def shape_query_extents (*args)
      shape_query_extents!(*args).wait
    end
    
    # :nodoc:
    def shape_query_extents_reply (s)
      x = {}
      x[:bounding_shaped], x[:clip_shaped], x[:bounding_shape_extents_x], x[:bounding_shape_extents_y], x[:bounding_shape_extents_width], x[:bounding_shape_extents_height], x[:clip_shape_extents_x], x[:clip_shape_extents_y], x[:clip_shape_extents_width], x[:clip_shape_extents_height], = s.slice!(0, 21).unpack("x1CCx2ssSSssSS")
      x[:bounding_shaped] = x[:bounding_shaped] != 0
      x[:clip_shaped] = x[:clip_shaped] != 0
      x
    end
    
    # :nodoc:
    def shape_select_input! (destination_window, enable)
      s = extension_opcode("SHAPE")
      s << 6
      s << [destination_window.to_i, enable ? 1 : 0].pack("LCx3")
      send_request(s, :shape_select_input, false)
    end
    
    # :doc:
    def shape_select_input (*args)
      shape_select_input!(*args).abandon
    end
    
    # :nodoc:
    def shape_input_selected! (destination_window)
      s = extension_opcode("SHAPE")
      s << 7
      s << [destination_window.to_i].pack("L")
      send_request(s, :shape_input_selected, true)
    end
    
    # :doc:
    def shape_input_selected (*args)
      shape_input_selected!(*args).wait
    end
    
    # :nodoc:
    def shape_input_selected_reply (s)
      x = {}
      x[:enabled], = s.slice!(0, 1).unpack("C")
      x[:enabled] = x[:enabled] != 0
      x[:enabled]
    end
    
    # :nodoc:
    def shape_get_rectangles! (window, source_kind)
      s = extension_opcode("SHAPE")
      s << 8
      s << [window.to_i, source_kind].pack("LCx3")
      send_request(s, :shape_get_rectangles, true)
    end
    
    # :doc:
    def shape_get_rectangles (*args)
      shape_get_rectangles!(*args).wait
    end
    
    # :nodoc:
    def shape_get_rectangles_reply (s)
      x = {}
      x[:ordering], x[:rectangles_len], = s.slice!(0, 25).unpack("CLx20")
      x[:rectangles] = x[:rectangles_len].times.map{decode_rectangle(s)}
      x
    end
    
    # :nodoc:
    # :nodoc:
    def encode_shape_notify_event_hash (hash)
      shape_kind = hash[:shape_kind]
      affected_window = hash[:affected_window]
      extents_x = hash[:extents_x]
      extents_y = hash[:extents_y]
      extents_width = hash[:extents_width]
      extents_height = hash[:extents_height]
      server_time = hash[:server_time]
      shaped = hash[:shaped]
      s = 0.chr.encode('BINARY')
      s << [shape_kind, affected_window.to_i, extents_x, extents_y, extents_width, extents_height, server_time, shaped ? 1 : 0].pack("CLssSSLCx11")
      s = s.ljust(30, "\0")
      s[2, 0] = "\0\0"
      s
    end
    
    # :nodoc:
    def decode_shape_notify_event (s)
      x = {}
      x[:shape_kind], x[:affected_window], x[:extents_x], x[:extents_y], x[:extents_width], x[:extents_height], x[:server_time], x[:shaped], = s.slice!(0, 29).unpack("CLssSSLCx11")
      x[:affected_window] = find_resource(x[:affected_window], "Window")
      x[:shaped] = x[:shaped] != 0
      x
    end
  
  end
end
