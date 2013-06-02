X11.api do
def encode_key_press_event (detail, time, root, event, child, root_x, root_y, event_x, event_y, state, same_screen)
  format = "CCx2LLLLssssSCx1"
  args = [2, detail, time, root, event, child, root_x, root_y, event_x, event_y, state, same_screen]
  args.pack(format)
end

def decode_key_press_event (string)
  format = "Cx2LLLLssssSCx1"
  detail, time, root, event, child, root_x, root_y, event_x, event_y, state, same_screen = string.unpack(format)
  {
    detail: detail,
    time: time,
    root: root,
    event: event,
    child: child,
    root_x: root_x,
    root_y: root_y,
    event_x: event_x,
    event_y: event_y,
    state: state,
    same_screen: same_screen,
  }
end

register_event 2, :key_press

def encode_key_release_event (detail, time, root, event, child, root_x, root_y, event_x, event_y, state, same_screen)
  format = "CCx2x2LLLLssssSCx1"
  args = [3, detail, time, root, event, child, root_x, root_y, event_x, event_y, state, same_screen]
  args.pack(format)
end

def decode_key_release_event (string)
  format = "Cx2x2LLLLssssSCx1"
  detail, time, root, event, child, root_x, root_y, event_x, event_y, state, same_screen = string.unpack(format)
  {
    detail: detail,
    time: time,
    root: root,
    event: event,
    child: child,
    root_x: root_x,
    root_y: root_y,
    event_x: event_x,
    event_y: event_y,
    state: state,
    same_screen: same_screen,
  }
end

register_event 3, :key_release

def encode_button_press_event (detail, time, root, event, child, root_x, root_y, event_x, event_y, state, same_screen)
  format = "CCx2LLLLssssSCx1"
  args = [4, detail, time, root, event, child, root_x, root_y, event_x, event_y, state, same_screen]
  args.pack(format)
end

def decode_button_press_event (string)
  format = "Cx2LLLLssssSCx1"
  detail, time, root, event, child, root_x, root_y, event_x, event_y, state, same_screen = string.unpack(format)
  {
    detail: detail,
    time: time,
    root: root,
    event: event,
    child: child,
    root_x: root_x,
    root_y: root_y,
    event_x: event_x,
    event_y: event_y,
    state: state,
    same_screen: same_screen,
  }
end

register_event 4, :button_press

def encode_button_release_event (detail, time, root, event, child, root_x, root_y, event_x, event_y, state, same_screen)
  format = "CCx2x2LLLLssssSCx1"
  args = [5, detail, time, root, event, child, root_x, root_y, event_x, event_y, state, same_screen]
  args.pack(format)
end

def decode_button_release_event (string)
  format = "Cx2x2LLLLssssSCx1"
  detail, time, root, event, child, root_x, root_y, event_x, event_y, state, same_screen = string.unpack(format)
  {
    detail: detail,
    time: time,
    root: root,
    event: event,
    child: child,
    root_x: root_x,
    root_y: root_y,
    event_x: event_x,
    event_y: event_y,
    state: state,
    same_screen: same_screen,
  }
end

register_event 5, :button_release

def encode_motion_notify_event (detail, time, root, event, child, root_x, root_y, event_x, event_y, state, same_screen)
  format = "CCx2LLLLssssSCx1"
  args = [6, detail, time, root, event, child, root_x, root_y, event_x, event_y, state, same_screen]
  args.pack(format)
end

def decode_motion_notify_event (string)
  format = "Cx2LLLLssssSCx1"
  detail, time, root, event, child, root_x, root_y, event_x, event_y, state, same_screen = string.unpack(format)
  {
    detail: detail,
    time: time,
    root: root,
    event: event,
    child: child,
    root_x: root_x,
    root_y: root_y,
    event_x: event_x,
    event_y: event_y,
    state: state,
    same_screen: same_screen,
  }
end

register_event 6, :motion_notify

def encode_enter_notify_event (detail, time, root, event, child, root_x, root_y, event_x, event_y, state, mode, same_screen_focus)
  format = "CCx2LLLLssssSCC"
  args = [7, detail, time, root, event, child, root_x, root_y, event_x, event_y, state, mode, same_screen_focus]
  args.pack(format)
end

def decode_enter_notify_event (string)
  format = "Cx2LLLLssssSCC"
  detail, time, root, event, child, root_x, root_y, event_x, event_y, state, mode, same_screen_focus = string.unpack(format)
  {
    detail: detail,
    time: time,
    root: root,
    event: event,
    child: child,
    root_x: root_x,
    root_y: root_y,
    event_x: event_x,
    event_y: event_y,
    state: state,
    mode: mode,
    same_screen_focus: same_screen_focus,
  }
end

register_event 7, :enter_notify

def encode_leave_notify_event (detail, time, root, event, child, root_x, root_y, event_x, event_y, state, mode, same_screen_focus)
  format = "CCx2x2LLLLssssSCC"
  args = [8, detail, time, root, event, child, root_x, root_y, event_x, event_y, state, mode, same_screen_focus]
  args.pack(format)
end

def decode_leave_notify_event (string)
  format = "Cx2x2LLLLssssSCC"
  detail, time, root, event, child, root_x, root_y, event_x, event_y, state, mode, same_screen_focus = string.unpack(format)
  {
    detail: detail,
    time: time,
    root: root,
    event: event,
    child: child,
    root_x: root_x,
    root_y: root_y,
    event_x: event_x,
    event_y: event_y,
    state: state,
    mode: mode,
    same_screen_focus: same_screen_focus,
  }
end

register_event 8, :leave_notify

def encode_focus_in_event (detail, event, mode)
  format = "CCx2LCx3"
  args = [9, detail, event, mode]
  args.pack(format)
end

def decode_focus_in_event (string)
  format = "Cx2LCx3"
  detail, event, mode = string.unpack(format)
  {
    detail: detail,
    event: event,
    mode: mode,
  }
end

register_event 9, :focus_in

def encode_focus_out_event (detail, event, mode)
  format = "CCx2x2LCx3"
  args = [10, detail, event, mode]
  args.pack(format)
end

def decode_focus_out_event (string)
  format = "Cx2x2LCx3"
  detail, event, mode = string.unpack(format)
  {
    detail: detail,
    event: event,
    mode: mode,
  }
end

register_event 10, :focus_out

def encode_keymap_notify_event (keys)
  format = "CC*x2"
  args = [11, keys]
  args.pack(format)
end

def decode_keymap_notify_event (string)
  format = "C*x2"
  keys = string.unpack(format)
  {
    keys: keys,
  }
end

register_event 11, :keymap_notify

def encode_expose_event (window, x, y, width, height, count)
  format = "Cx1x2LSSSSSx2"
  args = [12, window, x, y, width, height, count]
  args.pack(format)
end

def decode_expose_event (string)
  format = "x1x2LSSSSSx2"
  window, x, y, width, height, count = string.unpack(format)
  {
    window: window,
    x: x,
    y: y,
    width: width,
    height: height,
    count: count,
  }
end

register_event 12, :expose

def encode_graphics_exposure_event (drawable, x, y, width, height, minor_opcode, count, major_opcode)
  format = "Cx1x2LSSSSSSCx3"
  args = [13, drawable, x, y, width, height, minor_opcode, count, major_opcode]
  args.pack(format)
end

def decode_graphics_exposure_event (string)
  format = "x1x2LSSSSSSCx3"
  drawable, x, y, width, height, minor_opcode, count, major_opcode = string.unpack(format)
  {
    drawable: drawable,
    x: x,
    y: y,
    width: width,
    height: height,
    minor_opcode: minor_opcode,
    count: count,
    major_opcode: major_opcode,
  }
end

register_event 13, :graphics_exposure

def encode_no_exposure_event (drawable, minor_opcode, major_opcode)
  format = "Cx1x2LSCx1"
  args = [14, drawable, minor_opcode, major_opcode]
  args.pack(format)
end

def decode_no_exposure_event (string)
  format = "x1x2LSCx1"
  drawable, minor_opcode, major_opcode = string.unpack(format)
  {
    drawable: drawable,
    minor_opcode: minor_opcode,
    major_opcode: major_opcode,
  }
end

register_event 14, :no_exposure

def encode_visibility_notify_event (window, state)
  format = "Cx1x2LCx3"
  args = [15, window, state]
  args.pack(format)
end

def decode_visibility_notify_event (string)
  format = "x1x2LCx3"
  window, state = string.unpack(format)
  {
    window: window,
    state: state,
  }
end

register_event 15, :visibility_notify

def encode_create_notify_event (parent, window, x, y, width, height, border_width, override_redirect)
  format = "Cx1x2LLssSSSCx1"
  args = [16, parent, window, x, y, width, height, border_width, override_redirect]
  args.pack(format)
end

def decode_create_notify_event (string)
  format = "x1x2LLssSSSCx1"
  parent, window, x, y, width, height, border_width, override_redirect = string.unpack(format)
  {
    parent: parent,
    window: window,
    x: x,
    y: y,
    width: width,
    height: height,
    border_width: border_width,
    override_redirect: override_redirect,
  }
end

register_event 16, :create_notify

def encode_destroy_notify_event (event, window)
  format = "Cx1x2LL"
  args = [17, event, window]
  args.pack(format)
end

def decode_destroy_notify_event (string)
  format = "x1x2LL"
  event, window = string.unpack(format)
  {
    event: event,
    window: window,
  }
end

register_event 17, :destroy_notify

def encode_unmap_notify_event (event, window, from_configure)
  format = "Cx1x2LLCx3"
  args = [18, event, window, from_configure]
  args.pack(format)
end

def decode_unmap_notify_event (string)
  format = "x1x2LLCx3"
  event, window, from_configure = string.unpack(format)
  {
    event: event,
    window: window,
    from_configure: from_configure,
  }
end

register_event 18, :unmap_notify

def encode_map_notify_event (event, window, override_redirect)
  format = "Cx1x2LLCx3"
  args = [19, event, window, override_redirect]
  args.pack(format)
end

def decode_map_notify_event (string)
  format = "x1x2LLCx3"
  event, window, override_redirect = string.unpack(format)
  {
    event: event,
    window: window,
    override_redirect: override_redirect,
  }
end

register_event 19, :map_notify

def encode_map_request_event (parent, window)
  format = "Cx1x2LL"
  args = [20, parent, window]
  args.pack(format)
end

def decode_map_request_event (string)
  format = "x1x2LL"
  parent, window = string.unpack(format)
  {
    parent: parent,
    window: window,
  }
end

register_event 20, :map_request

def encode_reparent_notify_event (event, window, parent, x, y, override_redirect)
  format = "Cx1x2LLLssCx3"
  args = [21, event, window, parent, x, y, override_redirect]
  args.pack(format)
end

def decode_reparent_notify_event (string)
  format = "x1x2LLLssCx3"
  event, window, parent, x, y, override_redirect = string.unpack(format)
  {
    event: event,
    window: window,
    parent: parent,
    x: x,
    y: y,
    override_redirect: override_redirect,
  }
end

register_event 21, :reparent_notify

def encode_configure_notify_event (event, window, above_sibling, x, y, width, height, border_width, override_redirect)
  format = "Cx1x2LLLssSSSCx1"
  args = [22, event, window, above_sibling, x, y, width, height, border_width, override_redirect]
  args.pack(format)
end

def decode_configure_notify_event (string)
  format = "x1x2LLLssSSSCx1"
  event, window, above_sibling, x, y, width, height, border_width, override_redirect = string.unpack(format)
  {
    event: event,
    window: window,
    above_sibling: above_sibling,
    x: x,
    y: y,
    width: width,
    height: height,
    border_width: border_width,
    override_redirect: override_redirect,
  }
end

register_event 22, :configure_notify

def encode_configure_request_event (stack_mode, parent, window, sibling, x, y, width, height, border_width, value_mask)
  format = "CCx2LLLssSSSS"
  args = [23, stack_mode, parent, window, sibling, x, y, width, height, border_width, value_mask]
  args.pack(format)
end

def decode_configure_request_event (string)
  format = "Cx2LLLssSSSS"
  stack_mode, parent, window, sibling, x, y, width, height, border_width, value_mask = string.unpack(format)
  {
    stack_mode: stack_mode,
    parent: parent,
    window: window,
    sibling: sibling,
    x: x,
    y: y,
    width: width,
    height: height,
    border_width: border_width,
    value_mask: value_mask,
  }
end

register_event 23, :configure_request

def encode_gravity_notify_event (event, window, x, y)
  format = "Cx1x2LLss"
  args = [24, event, window, x, y]
  args.pack(format)
end

def decode_gravity_notify_event (string)
  format = "x1x2LLss"
  event, window, x, y = string.unpack(format)
  {
    event: event,
    window: window,
    x: x,
    y: y,
  }
end

register_event 24, :gravity_notify

def encode_resize_request_event (window, width, height)
  format = "Cx1x2LSS"
  args = [25, window, width, height]
  args.pack(format)
end

def decode_resize_request_event (string)
  format = "x1x2LSS"
  window, width, height = string.unpack(format)
  {
    window: window,
    width: width,
    height: height,
  }
end

register_event 25, :resize_request

def encode_circulate_notify_event (event, window, place)
  format = "Cx1x2LLx4Cx3"
  args = [26, event, window, place]
  args.pack(format)
end

def decode_circulate_notify_event (string)
  format = "x1x2LLx4Cx3"
  event, window, place = string.unpack(format)
  {
    event: event,
    window: window,
    place: place,
  }
end

register_event 26, :circulate_notify

def encode_circulate_request_event (event, window, place)
  format = "Cx1x2x2LLx4Cx3"
  args = [27, event, window, place]
  args.pack(format)
end

def decode_circulate_request_event (string)
  format = "x1x2x2LLx4Cx3"
  event, window, place = string.unpack(format)
  {
    event: event,
    window: window,
    place: place,
  }
end

register_event 27, :circulate_request

def encode_property_notify_event (window, atom, time, state)
  format = "Cx1x2LLLCx3"
  args = [28, window, atom, time, state]
  args.pack(format)
end

def decode_property_notify_event (string)
  format = "x1x2LLLCx3"
  window, atom, time, state = string.unpack(format)
  {
    window: window,
    atom: atom,
    time: time,
    state: state,
  }
end

register_event 28, :property_notify

def encode_selection_clear_event (time, owner, selection)
  format = "Cx1x2LLL"
  args = [29, time, owner, selection]
  args.pack(format)
end

def decode_selection_clear_event (string)
  format = "x1x2LLL"
  time, owner, selection = string.unpack(format)
  {
    time: time,
    owner: owner,
    selection: selection,
  }
end

register_event 29, :selection_clear

def encode_selection_request_event (time, owner, requestor, selection, target, property)
  format = "Cx1x2LLLLLL"
  args = [30, time, owner, requestor, selection, target, property]
  args.pack(format)
end

def decode_selection_request_event (string)
  format = "x1x2LLLLLL"
  time, owner, requestor, selection, target, property = string.unpack(format)
  {
    time: time,
    owner: owner,
    requestor: requestor,
    selection: selection,
    target: target,
    property: property,
  }
end

register_event 30, :selection_request

def encode_selection_notify_event (time, requestor, selection, target, property)
  format = "Cx1x2LLLLL"
  args = [31, time, requestor, selection, target, property]
  args.pack(format)
end

def decode_selection_notify_event (string)
  format = "x1x2LLLLL"
  time, requestor, selection, target, property = string.unpack(format)
  {
    time: time,
    requestor: requestor,
    selection: selection,
    target: target,
    property: property,
  }
end

register_event 31, :selection_notify

def encode_colormap_notify_event (window, colormap, new, state)
  format = "Cx1x2LLCCx2"
  args = [32, window, colormap, new, state]
  args.pack(format)
end

def decode_colormap_notify_event (string)
  format = "x1x2LLCCx2"
  window, colormap, new, state = string.unpack(format)
  {
    window: window,
    colormap: colormap,
    new: new,
    state: state,
  }
end

register_event 32, :colormap_notify

def encode_client_message_event (format, window, type, data)
  format = "CCx2LL!{#<struct Proto::Union name=\"ClientMessageData\", fields=[#<struct Proto::List name=\"data8\", type=\"CARD8\", length=\"\">, #<struct Proto::List name=\"data16\", type=\"CARD16\", length=\"\">, #<struct Proto::List name=\"data32\", type=\"CARD32\", length=\"\">]>}"
  args = [33, format, window, type, data]
  args.pack(format)
end

def decode_client_message_event (string)
  format = "Cx2LL!{#<struct Proto::Union name=\"ClientMessageData\", fields=[#<struct Proto::List name=\"data8\", type=\"CARD8\", length=\"\">, #<struct Proto::List name=\"data16\", type=\"CARD16\", length=\"\">, #<struct Proto::List name=\"data32\", type=\"CARD32\", length=\"\">]>}"
  format, window, type, data = string.unpack(format)
  {
    format: format,
    window: window,
    type: type,
    data: data,
  }
end

register_event 33, :client_message

def encode_mapping_notify_event (request, first_keycode, count)
  format = "Cx1x2CCCx1"
  args = [34, request, first_keycode, count]
  args.pack(format)
end

def decode_mapping_notify_event (string)
  format = "x1x2CCCx1"
  request, first_keycode, count = string.unpack(format)
  {
    request: request,
    first_keycode: first_keycode,
    count: count,
  }
end

register_event 34, :mapping_notify

def encode_create_window_request (depth, wid, parent, x, y, width, height, border_width, class, visual, value_mask, value_list)
  format = "CCx2LLssSSSSLLL*"
  args = [1, depth, wid, parent, x, y, width, height, border_width, class, visual, value_mask, value_list]
  args.pack(format)
end

def encode_change_window_attributes_request (window, value_mask, value_list)
  format = "Cx1x2LLL*"
  args = [2, window, value_mask, value_list]
  args.pack(format)
end

def encode_get_window_attributes_request (window)
  format = "Cx1x2L"
  args = [3, window]
  args.pack(format)
end

def decode_get_window_attributes_reply (string)
  format = "Cx2LSCCLLCCCCLLLSx2"
  backing_store, visual, class, bit_gravity, win_gravity, backing_planes, backing_pixel, save_under, map_is_installed, map_state, override_redirect, colormap, all_event_masks, your_event_mask, do_not_propagate_mask = string.unpack(format)
  {
    backing_store: backing_store,
    visual: visual,
    class: class,
    bit_gravity: bit_gravity,
    win_gravity: win_gravity,
    backing_planes: backing_planes,
    backing_pixel: backing_pixel,
    save_under: save_under,
    map_is_installed: map_is_installed,
    map_state: map_state,
    override_redirect: override_redirect,
    colormap: colormap,
    all_event_masks: all_event_masks,
    your_event_mask: your_event_mask,
    do_not_propagate_mask: do_not_propagate_mask,
  }
end

def encode_destroy_window_request (window)
  format = "Cx1x2L"
  args = [4, window]
  args.pack(format)
end

def encode_destroy_subwindows_request (window)
  format = "Cx1x2L"
  args = [5, window]
  args.pack(format)
end

def encode_change_save_set_request (mode, window)
  format = "CCx2L"
  args = [6, mode, window]
  args.pack(format)
end

def encode_reparent_window_request (window, parent, x, y)
  format = "Cx1x2LLss"
  args = [7, window, parent, x, y]
  args.pack(format)
end

def encode_map_window_request (window)
  format = "Cx1x2L"
  args = [8, window]
  args.pack(format)
end

def encode_map_subwindows_request (window)
  format = "Cx1x2L"
  args = [9, window]
  args.pack(format)
end

def encode_unmap_window_request (window)
  format = "Cx1x2L"
  args = [10, window]
  args.pack(format)
end

def encode_unmap_subwindows_request (window)
  format = "Cx1x2L"
  args = [11, window]
  args.pack(format)
end

def encode_configure_window_request (window, value_mask, value_list)
  format = "Cx1x2Lx2SL*"
  args = [12, window, value_mask, value_list]
  args.pack(format)
end

def encode_circulate_window_request (direction, window)
  format = "CCx2L"
  args = [13, direction, window]
  args.pack(format)
end

def encode_get_geometry_request (drawable)
  format = "Cx1x2L"
  args = [14, drawable]
  args.pack(format)
end

def decode_get_geometry_reply (string)
  format = "Cx2LssSSSx2"
  depth, root, x, y, width, height, border_width = string.unpack(format)
  {
    depth: depth,
    root: root,
    x: x,
    y: y,
    width: width,
    height: height,
    border_width: border_width,
  }
end

def encode_query_tree_request (window)
  format = "Cx1x2L"
  args = [15, window]
  args.pack(format)
end

def decode_query_tree_reply (string)
  format = "x1x2LLSx14L*"
  root, parent, children_len, children = string.unpack(format)
  {
    root: root,
    parent: parent,
    children_len: children_len,
    children: children,
  }
end

def encode_intern_atom_request (only_if_exists, name_len, name)
  format = "CCx2Sx2a*"
  args = [16, only_if_exists, name_len, name]
  args.pack(format)
end

def decode_intern_atom_reply (string)
  format = "x1x2L"
  atom = string.unpack(format)
  {
    atom: atom,
  }
end

def encode_get_atom_name_request (atom)
  format = "Cx1x2L"
  args = [17, atom]
  args.pack(format)
end

def decode_get_atom_name_reply (string)
  format = "x1x2Sx22a*"
  name_len, name = string.unpack(format)
  {
    name_len: name_len,
    name: name,
  }
end

def encode_change_property_request (mode, window, property, type, format, data_len, data)
  format = "CCx2LLLCx3La*"
  args = [18, mode, window, property, type, format, data_len, data]
  args.pack(format)
end

def encode_delete_property_request (window, property)
  format = "Cx1x2LL"
  args = [19, window, property]
  args.pack(format)
end

def encode_get_property_request (delete, window, property, type, long_offset, long_length)
  format = "CCx2LLLLL"
  args = [20, delete, window, property, type, long_offset, long_length]
  args.pack(format)
end

def decode_get_property_reply (string)
  format = "Cx2LLLx12a*"
  format, type, bytes_after, value_len, value = string.unpack(format)
  {
    format: format,
    type: type,
    bytes_after: bytes_after,
    value_len: value_len,
    value: value,
  }
end

def encode_list_properties_request (window)
  format = "Cx1x2L"
  args = [21, window]
  args.pack(format)
end

def decode_list_properties_reply (string)
  format = "x1x2Sx22L*"
  atoms_len, atoms = string.unpack(format)
  {
    atoms_len: atoms_len,
    atoms: atoms,
  }
end

def encode_set_selection_owner_request (owner, selection, time)
  format = "Cx1x2LLL"
  args = [22, owner, selection, time]
  args.pack(format)
end

def encode_get_selection_owner_request (selection)
  format = "Cx1x2L"
  args = [23, selection]
  args.pack(format)
end

def decode_get_selection_owner_reply (string)
  format = "x1x2L"
  owner = string.unpack(format)
  {
    owner: owner,
  }
end

def encode_convert_selection_request (requestor, selection, target, property, time)
  format = "Cx1x2LLLLL"
  args = [24, requestor, selection, target, property, time]
  args.pack(format)
end

def encode_send_event_request (propagate, destination, event_mask, event)
  format = "CCx2LLa*"
  args = [25, propagate, destination, event_mask, event]
  args.pack(format)
end

def encode_grab_pointer_request (owner_events, grab_window, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, time)
  format = "CCx2LSCCLLL"
  args = [26, owner_events, grab_window, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, time]
  args.pack(format)
end

def decode_grab_pointer_reply (string)
  format = "Cx2"
  status = string.unpack(format)
  {
    status: status,
  }
end

def encode_ungrab_pointer_request (time)
  format = "Cx1x2L"
  args = [27, time]
  args.pack(format)
end

def encode_grab_button_request (owner_events, grab_window, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, button, modifiers)
  format = "CCx2LSCCLLCx1S"
  args = [28, owner_events, grab_window, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, button, modifiers]
  args.pack(format)
end

def encode_ungrab_button_request (button, grab_window, modifiers)
  format = "CCx2LSx2"
  args = [29, button, grab_window, modifiers]
  args.pack(format)
end

def encode_change_active_pointer_grab_request (cursor, time, event_mask)
  format = "Cx1x2LLSx2"
  args = [30, cursor, time, event_mask]
  args.pack(format)
end

def encode_grab_keyboard_request (owner_events, grab_window, time, pointer_mode, keyboard_mode)
  format = "CCx2LLCCx2"
  args = [31, owner_events, grab_window, time, pointer_mode, keyboard_mode]
  args.pack(format)
end

def decode_grab_keyboard_reply (string)
  format = "Cx2"
  status = string.unpack(format)
  {
    status: status,
  }
end

def encode_ungrab_keyboard_request (time)
  format = "Cx1x2L"
  args = [32, time]
  args.pack(format)
end

def encode_grab_key_request (owner_events, grab_window, modifiers, key, pointer_mode, keyboard_mode)
  format = "CCx2LSCCCx3"
  args = [33, owner_events, grab_window, modifiers, key, pointer_mode, keyboard_mode]
  args.pack(format)
end

def encode_ungrab_key_request (key, grab_window, modifiers)
  format = "CCx2LSx2"
  args = [34, key, grab_window, modifiers]
  args.pack(format)
end

def encode_allow_events_request (mode, time)
  format = "CCx2L"
  args = [35, mode, time]
  args.pack(format)
end

def encode_grab_server_request ()
  format = "Cx1x2"
  args = [36, ]
  args.pack(format)
end

def encode_ungrab_server_request ()
  format = "Cx1x2"
  args = [37, ]
  args.pack(format)
end

def encode_query_pointer_request (window)
  format = "Cx1x2L"
  args = [38, window]
  args.pack(format)
end

def decode_query_pointer_reply (string)
  format = "Cx2LLssssSx2"
  same_screen, root, child, root_x, root_y, win_x, win_y, mask = string.unpack(format)
  {
    same_screen: same_screen,
    root: root,
    child: child,
    root_x: root_x,
    root_y: root_y,
    win_x: win_x,
    win_y: win_y,
    mask: mask,
  }
end

def encode_get_motion_events_request (window, start, stop)
  format = "Cx1x2LLL"
  args = [39, window, start, stop]
  args.pack(format)
end

def decode_get_motion_events_reply (string)
  format = "x1x2Lx20[Lss]"
  events_len, events = string.unpack(format)
  {
    events_len: events_len,
    events: events,
  }
end

def encode_translate_coordinates_request (src_window, dst_window, src_x, src_y)
  format = "Cx1x2LLss"
  args = [40, src_window, dst_window, src_x, src_y]
  args.pack(format)
end

def decode_translate_coordinates_reply (string)
  format = "Cx2Lss"
  same_screen, child, dst_x, dst_y = string.unpack(format)
  {
    same_screen: same_screen,
    child: child,
    dst_x: dst_x,
    dst_y: dst_y,
  }
end

def encode_warp_pointer_request (src_window, dst_window, src_x, src_y, src_width, src_height, dst_x, dst_y)
  format = "Cx1x2LLssSSss"
  args = [41, src_window, dst_window, src_x, src_y, src_width, src_height, dst_x, dst_y]
  args.pack(format)
end

def encode_set_input_focus_request (revert_to, focus, time)
  format = "CCx2LL"
  args = [42, revert_to, focus, time]
  args.pack(format)
end

def encode_get_input_focus_request ()
  format = "Cx1x2"
  args = [43, ]
  args.pack(format)
end

def decode_get_input_focus_reply (string)
  format = "Cx2L"
  revert_to, focus = string.unpack(format)
  {
    revert_to: revert_to,
    focus: focus,
  }
end

def encode_query_keymap_request ()
  format = "Cx1x2"
  args = [44, ]
  args.pack(format)
end

def decode_query_keymap_reply (string)
  format = "x1x2C*"
  keys = string.unpack(format)
  {
    keys: keys,
  }
end

def encode_open_font_request (fid, name_len, name)
  format = "Cx1x2LSx2a*"
  args = [45, fid, name_len, name]
  args.pack(format)
end

def encode_close_font_request (font)
  format = "Cx1x2L"
  args = [46, font]
  args.pack(format)
end

def encode_query_font_request (font)
  format = "Cx1x2L"
  args = [47, font]
  args.pack(format)
end

def decode_query_font_reply (string)
  format = "x1x2!{#<struct Proto::Struct name=\"CHARINFO\", fields=[#<struct Proto::Scalar name=\"left_side_bearing\", type=\"INT16\">, #<struct Proto::Scalar name=\"right_side_bearing\", type=\"INT16\">, #<struct Proto::Scalar name=\"character_width\", type=\"INT16\">, #<struct Proto::Scalar name=\"ascent\", type=\"INT16\">, #<struct Proto::Scalar name=\"descent\", type=\"INT16\">, #<struct Proto::Scalar name=\"attributes\", type=\"CARD16\">]>}x4!{#<struct Proto::Struct name=\"CHARINFO\", fields=[#<struct Proto::Scalar name=\"left_side_bearing\", type=\"INT16\">, #<struct Proto::Scalar name=\"right_side_bearing\", type=\"INT16\">, #<struct Proto::Scalar name=\"character_width\", type=\"INT16\">, #<struct Proto::Scalar name=\"ascent\", type=\"INT16\">, #<struct Proto::Scalar name=\"descent\", type=\"INT16\">, #<struct Proto::Scalar name=\"attributes\", type=\"CARD16\">]>}x4SSSSCCCCssL[LL][sssssS]"
  min_bounds, max_bounds, min_char_or_byte2, max_char_or_byte2, default_char, properties_len, draw_direction, min_byte1, max_byte1, all_chars_exist, font_ascent, font_descent, char_infos_len, properties, char_infos = string.unpack(format)
  {
    min_bounds: min_bounds,
    max_bounds: max_bounds,
    min_char_or_byte2: min_char_or_byte2,
    max_char_or_byte2: max_char_or_byte2,
    default_char: default_char,
    properties_len: properties_len,
    draw_direction: draw_direction,
    min_byte1: min_byte1,
    max_byte1: max_byte1,
    all_chars_exist: all_chars_exist,
    font_ascent: font_ascent,
    font_descent: font_descent,
    char_infos_len: char_infos_len,
    properties: properties,
    char_infos: char_infos,
  }
end

def encode_query_text_extents_request (odd_length, font, string)
  format = "CCx2L[CC]"
  args = [48, odd_length, font, string]
  args.pack(format)
end

def decode_query_text_extents_reply (string)
  format = "Cx2sssslll"
  draw_direction, font_ascent, font_descent, overall_ascent, overall_descent, overall_width, overall_left, overall_right = string.unpack(format)
  {
    draw_direction: draw_direction,
    font_ascent: font_ascent,
    font_descent: font_descent,
    overall_ascent: overall_ascent,
    overall_descent: overall_descent,
    overall_width: overall_width,
    overall_left: overall_left,
    overall_right: overall_right,
  }
end

def encode_list_fonts_request (max_names, pattern_len, pattern)
  format = "Cx1x2SSa*"
  args = [49, max_names, pattern_len, pattern]
  args.pack(format)
end

def decode_list_fonts_reply (string)
  format = "x1x2Sx22[Ca*]"
  names_len, names = string.unpack(format)
  {
    names_len: names_len,
    names: names,
  }
end

def encode_list_fonts_with_info_request (max_names, pattern_len, pattern)
  format = "Cx1x2SSa*"
  args = [50, max_names, pattern_len, pattern]
  args.pack(format)
end

def decode_list_fonts_with_info_reply (string)
  format = "Cx2!{#<struct Proto::Struct name=\"CHARINFO\", fields=[#<struct Proto::Scalar name=\"left_side_bearing\", type=\"INT16\">, #<struct Proto::Scalar name=\"right_side_bearing\", type=\"INT16\">, #<struct Proto::Scalar name=\"character_width\", type=\"INT16\">, #<struct Proto::Scalar name=\"ascent\", type=\"INT16\">, #<struct Proto::Scalar name=\"descent\", type=\"INT16\">, #<struct Proto::Scalar name=\"attributes\", type=\"CARD16\">]>}x4!{#<struct Proto::Struct name=\"CHARINFO\", fields=[#<struct Proto::Scalar name=\"left_side_bearing\", type=\"INT16\">, #<struct Proto::Scalar name=\"right_side_bearing\", type=\"INT16\">, #<struct Proto::Scalar name=\"character_width\", type=\"INT16\">, #<struct Proto::Scalar name=\"ascent\", type=\"INT16\">, #<struct Proto::Scalar name=\"descent\", type=\"INT16\">, #<struct Proto::Scalar name=\"attributes\", type=\"CARD16\">]>}x4SSSSCCCCssL[LL]a*"
  name_len, min_bounds, max_bounds, min_char_or_byte2, max_char_or_byte2, default_char, properties_len, draw_direction, min_byte1, max_byte1, all_chars_exist, font_ascent, font_descent, replies_hint, properties, name = string.unpack(format)
  {
    name_len: name_len,
    min_bounds: min_bounds,
    max_bounds: max_bounds,
    min_char_or_byte2: min_char_or_byte2,
    max_char_or_byte2: max_char_or_byte2,
    default_char: default_char,
    properties_len: properties_len,
    draw_direction: draw_direction,
    min_byte1: min_byte1,
    max_byte1: max_byte1,
    all_chars_exist: all_chars_exist,
    font_ascent: font_ascent,
    font_descent: font_descent,
    replies_hint: replies_hint,
    properties: properties,
    name: name,
  }
end

def encode_set_font_path_request (font_qty, font)
  format = "Cx1x2Sx2[Ca*]"
  args = [51, font_qty, font]
  args.pack(format)
end

def encode_get_font_path_request ()
  format = "Cx1x2"
  args = [52, ]
  args.pack(format)
end

def decode_get_font_path_reply (string)
  format = "x1x2Sx22[Ca*]"
  path_len, path = string.unpack(format)
  {
    path_len: path_len,
    path: path,
  }
end

def encode_create_pixmap_request (depth, pid, drawable, width, height)
  format = "CCx2LLSS"
  args = [53, depth, pid, drawable, width, height]
  args.pack(format)
end

def encode_free_pixmap_request (pixmap)
  format = "Cx1x2L"
  args = [54, pixmap]
  args.pack(format)
end

def encode_create_gc_request (cid, drawable, value_mask, value_list)
  format = "Cx1x2LLLL*"
  args = [55, cid, drawable, value_mask, value_list]
  args.pack(format)
end

def encode_change_gc_request (gc, value_mask, value_list)
  format = "Cx1x2LLL*"
  args = [56, gc, value_mask, value_list]
  args.pack(format)
end

def encode_copy_gc_request (src_gc, dst_gc, value_mask)
  format = "Cx1x2LLL"
  args = [57, src_gc, dst_gc, value_mask]
  args.pack(format)
end

def encode_set_dashes_request (gc, dash_offset, dashes_len, dashes)
  format = "Cx1x2LSSC*"
  args = [58, gc, dash_offset, dashes_len, dashes]
  args.pack(format)
end

def encode_set_clip_rectangles_request (ordering, gc, clip_x_origin, clip_y_origin, rectangles)
  format = "CCx2Lss[ssSS]"
  args = [59, ordering, gc, clip_x_origin, clip_y_origin, rectangles]
  args.pack(format)
end

def encode_free_gc_request (gc)
  format = "Cx1x2L"
  args = [60, gc]
  args.pack(format)
end

def encode_clear_area_request (exposures, window, x, y, width, height)
  format = "CCx2LssSS"
  args = [61, exposures, window, x, y, width, height]
  args.pack(format)
end

def encode_copy_area_request (src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height)
  format = "Cx1x2LLLssssSS"
  args = [62, src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height]
  args.pack(format)
end

def encode_copy_plane_request (src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height, bit_plane)
  format = "Cx1x2LLLssssSSL"
  args = [63, src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height, bit_plane]
  args.pack(format)
end

def encode_poly_point_request (coordinate_mode, drawable, gc, points)
  format = "CCx2LL[ss]"
  args = [64, coordinate_mode, drawable, gc, points]
  args.pack(format)
end

def encode_poly_line_request (coordinate_mode, drawable, gc, points)
  format = "CCx2LL[ss]"
  args = [65, coordinate_mode, drawable, gc, points]
  args.pack(format)
end

def encode_poly_segment_request (drawable, gc, segments)
  format = "Cx1x2LL[ssss]"
  args = [66, drawable, gc, segments]
  args.pack(format)
end

def encode_poly_rectangle_request (drawable, gc, rectangles)
  format = "Cx1x2LL[ssSS]"
  args = [67, drawable, gc, rectangles]
  args.pack(format)
end

def encode_poly_arc_request (drawable, gc, arcs)
  format = "Cx1x2LL[ssSSss]"
  args = [68, drawable, gc, arcs]
  args.pack(format)
end

def encode_fill_poly_request (drawable, gc, shape, coordinate_mode, points)
  format = "Cx1x2LLCCx2[ss]"
  args = [69, drawable, gc, shape, coordinate_mode, points]
  args.pack(format)
end

def encode_poly_fill_rectangle_request (drawable, gc, rectangles)
  format = "Cx1x2LL[ssSS]"
  args = [70, drawable, gc, rectangles]
  args.pack(format)
end

def encode_poly_fill_arc_request (drawable, gc, arcs)
  format = "Cx1x2LL[ssSSss]"
  args = [71, drawable, gc, arcs]
  args.pack(format)
end

def encode_put_image_request (format, drawable, gc, width, height, dst_x, dst_y, left_pad, depth, data)
  format = "CCx2LLSSssCCx2C*"
  args = [72, format, drawable, gc, width, height, dst_x, dst_y, left_pad, depth, data]
  args.pack(format)
end

def encode_get_image_request (format, drawable, x, y, width, height, plane_mask)
  format = "CCx2LssSSL"
  args = [73, format, drawable, x, y, width, height, plane_mask]
  args.pack(format)
end

def decode_get_image_reply (string)
  format = "Cx2Lx20C*"
  depth, visual, data = string.unpack(format)
  {
    depth: depth,
    visual: visual,
    data: data,
  }
end

def encode_poly_text8_request (drawable, gc, x, y, items)
  format = "Cx1x2LLssC*"
  args = [74, drawable, gc, x, y, items]
  args.pack(format)
end

def encode_poly_text16_request (drawable, gc, x, y, items)
  format = "Cx1x2LLssC*"
  args = [75, drawable, gc, x, y, items]
  args.pack(format)
end

def encode_image_text8_request (string_len, drawable, gc, x, y, string)
  format = "CCx2LLssa*"
  args = [76, string_len, drawable, gc, x, y, string]
  args.pack(format)
end

def encode_image_text16_request (string_len, drawable, gc, x, y, string)
  format = "CCx2LLss[CC]"
  args = [77, string_len, drawable, gc, x, y, string]
  args.pack(format)
end

def encode_create_colormap_request (alloc, mid, window, visual)
  format = "CCx2LLL"
  args = [78, alloc, mid, window, visual]
  args.pack(format)
end

def encode_free_colormap_request (cmap)
  format = "Cx1x2L"
  args = [79, cmap]
  args.pack(format)
end

def encode_copy_colormap_and_free_request (mid, src_cmap)
  format = "Cx1x2LL"
  args = [80, mid, src_cmap]
  args.pack(format)
end

def encode_install_colormap_request (cmap)
  format = "Cx1x2L"
  args = [81, cmap]
  args.pack(format)
end

def encode_uninstall_colormap_request (cmap)
  format = "Cx1x2L"
  args = [82, cmap]
  args.pack(format)
end

def encode_list_installed_colormaps_request (window)
  format = "Cx1x2L"
  args = [83, window]
  args.pack(format)
end

def decode_list_installed_colormaps_reply (string)
  format = "x1x2Sx22L*"
  cmaps_len, cmaps = string.unpack(format)
  {
    cmaps_len: cmaps_len,
    cmaps: cmaps,
  }
end

def encode_alloc_color_request (cmap, red, green, blue)
  format = "Cx1x2LSSSx2"
  args = [84, cmap, red, green, blue]
  args.pack(format)
end

def decode_alloc_color_reply (string)
  format = "x1x2SSSx2L"
  red, green, blue, pixel = string.unpack(format)
  {
    red: red,
    green: green,
    blue: blue,
    pixel: pixel,
  }
end

def encode_alloc_named_color_request (cmap, name_len, name)
  format = "Cx1x2LSx2a*"
  args = [85, cmap, name_len, name]
  args.pack(format)
end

def decode_alloc_named_color_reply (string)
  format = "x1x2LSSSSSS"
  pixel, exact_red, exact_green, exact_blue, visual_red, visual_green, visual_blue = string.unpack(format)
  {
    pixel: pixel,
    exact_red: exact_red,
    exact_green: exact_green,
    exact_blue: exact_blue,
    visual_red: visual_red,
    visual_green: visual_green,
    visual_blue: visual_blue,
  }
end

def encode_alloc_color_cells_request (contiguous, cmap, colors, planes)
  format = "CCx2LSS"
  args = [86, contiguous, cmap, colors, planes]
  args.pack(format)
end

def decode_alloc_color_cells_reply (string)
  format = "x1x2SSx20L*L*"
  pixels_len, masks_len, pixels, masks = string.unpack(format)
  {
    pixels_len: pixels_len,
    masks_len: masks_len,
    pixels: pixels,
    masks: masks,
  }
end

def encode_alloc_color_planes_request (contiguous, cmap, colors, reds, greens, blues)
  format = "CCx2LSSSS"
  args = [87, contiguous, cmap, colors, reds, greens, blues]
  args.pack(format)
end

def decode_alloc_color_planes_reply (string)
  format = "x1x2Sx2LLLx8L*"
  pixels_len, red_mask, green_mask, blue_mask, pixels = string.unpack(format)
  {
    pixels_len: pixels_len,
    red_mask: red_mask,
    green_mask: green_mask,
    blue_mask: blue_mask,
    pixels: pixels,
  }
end

def encode_free_colors_request (cmap, plane_mask, pixels)
  format = "Cx1x2LLL*"
  args = [88, cmap, plane_mask, pixels]
  args.pack(format)
end

def encode_store_colors_request (cmap, items)
  format = "Cx1x2L[LSSSCx1]"
  args = [89, cmap, items]
  args.pack(format)
end

def encode_store_named_color_request (flags, cmap, pixel, name_len, name)
  format = "CCx2LLSx2a*"
  args = [90, flags, cmap, pixel, name_len, name]
  args.pack(format)
end

def encode_query_colors_request (cmap, pixels)
  format = "Cx1x2LL*"
  args = [91, cmap, pixels]
  args.pack(format)
end

def decode_query_colors_reply (string)
  format = "x1x2Sx22[SSSx2]"
  colors_len, colors = string.unpack(format)
  {
    colors_len: colors_len,
    colors: colors,
  }
end

def encode_lookup_color_request (cmap, name_len, name)
  format = "Cx1x2LSx2a*"
  args = [92, cmap, name_len, name]
  args.pack(format)
end

def decode_lookup_color_reply (string)
  format = "x1x2SSSSSS"
  exact_red, exact_green, exact_blue, visual_red, visual_green, visual_blue = string.unpack(format)
  {
    exact_red: exact_red,
    exact_green: exact_green,
    exact_blue: exact_blue,
    visual_red: visual_red,
    visual_green: visual_green,
    visual_blue: visual_blue,
  }
end

def encode_create_cursor_request (cid, source, mask, fore_red, fore_green, fore_blue, back_red, back_green, back_blue, x, y)
  format = "Cx1x2LLLSSSSSSSS"
  args = [93, cid, source, mask, fore_red, fore_green, fore_blue, back_red, back_green, back_blue, x, y]
  args.pack(format)
end

def encode_create_glyph_cursor_request (cid, source_font, mask_font, source_char, mask_char, fore_red, fore_green, fore_blue, back_red, back_green, back_blue)
  format = "Cx1x2LLLSSSSSSSS"
  args = [94, cid, source_font, mask_font, source_char, mask_char, fore_red, fore_green, fore_blue, back_red, back_green, back_blue]
  args.pack(format)
end

def encode_free_cursor_request (cursor)
  format = "Cx1x2L"
  args = [95, cursor]
  args.pack(format)
end

def encode_recolor_cursor_request (cursor, fore_red, fore_green, fore_blue, back_red, back_green, back_blue)
  format = "Cx1x2LSSSSSS"
  args = [96, cursor, fore_red, fore_green, fore_blue, back_red, back_green, back_blue]
  args.pack(format)
end

def encode_query_best_size_request (class, drawable, width, height)
  format = "CCx2LSS"
  args = [97, class, drawable, width, height]
  args.pack(format)
end

def decode_query_best_size_reply (string)
  format = "x1x2SS"
  width, height = string.unpack(format)
  {
    width: width,
    height: height,
  }
end

def encode_query_extension_request (name_len, name)
  format = "Cx1x2Sx2a*"
  args = [98, name_len, name]
  args.pack(format)
end

def decode_query_extension_reply (string)
  format = "x1x2CCCC"
  present, major_opcode, first_event, first_error = string.unpack(format)
  {
    present: present,
    major_opcode: major_opcode,
    first_event: first_event,
    first_error: first_error,
  }
end

def encode_list_extensions_request ()
  format = "Cx1x2"
  args = [99, ]
  args.pack(format)
end

def decode_list_extensions_reply (string)
  format = "Cx2x24[Ca*]"
  names_len, names = string.unpack(format)
  {
    names_len: names_len,
    names: names,
  }
end

def encode_change_keyboard_mapping_request (keycode_count, first_keycode, keysyms_per_keycode, keysyms)
  format = "CCx2CCx2L*"
  args = [100, keycode_count, first_keycode, keysyms_per_keycode, keysyms]
  args.pack(format)
end

def encode_get_keyboard_mapping_request (first_keycode, count)
  format = "Cx1x2CC"
  args = [101, first_keycode, count]
  args.pack(format)
end

def decode_get_keyboard_mapping_reply (string)
  format = "Cx2x24L*"
  keysyms_per_keycode, keysyms = string.unpack(format)
  {
    keysyms_per_keycode: keysyms_per_keycode,
    keysyms: keysyms,
  }
end

def encode_change_keyboard_control_request (value_mask, value_list)
  format = "Cx1x2LL*"
  args = [102, value_mask, value_list]
  args.pack(format)
end

def encode_get_keyboard_control_request ()
  format = "Cx1x2"
  args = [103, ]
  args.pack(format)
end

def decode_get_keyboard_control_reply (string)
  format = "Cx2LCCSSx2C*"
  global_auto_repeat, led_mask, key_click_percent, bell_percent, bell_pitch, bell_duration, auto_repeats = string.unpack(format)
  {
    global_auto_repeat: global_auto_repeat,
    led_mask: led_mask,
    key_click_percent: key_click_percent,
    bell_percent: bell_percent,
    bell_pitch: bell_pitch,
    bell_duration: bell_duration,
    auto_repeats: auto_repeats,
  }
end

def encode_bell_request (percent)
  format = "CCx2"
  args = [104, percent]
  args.pack(format)
end

def encode_change_pointer_control_request (acceleration_numerator, acceleration_denominator, threshold, do_acceleration, do_threshold)
  format = "Cx1x2sssCC"
  args = [105, acceleration_numerator, acceleration_denominator, threshold, do_acceleration, do_threshold]
  args.pack(format)
end

def encode_get_pointer_control_request ()
  format = "Cx1x2"
  args = [106, ]
  args.pack(format)
end

def decode_get_pointer_control_reply (string)
  format = "x1x2SSSx18"
  acceleration_numerator, acceleration_denominator, threshold = string.unpack(format)
  {
    acceleration_numerator: acceleration_numerator,
    acceleration_denominator: acceleration_denominator,
    threshold: threshold,
  }
end

def encode_set_screen_saver_request (timeout, interval, prefer_blanking, allow_exposures)
  format = "Cx1x2ssCC"
  args = [107, timeout, interval, prefer_blanking, allow_exposures]
  args.pack(format)
end

def encode_get_screen_saver_request ()
  format = "Cx1x2"
  args = [108, ]
  args.pack(format)
end

def decode_get_screen_saver_reply (string)
  format = "x1x2SSCCx18"
  timeout, interval, prefer_blanking, allow_exposures = string.unpack(format)
  {
    timeout: timeout,
    interval: interval,
    prefer_blanking: prefer_blanking,
    allow_exposures: allow_exposures,
  }
end

def encode_change_hosts_request (mode, family, address_len, address)
  format = "CCx2Cx1SC*"
  args = [109, mode, family, address_len, address]
  args.pack(format)
end

def encode_list_hosts_request ()
  format = "Cx1x2"
  args = [110, ]
  args.pack(format)
end

def decode_list_hosts_reply (string)
  format = "Cx2Sx22[Cx1SC*]"
  mode, hosts_len, hosts = string.unpack(format)
  {
    mode: mode,
    hosts_len: hosts_len,
    hosts: hosts,
  }
end

def encode_set_access_control_request (mode)
  format = "CCx2"
  args = [111, mode]
  args.pack(format)
end

def encode_set_close_down_mode_request (mode)
  format = "CCx2"
  args = [112, mode]
  args.pack(format)
end

def encode_kill_client_request (resource)
  format = "Cx1x2L"
  args = [113, resource]
  args.pack(format)
end

def encode_rotate_properties_request (window, atoms_len, delta, atoms)
  format = "Cx1x2LSsL*"
  args = [114, window, atoms_len, delta, atoms]
  args.pack(format)
end

def encode_force_screen_saver_request (mode)
  format = "CCx2"
  args = [115, mode]
  args.pack(format)
end

def encode_set_pointer_mapping_request (map_len, map)
  format = "CCx2C*"
  args = [116, map_len, map]
  args.pack(format)
end

def decode_set_pointer_mapping_reply (string)
  format = "Cx2"
  status = string.unpack(format)
  {
    status: status,
  }
end

def encode_get_pointer_mapping_request ()
  format = "Cx1x2"
  args = [117, ]
  args.pack(format)
end

def decode_get_pointer_mapping_reply (string)
  format = "Cx2x24C*"
  map_len, map = string.unpack(format)
  {
    map_len: map_len,
    map: map,
  }
end

def encode_set_modifier_mapping_request (keycodes_per_modifier, keycodes)
  format = "CCx2C*"
  args = [118, keycodes_per_modifier, keycodes]
  args.pack(format)
end

def decode_set_modifier_mapping_reply (string)
  format = "Cx2"
  status = string.unpack(format)
  {
    status: status,
  }
end

def encode_get_modifier_mapping_request ()
  format = "Cx1x2"
  args = [119, ]
  args.pack(format)
end

def decode_get_modifier_mapping_reply (string)
  format = "Cx2x24C*"
  keycodes_per_modifier, keycodes = string.unpack(format)
  {
    keycodes_per_modifier: keycodes_per_modifier,
    keycodes: keycodes,
  }
end

def encode_no_operation_request ()
  format = "Cx1x2"
  args = [127, ]
  args.pack(format)
end

end
