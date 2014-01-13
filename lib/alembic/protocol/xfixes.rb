require 'alembic/protocol/xproto'
require 'alembic/protocol/render'
require 'alembic/protocol/shape'

module Alembic
  
  register_extension "XFIXES"
  
  # xfixes_query_version (client_major_version, client_minor_version)
  # xfixes_change_save_set (mode, target, map, window)
  # xfixes_select_selection_input (window, selection, event_mask)
  # xfixes_select_cursor_input (window, event_mask)
  # xfixes_get_cursor_image ()
  # xfixes_create_region (region, rectangles)
  # xfixes_create_region_from_bitmap (region, bitmap)
  # xfixes_create_region_from_window (region, window, kind)
  # xfixes_create_region_from_gc (region, gc)
  # xfixes_create_region_from_picture (region, picture)
  # xfixes_destroy_region (region)
  # xfixes_set_region (region, rectangles)
  # xfixes_copy_region (source, destination)
  # xfixes_union_region (source1, source2, destination)
  # xfixes_intersect_region (source1, source2, destination)
  # xfixes_subtract_region (source1, source2, destination)
  # xfixes_invert_region (source, bounds, destination)
  # xfixes_translate_region (region, dx, dy)
  # xfixes_region_extents (source, destination)
  # xfixes_fetch_region (region)
  # xfixes_set_gc_clip_region (gc, region, x_origin, y_origin)
  # xfixes_set_window_shape_region (dest, dest_kind, x_offset, y_offset, region)
  # xfixes_set_picture_clip_region (picture, region, x_origin, y_origin)
  # xfixes_set_cursor_name (cursor, name)
  # xfixes_get_cursor_name (cursor)
  # xfixes_get_cursor_image_and_name ()
  # xfixes_change_cursor (source, destination)
  # xfixes_change_cursor_by_name (src, name)
  # xfixes_expand_region (source, destination, left, right, top, bottom)
  # xfixes_hide_cursor (window)
  # xfixes_show_cursor (window)
  # xfixes_create_pointer_barrier (barrier, window, x1, y1, x2, y2, directions, devices)
  # xfixes_delete_pointer_barrier (barrier)
  
  # xfixes_selection_notify_event (subtype, window, owner, selection, timestamp, selection_timestamp)
  # xfixes_cursor_notify_event (subtype, window, cursor_serial, timestamp, name)
  
  XFIXES_SAVE_SET_MODE = {:insert=>0, :delete=>1}
  XFIXES_SAVE_SET_MODE_I = {0=>:insert, 1=>:delete}
  
  XFIXES_SAVE_SET_MODE_INSERT = 0
  XFIXES_SAVE_SET_MODE_DELETE = 1
  
  XFIXES_SAVE_SET_TARGET = {:nearest=>0, :root=>1}
  XFIXES_SAVE_SET_TARGET_I = {0=>:nearest, 1=>:root}
  
  XFIXES_SAVE_SET_TARGET_NEAREST = 0
  XFIXES_SAVE_SET_TARGET_ROOT = 1
  
  XFIXES_SAVE_SET_MAPPING = {:map=>0, :unmap=>1}
  XFIXES_SAVE_SET_MAPPING_I = {0=>:map, 1=>:unmap}
  
  XFIXES_SAVE_SET_MAPPING_MAP = 0
  XFIXES_SAVE_SET_MAPPING_UNMAP = 1
  
  XFIXES_SELECTION_EVENT = {:set_selection_owner=>0, :selection_window_destroy=>1, :selection_client_close=>2}
  XFIXES_SELECTION_EVENT_I = {0=>:set_selection_owner, 1=>:selection_window_destroy, 2=>:selection_client_close}
  
  XFIXES_SELECTION_EVENT_SET_SELECTION_OWNER = 0
  XFIXES_SELECTION_EVENT_SELECTION_WINDOW_DESTROY = 1
  XFIXES_SELECTION_EVENT_SELECTION_CLIENT_CLOSE = 2
  
  XFIXES_SELECTION_EVENT_MASK = {:set_selection_owner=>1, :selection_window_destroy=>2, :selection_client_close=>4}
  XFIXES_SELECTION_EVENT_MASK_I = {1=>:set_selection_owner, 2=>:selection_window_destroy, 4=>:selection_client_close}
  
  XFIXES_SELECTION_EVENT_MASK_SET_SELECTION_OWNER = 1
  XFIXES_SELECTION_EVENT_MASK_SELECTION_WINDOW_DESTROY = 2
  XFIXES_SELECTION_EVENT_MASK_SELECTION_CLIENT_CLOSE = 4
  
  XFIXES_CURSOR_NOTIFY = {:display_cursor=>0}
  XFIXES_CURSOR_NOTIFY_I = {0=>:display_cursor}
  
  XFIXES_CURSOR_NOTIFY_DISPLAY_CURSOR = 0
  
  XFIXES_CURSOR_NOTIFY_MASK = {:display_cursor=>1}
  XFIXES_CURSOR_NOTIFY_MASK_I = {1=>:display_cursor}
  
  XFIXES_CURSOR_NOTIFY_MASK_DISPLAY_CURSOR = 1
  
  XFIXES_REGION = {:none=>0}
  XFIXES_REGION_I = {0=>:none}
  
  XFIXES_REGION_NONE = 0
  
  XFIXES_BARRIER_DIRECTIONS = {:positive_x=>1, :positive_y=>2, :negative_x=>4, :negative_y=>8}
  XFIXES_BARRIER_DIRECTIONS_I = {1=>:positive_x, 2=>:positive_y, 4=>:negative_x, 8=>:negative_y}
  
  XFIXES_BARRIER_DIRECTIONS_POSITIVE_X = 1
  XFIXES_BARRIER_DIRECTIONS_POSITIVE_Y = 2
  XFIXES_BARRIER_DIRECTIONS_NEGATIVE_X = 4
  XFIXES_BARRIER_DIRECTIONS_NEGATIVE_Y = 8
  
  register_event "XFIXES", 0, "xfixes_selection_notify_event", true
  register_event "XFIXES", 1, "xfixes_cursor_notify_event", true
  
  register_error "XFIXES", 0, "XfixesBadRegionError"
  
  class XFixesRegion < Resource
  end
  class XFixesBarrier < Resource
  end
  
  module Methods
    
    # :nodoc:
    def xfixes_query_version! (client_major_version, client_minor_version)
      s = extension_opcode("XFIXES")
      s << 0
      s << [client_major_version, client_minor_version].pack("LL")
      send_request(s, :xfixes_query_version, true)
    end
    
    # :doc:
    def xfixes_query_version (*args)
      xfixes_query_version!(*args).wait
    end
    
    # :nodoc:
    def xfixes_query_version_reply (s)
      x = {}
      x[:major_version], x[:minor_version], = s.slice!(0, 25).unpack("x1LLx16")
      x
    end
    
    # :nodoc:
    def xfixes_change_save_set! (mode, target, map, window)
      s = extension_opcode("XFIXES")
      s << 1
      s << [mode, target, map, window.to_i].pack("CCCx1L")
      send_request(s, :xfixes_change_save_set, false)
    end
    
    # :doc:
    def xfixes_change_save_set (*args)
      xfixes_change_save_set!(*args).abandon
    end
    
    # :nodoc:
    def xfixes_select_selection_input! (window, selection, event_mask)
      s = extension_opcode("XFIXES")
      s << 2
      s << [window.to_i, atom(selection), event_mask].pack("LLL")
      send_request(s, :xfixes_select_selection_input, false)
    end
    
    # :doc:
    def xfixes_select_selection_input (*args)
      xfixes_select_selection_input!(*args).abandon
    end
    
    # :nodoc:
    def xfixes_select_cursor_input! (window, event_mask)
      s = extension_opcode("XFIXES")
      s << 3
      s << [window.to_i, event_mask].pack("LL")
      send_request(s, :xfixes_select_cursor_input, false)
    end
    
    # :doc:
    def xfixes_select_cursor_input (*args)
      xfixes_select_cursor_input!(*args).abandon
    end
    
    # :nodoc:
    def xfixes_get_cursor_image! ()
      s = extension_opcode("XFIXES")
      s << 4
      send_request(s, :xfixes_get_cursor_image, true)
    end
    
    # :doc:
    def xfixes_get_cursor_image (*args)
      xfixes_get_cursor_image!(*args).wait
    end
    
    # :nodoc:
    def xfixes_get_cursor_image_reply (s)
      x = {}
      x[:x], x[:y], x[:width], x[:height], x[:xhot], x[:yhot], x[:cursor_serial], *x[:cursor_image] = s.unpack("x1ssSSSSLx8L*")
      x
    end
    
    # :nodoc:
    def xfixes_create_region! (region, rectangles)
      s = extension_opcode("XFIXES")
      s << 5
      s << [region.to_i].pack("L")
      s << rectangles.map{|x|encode_rectangle(''.encode('BINARY'), *x)}.join
      send_request(s, :xfixes_create_region, false)
    end
    
    # :doc:
    def xfixes_create_region (*args)
      xfixes_create_region!(*args).abandon
    end
    
    # :nodoc:
    def xfixes_create_region_from_bitmap! (region, bitmap)
      s = extension_opcode("XFIXES")
      s << 6
      s << [region.to_i, bitmap.to_i].pack("LL")
      send_request(s, :xfixes_create_region_from_bitmap, false)
    end
    
    # :doc:
    def xfixes_create_region_from_bitmap (*args)
      xfixes_create_region_from_bitmap!(*args).abandon
    end
    
    # :nodoc:
    def xfixes_create_region_from_window! (region, window, kind)
      s = extension_opcode("XFIXES")
      s << 7
      s << [region.to_i, window.to_i, kind].pack("LLCx3")
      send_request(s, :xfixes_create_region_from_window, false)
    end
    
    # :doc:
    def xfixes_create_region_from_window (*args)
      xfixes_create_region_from_window!(*args).abandon
    end
    
    # :nodoc:
    def xfixes_create_region_from_gc! (region, gc)
      s = extension_opcode("XFIXES")
      s << 8
      s << [region.to_i, gc.to_i].pack("LL")
      send_request(s, :xfixes_create_region_from_gc, false)
    end
    
    # :doc:
    def xfixes_create_region_from_gc (*args)
      xfixes_create_region_from_gc!(*args).abandon
    end
    
    # :nodoc:
    def xfixes_create_region_from_picture! (region, picture)
      s = extension_opcode("XFIXES")
      s << 9
      s << [region.to_i, picture.to_i].pack("LL")
      send_request(s, :xfixes_create_region_from_picture, false)
    end
    
    # :doc:
    def xfixes_create_region_from_picture (*args)
      xfixes_create_region_from_picture!(*args).abandon
    end
    
    # :nodoc:
    def xfixes_destroy_region! (region)
      s = extension_opcode("XFIXES")
      s << 10
      s << [region.to_i].pack("L")
      send_request(s, :xfixes_destroy_region, false)
    end
    
    # :doc:
    def xfixes_destroy_region (*args)
      xfixes_destroy_region!(*args).abandon
    end
    
    # :nodoc:
    def xfixes_set_region! (region, rectangles)
      s = extension_opcode("XFIXES")
      s << 11
      s << [region.to_i].pack("L")
      s << rectangles.map{|x|encode_rectangle(''.encode('BINARY'), *x)}.join
      send_request(s, :xfixes_set_region, false)
    end
    
    # :doc:
    def xfixes_set_region (*args)
      xfixes_set_region!(*args).abandon
    end
    
    # :nodoc:
    def xfixes_copy_region! (source, destination)
      s = extension_opcode("XFIXES")
      s << 12
      s << [source.to_i, destination.to_i].pack("LL")
      send_request(s, :xfixes_copy_region, false)
    end
    
    # :doc:
    def xfixes_copy_region (*args)
      xfixes_copy_region!(*args).abandon
    end
    
    # :nodoc:
    def xfixes_union_region! (source1, source2, destination)
      s = extension_opcode("XFIXES")
      s << 13
      s << [source1.to_i, source2.to_i, destination.to_i].pack("LLL")
      send_request(s, :xfixes_union_region, false)
    end
    
    # :doc:
    def xfixes_union_region (*args)
      xfixes_union_region!(*args).abandon
    end
    
    # :nodoc:
    def xfixes_intersect_region! (source1, source2, destination)
      s = extension_opcode("XFIXES")
      s << 14
      s << [source1.to_i, source2.to_i, destination.to_i].pack("LLL")
      send_request(s, :xfixes_intersect_region, false)
    end
    
    # :doc:
    def xfixes_intersect_region (*args)
      xfixes_intersect_region!(*args).abandon
    end
    
    # :nodoc:
    def xfixes_subtract_region! (source1, source2, destination)
      s = extension_opcode("XFIXES")
      s << 15
      s << [source1.to_i, source2.to_i, destination.to_i].pack("LLL")
      send_request(s, :xfixes_subtract_region, false)
    end
    
    # :doc:
    def xfixes_subtract_region (*args)
      xfixes_subtract_region!(*args).abandon
    end
    
    # :nodoc:
    def xfixes_invert_region! (source, bounds, destination)
      s = extension_opcode("XFIXES")
      s << 16
      s << [source.to_i].pack("L")
      s << encode_rectangle(''.encode('BINARY'), *bounds)
      s << [destination.to_i].pack("L")
      send_request(s, :xfixes_invert_region, false)
    end
    
    # :doc:
    def xfixes_invert_region (*args)
      xfixes_invert_region!(*args).abandon
    end
    
    # :nodoc:
    def xfixes_translate_region! (region, dx, dy)
      s = extension_opcode("XFIXES")
      s << 17
      s << [region.to_i, dx, dy].pack("Lss")
      send_request(s, :xfixes_translate_region, false)
    end
    
    # :doc:
    def xfixes_translate_region (*args)
      xfixes_translate_region!(*args).abandon
    end
    
    # :nodoc:
    def xfixes_region_extents! (source, destination)
      s = extension_opcode("XFIXES")
      s << 18
      s << [source.to_i, destination.to_i].pack("LL")
      send_request(s, :xfixes_region_extents, false)
    end
    
    # :doc:
    def xfixes_region_extents (*args)
      xfixes_region_extents!(*args).abandon
    end
    
    # :nodoc:
    def xfixes_fetch_region! (region)
      s = extension_opcode("XFIXES")
      s << 19
      s << [region.to_i].pack("L")
      send_request(s, :xfixes_fetch_region, true)
    end
    
    # :doc:
    def xfixes_fetch_region (*args)
      xfixes_fetch_region!(*args).wait
    end
    
    # :nodoc:
    def xfixes_fetch_region_reply (s)
      x = {}
      s.slice!(0, 1)
      x[:extents] = decode_rectangle(s)
      s.slice!(0, 16)
      x[:rectangles] = (x[:length] / 2).times.map{decode_rectangle(s)}
      x
    end
    
    # :nodoc:
    def xfixes_set_gc_clip_region! (gc, region, x_origin, y_origin)
      s = extension_opcode("XFIXES")
      s << 20
      s << [gc.to_i, region.to_i, x_origin, y_origin].pack("LLss")
      send_request(s, :xfixes_set_gc_clip_region, false)
    end
    
    # :doc:
    def xfixes_set_gc_clip_region (*args)
      xfixes_set_gc_clip_region!(*args).abandon
    end
    
    # :nodoc:
    def xfixes_set_window_shape_region! (dest, dest_kind, x_offset, y_offset, region)
      s = extension_opcode("XFIXES")
      s << 21
      s << [dest.to_i, dest_kind, x_offset, y_offset, region.to_i].pack("LCx3ssL")
      send_request(s, :xfixes_set_window_shape_region, false)
    end
    
    # :doc:
    def xfixes_set_window_shape_region (*args)
      xfixes_set_window_shape_region!(*args).abandon
    end
    
    # :nodoc:
    def xfixes_set_picture_clip_region! (picture, region, x_origin, y_origin)
      s = extension_opcode("XFIXES")
      s << 22
      s << [picture.to_i, region.to_i, x_origin, y_origin].pack("LLss")
      send_request(s, :xfixes_set_picture_clip_region, false)
    end
    
    # :doc:
    def xfixes_set_picture_clip_region (*args)
      xfixes_set_picture_clip_region!(*args).abandon
    end
    
    # :nodoc:
    def xfixes_set_cursor_name! (cursor, name)
      s = extension_opcode("XFIXES")
      s << 23
      name = name.force_encoding('BINARY')
      nbytes = name.bytesize
      s << [cursor.to_i, nbytes, pad(name)].pack("LSx2A*")
      send_request(s, :xfixes_set_cursor_name, false)
    end
    
    # :doc:
    def xfixes_set_cursor_name (*args)
      xfixes_set_cursor_name!(*args).abandon
    end
    
    # :nodoc:
    def xfixes_get_cursor_name! (cursor)
      s = extension_opcode("XFIXES")
      s << 24
      s << [cursor.to_i].pack("L")
      send_request(s, :xfixes_get_cursor_name, true)
    end
    
    # :doc:
    def xfixes_get_cursor_name (*args)
      xfixes_get_cursor_name!(*args).wait
    end
    
    # :nodoc:
    def xfixes_get_cursor_name_reply (s)
      x = {}
      x[:atom], x[:nbytes], = s.slice!(0, 25).unpack("x1LSx18")
      x[:atom] = find_atom(x[:atom])
      x[:name] = s.slice!(0, x[:nbytes])
      x
    end
    
    # :nodoc:
    def xfixes_get_cursor_image_and_name! ()
      s = extension_opcode("XFIXES")
      s << 25
      send_request(s, :xfixes_get_cursor_image_and_name, true)
    end
    
    # :doc:
    def xfixes_get_cursor_image_and_name (*args)
      xfixes_get_cursor_image_and_name!(*args).wait
    end
    
    # :nodoc:
    def xfixes_get_cursor_image_and_name_reply (s)
      x = {}
      x[:x], x[:y], x[:width], x[:height], x[:xhot], x[:yhot], x[:cursor_serial], x[:cursor_atom], x[:nbytes], = s.slice!(0, 25).unpack("x1ssSSSSLLSx2")
      x[:cursor_atom] = find_atom(x[:cursor_atom])
      x[:name] = s.slice!(0, x[:nbytes])
      *x[:cursor_image] = s.unpack("L*")
      x
    end
    
    # :nodoc:
    def xfixes_change_cursor! (source, destination)
      s = extension_opcode("XFIXES")
      s << 26
      s << [source.to_i, destination.to_i].pack("LL")
      send_request(s, :xfixes_change_cursor, false)
    end
    
    # :doc:
    def xfixes_change_cursor (*args)
      xfixes_change_cursor!(*args).abandon
    end
    
    # :nodoc:
    def xfixes_change_cursor_by_name! (src, name)
      s = extension_opcode("XFIXES")
      s << 27
      name = name.force_encoding('BINARY')
      nbytes = name.bytesize
      s << [src.to_i, nbytes, pad(name)].pack("LSx2A*")
      send_request(s, :xfixes_change_cursor_by_name, false)
    end
    
    # :doc:
    def xfixes_change_cursor_by_name (*args)
      xfixes_change_cursor_by_name!(*args).abandon
    end
    
    # :nodoc:
    def xfixes_expand_region! (source, destination, left, right, top, bottom)
      s = extension_opcode("XFIXES")
      s << 28
      s << [source.to_i, destination.to_i, left, right, top, bottom].pack("LLSSSS")
      send_request(s, :xfixes_expand_region, false)
    end
    
    # :doc:
    def xfixes_expand_region (*args)
      xfixes_expand_region!(*args).abandon
    end
    
    # :nodoc:
    def xfixes_hide_cursor! (window)
      s = extension_opcode("XFIXES")
      s << 29
      s << [window.to_i].pack("L")
      send_request(s, :xfixes_hide_cursor, false)
    end
    
    # :doc:
    def xfixes_hide_cursor (*args)
      xfixes_hide_cursor!(*args).abandon
    end
    
    # :nodoc:
    def xfixes_show_cursor! (window)
      s = extension_opcode("XFIXES")
      s << 30
      s << [window.to_i].pack("L")
      send_request(s, :xfixes_show_cursor, false)
    end
    
    # :doc:
    def xfixes_show_cursor (*args)
      xfixes_show_cursor!(*args).abandon
    end
    
    # :nodoc:
    def xfixes_create_pointer_barrier! (barrier, window, x1, y1, x2, y2, directions, devices)
      s = extension_opcode("XFIXES")
      s << 31
      num_devices = devices.length
      s << [barrier.to_i, window.to_i, x1, y1, x2, y2, directions, num_devices, *devices].pack("LLSSSSLx2SS*")
      send_request(s, :xfixes_create_pointer_barrier, false)
    end
    
    # :doc:
    def xfixes_create_pointer_barrier (*args)
      xfixes_create_pointer_barrier!(*args).abandon
    end
    
    # :nodoc:
    def xfixes_delete_pointer_barrier! (barrier)
      s = extension_opcode("XFIXES")
      s << 32
      s << [barrier.to_i].pack("L")
      send_request(s, :xfixes_delete_pointer_barrier, false)
    end
    
    # :doc:
    def xfixes_delete_pointer_barrier (*args)
      xfixes_delete_pointer_barrier!(*args).abandon
    end
    
    # :nodoc:
    # :nodoc:
    def encode_xfixes_selection_notify_event_hash (hash)
      subtype = hash[:subtype]
      window = hash[:window]
      owner = hash[:owner]
      selection = hash[:selection]
      timestamp = hash[:timestamp]
      selection_timestamp = hash[:selection_timestamp]
      s = 0.chr.encode('BINARY')
      s << [subtype, window.to_i, owner.to_i, atom(selection), timestamp, selection_timestamp].pack("CLLLLLx8")
      s = s.ljust(30, "\0")
      s[2, 0] = "\0\0"
      s
    end
    
    # :nodoc:
    def decode_xfixes_selection_notify_event (s)
      x = {}
      x[:subtype], x[:window], x[:owner], x[:selection], x[:timestamp], x[:selection_timestamp], = s.slice!(0, 29).unpack("CLLLLLx8")
      x[:window] = find_resource(x[:window], "Window")
      x[:owner] = find_resource(x[:owner], "Window")
      x[:selection] = find_atom(x[:selection])
      x
    end
    
    # :nodoc:
    # :nodoc:
    def encode_xfixes_cursor_notify_event_hash (hash)
      subtype = hash[:subtype]
      window = hash[:window]
      cursor_serial = hash[:cursor_serial]
      timestamp = hash[:timestamp]
      name = hash[:name]
      s = 1.chr.encode('BINARY')
      s << [subtype, window.to_i, cursor_serial, timestamp, atom(name)].pack("CLLLLx12")
      s = s.ljust(30, "\0")
      s[2, 0] = "\0\0"
      s
    end
    
    # :nodoc:
    def decode_xfixes_cursor_notify_event (s)
      x = {}
      x[:subtype], x[:window], x[:cursor_serial], x[:timestamp], x[:name], = s.slice!(0, 29).unpack("CLLLLx12")
      x[:window] = find_resource(x[:window], "Window")
      x[:name] = find_atom(x[:name])
      x
    end
  
  end
end
