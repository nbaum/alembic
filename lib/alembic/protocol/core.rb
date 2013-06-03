module Alembic; end
module Alembic::Protocol; end
module Alembic::Protocol::Core

  Alembic::Constants::VISUAL_CLASS_STATIC_GRAY = 0
  Alembic::Constants::VISUAL_CLASS_GRAY_SCALE = 1
  Alembic::Constants::VISUAL_CLASS_STATIC_COLOR = 2
  Alembic::Constants::VISUAL_CLASS_PSEUDO_COLOR = 3
  Alembic::Constants::VISUAL_CLASS_TRUE_COLOR = 4
  Alembic::Constants::VISUAL_CLASS_DIRECT_COLOR = 5

  Alembic::Constants::VISUAL_CLASSES = {
    0 => "STATIC_GRAY",
    1 => "GRAY_SCALE",
    2 => "STATIC_COLOR",
    3 => "PSEUDO_COLOR",
    4 => "TRUE_COLOR",
    5 => "DIRECT_COLOR",
  }

  Alembic::Constants::EVENT_MASK_NO_EVENT = 0
  Alembic::Constants::EVENT_MASK_KEY_PRESS = 1
  Alembic::Constants::EVENT_MASK_KEY_RELEASE = 2
  Alembic::Constants::EVENT_MASK_BUTTON_PRESS = 4
  Alembic::Constants::EVENT_MASK_BUTTON_RELEASE = 8
  Alembic::Constants::EVENT_MASK_ENTER_WINDOW = 16
  Alembic::Constants::EVENT_MASK_LEAVE_WINDOW = 32
  Alembic::Constants::EVENT_MASK_POINTER_MOTION = 64
  Alembic::Constants::EVENT_MASK_POINTER_MOTION_HINT = 128
  Alembic::Constants::EVENT_MASK_BUTTON1MOTION = 256
  Alembic::Constants::EVENT_MASK_BUTTON2MOTION = 512
  Alembic::Constants::EVENT_MASK_BUTTON3MOTION = 1024
  Alembic::Constants::EVENT_MASK_BUTTON4MOTION = 2048
  Alembic::Constants::EVENT_MASK_BUTTON5MOTION = 4096
  Alembic::Constants::EVENT_MASK_BUTTON_MOTION = 8192
  Alembic::Constants::EVENT_MASK_KEYMAP_STATE = 16384
  Alembic::Constants::EVENT_MASK_EXPOSURE = 32768
  Alembic::Constants::EVENT_MASK_VISIBILITY_CHANGE = 65536
  Alembic::Constants::EVENT_MASK_STRUCTURE_NOTIFY = 131072
  Alembic::Constants::EVENT_MASK_RESIZE_REDIRECT = 262144
  Alembic::Constants::EVENT_MASK_SUBSTRUCTURE_NOTIFY = 524288
  Alembic::Constants::EVENT_MASK_SUBSTRUCTURE_REDIRECT = 1048576
  Alembic::Constants::EVENT_MASK_FOCUS_CHANGE = 2097152
  Alembic::Constants::EVENT_MASK_PROPERTY_CHANGE = 4194304
  Alembic::Constants::EVENT_MASK_COLOR_MAP_CHANGE = 8388608
  Alembic::Constants::EVENT_MASK_OWNER_GRAB_BUTTON = 16777216

  Alembic::Constants::EVENT_MASKS = {
    0 => "NO_EVENT",
    1 => "KEY_PRESS",
    2 => "KEY_RELEASE",
    4 => "BUTTON_PRESS",
    8 => "BUTTON_RELEASE",
    16 => "ENTER_WINDOW",
    32 => "LEAVE_WINDOW",
    64 => "POINTER_MOTION",
    128 => "POINTER_MOTION_HINT",
    256 => "BUTTON1MOTION",
    512 => "BUTTON2MOTION",
    1024 => "BUTTON3MOTION",
    2048 => "BUTTON4MOTION",
    4096 => "BUTTON5MOTION",
    8192 => "BUTTON_MOTION",
    16384 => "KEYMAP_STATE",
    32768 => "EXPOSURE",
    65536 => "VISIBILITY_CHANGE",
    131072 => "STRUCTURE_NOTIFY",
    262144 => "RESIZE_REDIRECT",
    524288 => "SUBSTRUCTURE_NOTIFY",
    1048576 => "SUBSTRUCTURE_REDIRECT",
    2097152 => "FOCUS_CHANGE",
    4194304 => "PROPERTY_CHANGE",
    8388608 => "COLOR_MAP_CHANGE",
    16777216 => "OWNER_GRAB_BUTTON",
  }

  Alembic::Constants::BACKING_STORE_NOT_USEFUL = 0
  Alembic::Constants::BACKING_STORE_WHEN_MAPPED = 1
  Alembic::Constants::BACKING_STORE_ALWAYS = 2

  Alembic::Constants::BACKING_STORES = {
    0 => "NOT_USEFUL",
    1 => "WHEN_MAPPED",
    2 => "ALWAYS",
  }

  Alembic::Constants::IMAGE_ORDER_LSB_FIRST = 0
  Alembic::Constants::IMAGE_ORDER_MSB_FIRST = 1

  Alembic::Constants::IMAGE_ORDERS = {
    0 => "LSB_FIRST",
    1 => "MSB_FIRST",
  }

  Alembic::Constants::MOD_MASK_SHIFT = 1
  Alembic::Constants::MOD_MASK_LOCK = 2
  Alembic::Constants::MOD_MASK_CONTROL = 4
  Alembic::Constants::MOD_MASK_1 = 8
  Alembic::Constants::MOD_MASK_2 = 16
  Alembic::Constants::MOD_MASK_3 = 32
  Alembic::Constants::MOD_MASK_4 = 64
  Alembic::Constants::MOD_MASK_5 = 128
  Alembic::Constants::MOD_MASK_ANY = 32768

  Alembic::Constants::MOD_MASKS = {
    1 => "SHIFT",
    2 => "LOCK",
    4 => "CONTROL",
    8 => "1",
    16 => "2",
    32 => "3",
    64 => "4",
    128 => "5",
    32768 => "ANY",
  }

  Alembic::Constants::KEY_BUT_MASK_SHIFT = 1
  Alembic::Constants::KEY_BUT_MASK_LOCK = 2
  Alembic::Constants::KEY_BUT_MASK_CONTROL = 4
  Alembic::Constants::KEY_BUT_MASK_MOD1 = 8
  Alembic::Constants::KEY_BUT_MASK_MOD2 = 16
  Alembic::Constants::KEY_BUT_MASK_MOD3 = 32
  Alembic::Constants::KEY_BUT_MASK_MOD4 = 64
  Alembic::Constants::KEY_BUT_MASK_MOD5 = 128
  Alembic::Constants::KEY_BUT_MASK_BUTTON1 = 256
  Alembic::Constants::KEY_BUT_MASK_BUTTON2 = 512
  Alembic::Constants::KEY_BUT_MASK_BUTTON3 = 1024
  Alembic::Constants::KEY_BUT_MASK_BUTTON4 = 2048
  Alembic::Constants::KEY_BUT_MASK_BUTTON5 = 4096

  Alembic::Constants::KEY_BUT_MASKS = {
    1 => "SHIFT",
    2 => "LOCK",
    4 => "CONTROL",
    8 => "MOD1",
    16 => "MOD2",
    32 => "MOD3",
    64 => "MOD4",
    128 => "MOD5",
    256 => "BUTTON1",
    512 => "BUTTON2",
    1024 => "BUTTON3",
    2048 => "BUTTON4",
    4096 => "BUTTON5",
  }

  def encode_key_press_event (hash = {})
    io = Alembic::XIO.new
    io.write_ubyte(2)
    io.write_ubyte(hash[:detail])
    io.write("\0\0")
    io.write_utetra(hash[:time])
    io.write_utetra(hash[:root])
    io.write_utetra(hash[:event])
    io.write_utetra(hash[:child])
    io.write_wyde(hash[:root_x])
    io.write_wyde(hash[:root_y])
    io.write_wyde(hash[:event_x])
    io.write_wyde(hash[:event_y])
    io.write_uwyde(hash[:state])
    io.write_bool(hash[:same_screen])
    io.write("\0")
    io.string
  end

  def decode_key_press_event (string)
    io = Alembic::XIO.new(string)
    hash = {}
    hash[:detail] = io.read_ubyte
    io.skip(2)
    hash[:time] = io.read_utetra
    hash[:root] = io.read_utetra
    hash[:event] = io.read_utetra
    hash[:child] = io.read_utetra
    hash[:root_x] = io.read_wyde
    hash[:root_y] = io.read_wyde
    hash[:event_x] = io.read_wyde
    hash[:event_y] = io.read_wyde
    hash[:state] = io.read_uwyde
    hash[:same_screen] = io.read_bool
    io.skip(1)
    hash
  end

  Alembic::Protocol.register_event nil, 2, :key_press

  def encode_key_release_event (hash = {})
    io = Alembic::XIO.new
    io.write_ubyte(3)
    io.write_ubyte(hash[:detail])
    io.write("\0\0")
    io.write("\0\0")
    io.write_utetra(hash[:time])
    io.write_utetra(hash[:root])
    io.write_utetra(hash[:event])
    io.write_utetra(hash[:child])
    io.write_wyde(hash[:root_x])
    io.write_wyde(hash[:root_y])
    io.write_wyde(hash[:event_x])
    io.write_wyde(hash[:event_y])
    io.write_uwyde(hash[:state])
    io.write_bool(hash[:same_screen])
    io.write("\0")
    io.string
  end

  def decode_key_release_event (string)
    io = Alembic::XIO.new(string)
    hash = {}
    hash[:detail] = io.read_ubyte
    io.skip(2)
    io.skip(2)
    hash[:time] = io.read_utetra
    hash[:root] = io.read_utetra
    hash[:event] = io.read_utetra
    hash[:child] = io.read_utetra
    hash[:root_x] = io.read_wyde
    hash[:root_y] = io.read_wyde
    hash[:event_x] = io.read_wyde
    hash[:event_y] = io.read_wyde
    hash[:state] = io.read_uwyde
    hash[:same_screen] = io.read_bool
    io.skip(1)
    hash
  end

  Alembic::Protocol.register_event nil, 3, :key_release

  Alembic::Constants::BUTTON_MASK_1 = 256
  Alembic::Constants::BUTTON_MASK_2 = 512
  Alembic::Constants::BUTTON_MASK_3 = 1024
  Alembic::Constants::BUTTON_MASK_4 = 2048
  Alembic::Constants::BUTTON_MASK_5 = 4096
  Alembic::Constants::BUTTON_MASK_ANY = 32768

  Alembic::Constants::BUTTON_MASKS = {
    256 => "1",
    512 => "2",
    1024 => "3",
    2048 => "4",
    4096 => "5",
    32768 => "ANY",
  }

  def encode_button_press_event (hash = {})
    io = Alembic::XIO.new
    io.write_ubyte(4)
    io.write_ubyte(hash[:detail])
    io.write("\0\0")
    io.write_utetra(hash[:time])
    io.write_utetra(hash[:root])
    io.write_utetra(hash[:event])
    io.write_utetra(hash[:child])
    io.write_wyde(hash[:root_x])
    io.write_wyde(hash[:root_y])
    io.write_wyde(hash[:event_x])
    io.write_wyde(hash[:event_y])
    io.write_uwyde(hash[:state])
    io.write_bool(hash[:same_screen])
    io.write("\0")
    io.string
  end

  def decode_button_press_event (string)
    io = Alembic::XIO.new(string)
    hash = {}
    hash[:detail] = io.read_ubyte
    io.skip(2)
    hash[:time] = io.read_utetra
    hash[:root] = io.read_utetra
    hash[:event] = io.read_utetra
    hash[:child] = io.read_utetra
    hash[:root_x] = io.read_wyde
    hash[:root_y] = io.read_wyde
    hash[:event_x] = io.read_wyde
    hash[:event_y] = io.read_wyde
    hash[:state] = io.read_uwyde
    hash[:same_screen] = io.read_bool
    io.skip(1)
    hash
  end

  Alembic::Protocol.register_event nil, 4, :button_press

  def encode_button_release_event (hash = {})
    io = Alembic::XIO.new
    io.write_ubyte(5)
    io.write_ubyte(hash[:detail])
    io.write("\0\0")
    io.write("\0\0")
    io.write_utetra(hash[:time])
    io.write_utetra(hash[:root])
    io.write_utetra(hash[:event])
    io.write_utetra(hash[:child])
    io.write_wyde(hash[:root_x])
    io.write_wyde(hash[:root_y])
    io.write_wyde(hash[:event_x])
    io.write_wyde(hash[:event_y])
    io.write_uwyde(hash[:state])
    io.write_bool(hash[:same_screen])
    io.write("\0")
    io.string
  end

  def decode_button_release_event (string)
    io = Alembic::XIO.new(string)
    hash = {}
    hash[:detail] = io.read_ubyte
    io.skip(2)
    io.skip(2)
    hash[:time] = io.read_utetra
    hash[:root] = io.read_utetra
    hash[:event] = io.read_utetra
    hash[:child] = io.read_utetra
    hash[:root_x] = io.read_wyde
    hash[:root_y] = io.read_wyde
    hash[:event_x] = io.read_wyde
    hash[:event_y] = io.read_wyde
    hash[:state] = io.read_uwyde
    hash[:same_screen] = io.read_bool
    io.skip(1)
    hash
  end

  Alembic::Protocol.register_event nil, 5, :button_release

  Alembic::Constants::MOTION_NORMAL = 0
  Alembic::Constants::MOTION_HINT = 1

  Alembic::Constants::MOTIONS = {
    0 => "NORMAL",
    1 => "HINT",
  }

  def encode_motion_notify_event (hash = {})
    io = Alembic::XIO.new
    io.write_ubyte(6)
    io.write_byte(hash[:detail])
    io.write("\0\0")
    io.write_utetra(hash[:time])
    io.write_utetra(hash[:root])
    io.write_utetra(hash[:event])
    io.write_utetra(hash[:child])
    io.write_wyde(hash[:root_x])
    io.write_wyde(hash[:root_y])
    io.write_wyde(hash[:event_x])
    io.write_wyde(hash[:event_y])
    io.write_uwyde(hash[:state])
    io.write_bool(hash[:same_screen])
    io.write("\0")
    io.string
  end

  def decode_motion_notify_event (string)
    io = Alembic::XIO.new(string)
    hash = {}
    hash[:detail] = io.read_byte
    io.skip(2)
    hash[:time] = io.read_utetra
    hash[:root] = io.read_utetra
    hash[:event] = io.read_utetra
    hash[:child] = io.read_utetra
    hash[:root_x] = io.read_wyde
    hash[:root_y] = io.read_wyde
    hash[:event_x] = io.read_wyde
    hash[:event_y] = io.read_wyde
    hash[:state] = io.read_uwyde
    hash[:same_screen] = io.read_bool
    io.skip(1)
    hash
  end

  Alembic::Protocol.register_event nil, 6, :motion_notify

  Alembic::Constants::NOTIFY_DETAIL_ANCESTOR = 0
  Alembic::Constants::NOTIFY_DETAIL_VIRTUAL = 1
  Alembic::Constants::NOTIFY_DETAIL_INFERIOR = 2
  Alembic::Constants::NOTIFY_DETAIL_NONLINEAR = 3
  Alembic::Constants::NOTIFY_DETAIL_NONLINEAR_VIRTUAL = 4
  Alembic::Constants::NOTIFY_DETAIL_POINTER = 5
  Alembic::Constants::NOTIFY_DETAIL_POINTER_ROOT = 6
  Alembic::Constants::NOTIFY_DETAIL_NONE = 7

  Alembic::Constants::NOTIFY_DETAILS = {
    0 => "ANCESTOR",
    1 => "VIRTUAL",
    2 => "INFERIOR",
    3 => "NONLINEAR",
    4 => "NONLINEAR_VIRTUAL",
    5 => "POINTER",
    6 => "POINTER_ROOT",
    7 => "NONE",
  }

  Alembic::Constants::NOTIFY_MODE_NORMAL = 0
  Alembic::Constants::NOTIFY_MODE_GRAB = 1
  Alembic::Constants::NOTIFY_MODE_UNGRAB = 2
  Alembic::Constants::NOTIFY_MODE_WHILE_GRABBED = 3

  Alembic::Constants::NOTIFY_MODES = {
    0 => "NORMAL",
    1 => "GRAB",
    2 => "UNGRAB",
    3 => "WHILE_GRABBED",
  }

  def encode_enter_notify_event (hash = {})
    io = Alembic::XIO.new
    io.write_ubyte(7)
    io.write_byte(hash[:detail])
    io.write("\0\0")
    io.write_utetra(hash[:time])
    io.write_utetra(hash[:root])
    io.write_utetra(hash[:event])
    io.write_utetra(hash[:child])
    io.write_wyde(hash[:root_x])
    io.write_wyde(hash[:root_y])
    io.write_wyde(hash[:event_x])
    io.write_wyde(hash[:event_y])
    io.write_uwyde(hash[:state])
    io.write_byte(hash[:mode])
    io.write_byte(hash[:same_screen_focus])
    io.string
  end

  def decode_enter_notify_event (string)
    io = Alembic::XIO.new(string)
    hash = {}
    hash[:detail] = io.read_byte
    io.skip(2)
    hash[:time] = io.read_utetra
    hash[:root] = io.read_utetra
    hash[:event] = io.read_utetra
    hash[:child] = io.read_utetra
    hash[:root_x] = io.read_wyde
    hash[:root_y] = io.read_wyde
    hash[:event_x] = io.read_wyde
    hash[:event_y] = io.read_wyde
    hash[:state] = io.read_uwyde
    hash[:mode] = io.read_byte
    hash[:same_screen_focus] = io.read_byte
    hash
  end

  Alembic::Protocol.register_event nil, 7, :enter_notify

  def encode_leave_notify_event (hash = {})
    io = Alembic::XIO.new
    io.write_ubyte(8)
    io.write_byte(hash[:detail])
    io.write("\0\0")
    io.write("\0\0")
    io.write_utetra(hash[:time])
    io.write_utetra(hash[:root])
    io.write_utetra(hash[:event])
    io.write_utetra(hash[:child])
    io.write_wyde(hash[:root_x])
    io.write_wyde(hash[:root_y])
    io.write_wyde(hash[:event_x])
    io.write_wyde(hash[:event_y])
    io.write_uwyde(hash[:state])
    io.write_byte(hash[:mode])
    io.write_byte(hash[:same_screen_focus])
    io.string
  end

  def decode_leave_notify_event (string)
    io = Alembic::XIO.new(string)
    hash = {}
    hash[:detail] = io.read_byte
    io.skip(2)
    io.skip(2)
    hash[:time] = io.read_utetra
    hash[:root] = io.read_utetra
    hash[:event] = io.read_utetra
    hash[:child] = io.read_utetra
    hash[:root_x] = io.read_wyde
    hash[:root_y] = io.read_wyde
    hash[:event_x] = io.read_wyde
    hash[:event_y] = io.read_wyde
    hash[:state] = io.read_uwyde
    hash[:mode] = io.read_byte
    hash[:same_screen_focus] = io.read_byte
    hash
  end

  Alembic::Protocol.register_event nil, 8, :leave_notify

  def encode_focus_in_event (hash = {})
    io = Alembic::XIO.new
    io.write_ubyte(9)
    io.write_byte(hash[:detail])
    io.write("\0\0")
    io.write_utetra(hash[:event])
    io.write_byte(hash[:mode])
    io.write("\0\0\0")
    io.string
  end

  def decode_focus_in_event (string)
    io = Alembic::XIO.new(string)
    hash = {}
    hash[:detail] = io.read_byte
    io.skip(2)
    hash[:event] = io.read_utetra
    hash[:mode] = io.read_byte
    io.skip(3)
    hash
  end

  Alembic::Protocol.register_event nil, 9, :focus_in

  def encode_focus_out_event (hash = {})
    io = Alembic::XIO.new
    io.write_ubyte(10)
    io.write_byte(hash[:detail])
    io.write("\0\0")
    io.write("\0\0")
    io.write_utetra(hash[:event])
    io.write_byte(hash[:mode])
    io.write("\0\0\0")
    io.string
  end

  def decode_focus_out_event (string)
    io = Alembic::XIO.new(string)
    hash = {}
    hash[:detail] = io.read_byte
    io.skip(2)
    io.skip(2)
    hash[:event] = io.read_utetra
    hash[:mode] = io.read_byte
    io.skip(3)
    hash
  end

  Alembic::Protocol.register_event nil, 10, :focus_out

  def encode_keymap_notify_event (hash = {})
    io = Alembic::XIO.new
    io.write_ubyte(11)
    hash[:keys].each do |item|
      io.write_ubyte(item)
    end
    io.write("\0\0")
    io.string
  end

  def decode_keymap_notify_event (string)
    io = Alembic::XIO.new(string)
    hash = {}
    hash[:keys] = 31.times.map do
      io.read_ubyte
    end
    io.skip(2)
    hash
  end

  Alembic::Protocol.register_event nil, 11, :keymap_notify

  def encode_expose_event (hash = {})
    io = Alembic::XIO.new
    io.write_ubyte(12)
    io.write("\0")
    io.write("\0\0")
    io.write_utetra(hash[:window])
    io.write_uwyde(hash[:x])
    io.write_uwyde(hash[:y])
    io.write_uwyde(hash[:width])
    io.write_uwyde(hash[:height])
    io.write_uwyde(hash[:count])
    io.write("\0\0")
    io.string
  end

  def decode_expose_event (string)
    io = Alembic::XIO.new(string)
    hash = {}
    io.skip(1)
    io.skip(2)
    hash[:window] = io.read_utetra
    hash[:x] = io.read_uwyde
    hash[:y] = io.read_uwyde
    hash[:width] = io.read_uwyde
    hash[:height] = io.read_uwyde
    hash[:count] = io.read_uwyde
    io.skip(2)
    hash
  end

  Alembic::Protocol.register_event nil, 12, :expose

  def encode_graphics_exposure_event (hash = {})
    io = Alembic::XIO.new
    io.write_ubyte(13)
    io.write("\0")
    io.write("\0\0")
    io.write_utetra(hash[:drawable])
    io.write_uwyde(hash[:x])
    io.write_uwyde(hash[:y])
    io.write_uwyde(hash[:width])
    io.write_uwyde(hash[:height])
    io.write_uwyde(hash[:minor_opcode])
    io.write_uwyde(hash[:count])
    io.write_ubyte(hash[:major_opcode])
    io.write("\0\0\0")
    io.string
  end

  def decode_graphics_exposure_event (string)
    io = Alembic::XIO.new(string)
    hash = {}
    io.skip(1)
    io.skip(2)
    hash[:drawable] = io.read_utetra
    hash[:x] = io.read_uwyde
    hash[:y] = io.read_uwyde
    hash[:width] = io.read_uwyde
    hash[:height] = io.read_uwyde
    hash[:minor_opcode] = io.read_uwyde
    hash[:count] = io.read_uwyde
    hash[:major_opcode] = io.read_ubyte
    io.skip(3)
    hash
  end

  Alembic::Protocol.register_event nil, 13, :graphics_exposure

  def encode_no_exposure_event (hash = {})
    io = Alembic::XIO.new
    io.write_ubyte(14)
    io.write("\0")
    io.write("\0\0")
    io.write_utetra(hash[:drawable])
    io.write_uwyde(hash[:minor_opcode])
    io.write_ubyte(hash[:major_opcode])
    io.write("\0")
    io.string
  end

  def decode_no_exposure_event (string)
    io = Alembic::XIO.new(string)
    hash = {}
    io.skip(1)
    io.skip(2)
    hash[:drawable] = io.read_utetra
    hash[:minor_opcode] = io.read_uwyde
    hash[:major_opcode] = io.read_ubyte
    io.skip(1)
    hash
  end

  Alembic::Protocol.register_event nil, 14, :no_exposure

  Alembic::Constants::VISIBILITY_UNOBSCURED = 0
  Alembic::Constants::VISIBILITY_PARTIALLY_OBSCURED = 1
  Alembic::Constants::VISIBILITY_FULLY_OBSCURED = 2

  Alembic::Constants::VISIBILITIES = {
    0 => "UNOBSCURED",
    1 => "PARTIALLY_OBSCURED",
    2 => "FULLY_OBSCURED",
  }

  def encode_visibility_notify_event (hash = {})
    io = Alembic::XIO.new
    io.write_ubyte(15)
    io.write("\0")
    io.write("\0\0")
    io.write_utetra(hash[:window])
    io.write_byte(hash[:state])
    io.write("\0\0\0")
    io.string
  end

  def decode_visibility_notify_event (string)
    io = Alembic::XIO.new(string)
    hash = {}
    io.skip(1)
    io.skip(2)
    hash[:window] = io.read_utetra
    hash[:state] = io.read_byte
    io.skip(3)
    hash
  end

  Alembic::Protocol.register_event nil, 15, :visibility_notify

  def encode_create_notify_event (hash = {})
    io = Alembic::XIO.new
    io.write_ubyte(16)
    io.write("\0")
    io.write("\0\0")
    io.write_utetra(hash[:parent])
    io.write_utetra(hash[:window])
    io.write_wyde(hash[:x])
    io.write_wyde(hash[:y])
    io.write_uwyde(hash[:width])
    io.write_uwyde(hash[:height])
    io.write_uwyde(hash[:border_width])
    io.write_bool(hash[:override_redirect])
    io.write("\0")
    io.string
  end

  def decode_create_notify_event (string)
    io = Alembic::XIO.new(string)
    hash = {}
    io.skip(1)
    io.skip(2)
    hash[:parent] = io.read_utetra
    hash[:window] = io.read_utetra
    hash[:x] = io.read_wyde
    hash[:y] = io.read_wyde
    hash[:width] = io.read_uwyde
    hash[:height] = io.read_uwyde
    hash[:border_width] = io.read_uwyde
    hash[:override_redirect] = io.read_bool
    io.skip(1)
    hash
  end

  Alembic::Protocol.register_event nil, 16, :create_notify

  def encode_destroy_notify_event (hash = {})
    io = Alembic::XIO.new
    io.write_ubyte(17)
    io.write("\0")
    io.write("\0\0")
    io.write_utetra(hash[:event])
    io.write_utetra(hash[:window])
    io.string
  end

  def decode_destroy_notify_event (string)
    io = Alembic::XIO.new(string)
    hash = {}
    io.skip(1)
    io.skip(2)
    hash[:event] = io.read_utetra
    hash[:window] = io.read_utetra
    hash
  end

  Alembic::Protocol.register_event nil, 17, :destroy_notify

  def encode_unmap_notify_event (hash = {})
    io = Alembic::XIO.new
    io.write_ubyte(18)
    io.write("\0")
    io.write("\0\0")
    io.write_utetra(hash[:event])
    io.write_utetra(hash[:window])
    io.write_bool(hash[:from_configure])
    io.write("\0\0\0")
    io.string
  end

  def decode_unmap_notify_event (string)
    io = Alembic::XIO.new(string)
    hash = {}
    io.skip(1)
    io.skip(2)
    hash[:event] = io.read_utetra
    hash[:window] = io.read_utetra
    hash[:from_configure] = io.read_bool
    io.skip(3)
    hash
  end

  Alembic::Protocol.register_event nil, 18, :unmap_notify

  def encode_map_notify_event (hash = {})
    io = Alembic::XIO.new
    io.write_ubyte(19)
    io.write("\0")
    io.write("\0\0")
    io.write_utetra(hash[:event])
    io.write_utetra(hash[:window])
    io.write_bool(hash[:override_redirect])
    io.write("\0\0\0")
    io.string
  end

  def decode_map_notify_event (string)
    io = Alembic::XIO.new(string)
    hash = {}
    io.skip(1)
    io.skip(2)
    hash[:event] = io.read_utetra
    hash[:window] = io.read_utetra
    hash[:override_redirect] = io.read_bool
    io.skip(3)
    hash
  end

  Alembic::Protocol.register_event nil, 19, :map_notify

  def encode_map_request_event (hash = {})
    io = Alembic::XIO.new
    io.write_ubyte(20)
    io.write("\0")
    io.write("\0\0")
    io.write_utetra(hash[:parent])
    io.write_utetra(hash[:window])
    io.string
  end

  def decode_map_request_event (string)
    io = Alembic::XIO.new(string)
    hash = {}
    io.skip(1)
    io.skip(2)
    hash[:parent] = io.read_utetra
    hash[:window] = io.read_utetra
    hash
  end

  Alembic::Protocol.register_event nil, 20, :map_request

  def encode_reparent_notify_event (hash = {})
    io = Alembic::XIO.new
    io.write_ubyte(21)
    io.write("\0")
    io.write("\0\0")
    io.write_utetra(hash[:event])
    io.write_utetra(hash[:window])
    io.write_utetra(hash[:parent])
    io.write_wyde(hash[:x])
    io.write_wyde(hash[:y])
    io.write_bool(hash[:override_redirect])
    io.write("\0\0\0")
    io.string
  end

  def decode_reparent_notify_event (string)
    io = Alembic::XIO.new(string)
    hash = {}
    io.skip(1)
    io.skip(2)
    hash[:event] = io.read_utetra
    hash[:window] = io.read_utetra
    hash[:parent] = io.read_utetra
    hash[:x] = io.read_wyde
    hash[:y] = io.read_wyde
    hash[:override_redirect] = io.read_bool
    io.skip(3)
    hash
  end

  Alembic::Protocol.register_event nil, 21, :reparent_notify

  def encode_configure_notify_event (hash = {})
    io = Alembic::XIO.new
    io.write_ubyte(22)
    io.write("\0")
    io.write("\0\0")
    io.write_utetra(hash[:event])
    io.write_utetra(hash[:window])
    io.write_utetra(hash[:above_sibling])
    io.write_wyde(hash[:x])
    io.write_wyde(hash[:y])
    io.write_uwyde(hash[:width])
    io.write_uwyde(hash[:height])
    io.write_uwyde(hash[:border_width])
    io.write_bool(hash[:override_redirect])
    io.write("\0")
    io.string
  end

  def decode_configure_notify_event (string)
    io = Alembic::XIO.new(string)
    hash = {}
    io.skip(1)
    io.skip(2)
    hash[:event] = io.read_utetra
    hash[:window] = io.read_utetra
    hash[:above_sibling] = io.read_utetra
    hash[:x] = io.read_wyde
    hash[:y] = io.read_wyde
    hash[:width] = io.read_uwyde
    hash[:height] = io.read_uwyde
    hash[:border_width] = io.read_uwyde
    hash[:override_redirect] = io.read_bool
    io.skip(1)
    hash
  end

  Alembic::Protocol.register_event nil, 22, :configure_notify

  def encode_configure_request_event (hash = {})
    io = Alembic::XIO.new
    io.write_ubyte(23)
    io.write_byte(hash[:stack_mode])
    io.write("\0\0")
    io.write_utetra(hash[:parent])
    io.write_utetra(hash[:window])
    io.write_utetra(hash[:sibling])
    io.write_wyde(hash[:x])
    io.write_wyde(hash[:y])
    io.write_uwyde(hash[:width])
    io.write_uwyde(hash[:height])
    io.write_uwyde(hash[:border_width])
    io.write_uwyde(hash[:value_mask])
    io.string
  end

  def decode_configure_request_event (string)
    io = Alembic::XIO.new(string)
    hash = {}
    hash[:stack_mode] = io.read_byte
    io.skip(2)
    hash[:parent] = io.read_utetra
    hash[:window] = io.read_utetra
    hash[:sibling] = io.read_utetra
    hash[:x] = io.read_wyde
    hash[:y] = io.read_wyde
    hash[:width] = io.read_uwyde
    hash[:height] = io.read_uwyde
    hash[:border_width] = io.read_uwyde
    hash[:value_mask] = io.read_uwyde
    hash
  end

  Alembic::Protocol.register_event nil, 23, :configure_request

  def encode_gravity_notify_event (hash = {})
    io = Alembic::XIO.new
    io.write_ubyte(24)
    io.write("\0")
    io.write("\0\0")
    io.write_utetra(hash[:event])
    io.write_utetra(hash[:window])
    io.write_wyde(hash[:x])
    io.write_wyde(hash[:y])
    io.string
  end

  def decode_gravity_notify_event (string)
    io = Alembic::XIO.new(string)
    hash = {}
    io.skip(1)
    io.skip(2)
    hash[:event] = io.read_utetra
    hash[:window] = io.read_utetra
    hash[:x] = io.read_wyde
    hash[:y] = io.read_wyde
    hash
  end

  Alembic::Protocol.register_event nil, 24, :gravity_notify

  def encode_resize_request_event (hash = {})
    io = Alembic::XIO.new
    io.write_ubyte(25)
    io.write("\0")
    io.write("\0\0")
    io.write_utetra(hash[:window])
    io.write_uwyde(hash[:width])
    io.write_uwyde(hash[:height])
    io.string
  end

  def decode_resize_request_event (string)
    io = Alembic::XIO.new(string)
    hash = {}
    io.skip(1)
    io.skip(2)
    hash[:window] = io.read_utetra
    hash[:width] = io.read_uwyde
    hash[:height] = io.read_uwyde
    hash
  end

  Alembic::Protocol.register_event nil, 25, :resize_request

  Alembic::Constants::PLACE_ON_TOP = 0
  Alembic::Constants::PLACE_ON_BOTTOM = 1

  Alembic::Constants::PLACES = {
    0 => "ON_TOP",
    1 => "ON_BOTTOM",
  }

  def encode_circulate_notify_event (hash = {})
    io = Alembic::XIO.new
    io.write_ubyte(26)
    io.write("\0")
    io.write("\0\0")
    io.write_utetra(hash[:event])
    io.write_utetra(hash[:window])
    io.write("\0\0\0\0")
    io.write_byte(hash[:place])
    io.write("\0\0\0")
    io.string
  end

  def decode_circulate_notify_event (string)
    io = Alembic::XIO.new(string)
    hash = {}
    io.skip(1)
    io.skip(2)
    hash[:event] = io.read_utetra
    hash[:window] = io.read_utetra
    io.skip(4)
    hash[:place] = io.read_byte
    io.skip(3)
    hash
  end

  Alembic::Protocol.register_event nil, 26, :circulate_notify

  def encode_circulate_request_event (hash = {})
    io = Alembic::XIO.new
    io.write_ubyte(27)
    io.write("\0")
    io.write("\0\0")
    io.write("\0\0")
    io.write_utetra(hash[:event])
    io.write_utetra(hash[:window])
    io.write("\0\0\0\0")
    io.write_byte(hash[:place])
    io.write("\0\0\0")
    io.string
  end

  def decode_circulate_request_event (string)
    io = Alembic::XIO.new(string)
    hash = {}
    io.skip(1)
    io.skip(2)
    io.skip(2)
    hash[:event] = io.read_utetra
    hash[:window] = io.read_utetra
    io.skip(4)
    hash[:place] = io.read_byte
    io.skip(3)
    hash
  end

  Alembic::Protocol.register_event nil, 27, :circulate_request

  Alembic::Constants::PROPERTY_NEW_VALUE = 0
  Alembic::Constants::PROPERTY_DELETE = 1

  Alembic::Constants::PROPERTIES = {
    0 => "NEW_VALUE",
    1 => "DELETE",
  }

  def encode_property_notify_event (hash = {})
    io = Alembic::XIO.new
    io.write_ubyte(28)
    io.write("\0")
    io.write("\0\0")
    io.write_utetra(hash[:window])
    io.write_utetra(hash[:atom])
    io.write_utetra(hash[:time])
    io.write_byte(hash[:state])
    io.write("\0\0\0")
    io.string
  end

  def decode_property_notify_event (string)
    io = Alembic::XIO.new(string)
    hash = {}
    io.skip(1)
    io.skip(2)
    hash[:window] = io.read_utetra
    hash[:atom] = io.read_utetra
    hash[:time] = io.read_utetra
    hash[:state] = io.read_byte
    io.skip(3)
    hash
  end

  Alembic::Protocol.register_event nil, 28, :property_notify

  def encode_selection_clear_event (hash = {})
    io = Alembic::XIO.new
    io.write_ubyte(29)
    io.write("\0")
    io.write("\0\0")
    io.write_utetra(hash[:time])
    io.write_utetra(hash[:owner])
    io.write_utetra(hash[:selection])
    io.string
  end

  def decode_selection_clear_event (string)
    io = Alembic::XIO.new(string)
    hash = {}
    io.skip(1)
    io.skip(2)
    hash[:time] = io.read_utetra
    hash[:owner] = io.read_utetra
    hash[:selection] = io.read_utetra
    hash
  end

  Alembic::Protocol.register_event nil, 29, :selection_clear

  Alembic::Constants::TIME_CURRENT_TIME = 0

  Alembic::Constants::TIMES = {
    0 => "CURRENT_TIME",
  }

  def encode_selection_request_event (hash = {})
    io = Alembic::XIO.new
    io.write_ubyte(30)
    io.write("\0")
    io.write("\0\0")
    io.write_utetra(hash[:time])
    io.write_utetra(hash[:owner])
    io.write_utetra(hash[:requestor])
    io.write_utetra(hash[:selection])
    io.write_utetra(hash[:target])
    io.write_utetra(hash[:property])
    io.string
  end

  def decode_selection_request_event (string)
    io = Alembic::XIO.new(string)
    hash = {}
    io.skip(1)
    io.skip(2)
    hash[:time] = io.read_utetra
    hash[:owner] = io.read_utetra
    hash[:requestor] = io.read_utetra
    hash[:selection] = io.read_utetra
    hash[:target] = io.read_utetra
    hash[:property] = io.read_utetra
    hash
  end

  Alembic::Protocol.register_event nil, 30, :selection_request

  def encode_selection_notify_event (hash = {})
    io = Alembic::XIO.new
    io.write_ubyte(31)
    io.write("\0")
    io.write("\0\0")
    io.write_utetra(hash[:time])
    io.write_utetra(hash[:requestor])
    io.write_utetra(hash[:selection])
    io.write_utetra(hash[:target])
    io.write_utetra(hash[:property])
    io.string
  end

  def decode_selection_notify_event (string)
    io = Alembic::XIO.new(string)
    hash = {}
    io.skip(1)
    io.skip(2)
    hash[:time] = io.read_utetra
    hash[:requestor] = io.read_utetra
    hash[:selection] = io.read_utetra
    hash[:target] = io.read_utetra
    hash[:property] = io.read_utetra
    hash
  end

  Alembic::Protocol.register_event nil, 31, :selection_notify

  Alembic::Constants::COLORMAP_STATE_UNINSTALLED = 0
  Alembic::Constants::COLORMAP_STATE_INSTALLED = 1

  Alembic::Constants::COLORMAP_STATES = {
    0 => "UNINSTALLED",
    1 => "INSTALLED",
  }

  def encode_colormap_notify_event (hash = {})
    io = Alembic::XIO.new
    io.write_ubyte(32)
    io.write("\0")
    io.write("\0\0")
    io.write_utetra(hash[:window])
    io.write_utetra(hash[:colormap])
    io.write_bool(hash[:new])
    io.write_byte(hash[:state])
    io.write("\0\0")
    io.string
  end

  def decode_colormap_notify_event (string)
    io = Alembic::XIO.new(string)
    hash = {}
    io.skip(1)
    io.skip(2)
    hash[:window] = io.read_utetra
    hash[:colormap] = io.read_utetra
    hash[:new] = io.read_bool
    hash[:state] = io.read_byte
    io.skip(2)
    hash
  end

  Alembic::Protocol.register_event nil, 32, :colormap_notify

  def encode_client_message_event (hash = {})
    io = Alembic::XIO.new
    io.write_ubyte(33)
    io.write_ubyte(hash[:format])
    io.write("\0\0")
    io.write_utetra(hash[:window])
    io.write_utetra(hash[:type])
    wildcat do
      hash[:data][:data8].each do |item|
        io.write_ubyte(item)
      end
      hash[:data][:data16].each do |item|
        io.write_uwyde(item)
      end
      hash[:data][:data32].each do |item|
        io.write_utetra(item)
      end
    end
    io.string
  end

  def decode_client_message_event (string)
    io = Alembic::XIO.new(string)
    hash = {}
    hash[:format] = io.read_ubyte
    io.skip(2)
    hash[:window] = io.read_utetra
    hash[:type] = io.read_utetra
    hash[:data] = wildcat do
      {}.tap do |hash|
        hash[:data8] = 20.times.map do
          io.read_ubyte
        end
        hash[:data16] = 10.times.map do
          io.read_uwyde
        end
        hash[:data32] = 5.times.map do
          io.read_utetra
        end
      end
    end
    hash
  end

  Alembic::Protocol.register_event nil, 33, :client_message

  Alembic::Constants::MAPPING_MODIFIER = 0
  Alembic::Constants::MAPPING_KEYBOARD = 1
  Alembic::Constants::MAPPING_POINTER = 2

  Alembic::Constants::MAPPINGS = {
    0 => "MODIFIER",
    1 => "KEYBOARD",
    2 => "POINTER",
  }

  def encode_mapping_notify_event (hash = {})
    io = Alembic::XIO.new
    io.write_ubyte(34)
    io.write("\0")
    io.write("\0\0")
    io.write_byte(hash[:request])
    io.write_ubyte(hash[:first_keycode])
    io.write_ubyte(hash[:count])
    io.write("\0")
    io.string
  end

  def decode_mapping_notify_event (string)
    io = Alembic::XIO.new(string)
    hash = {}
    io.skip(1)
    io.skip(2)
    hash[:request] = io.read_byte
    hash[:first_keycode] = io.read_ubyte
    hash[:count] = io.read_ubyte
    io.skip(1)
    hash
  end

  Alembic::Protocol.register_event nil, 34, :mapping_notify

  Alembic::Constants::PIXMAP_NONE = 0

  Alembic::Constants::PIXMAPS = {
    0 => "NONE",
  }

  Alembic::Constants::CURSOR_NONE = 0

  Alembic::Constants::CURSORS = {
    0 => "NONE",
  }

  Alembic::Constants::FONT_NONE = 0

  Alembic::Constants::FONTS = {
    0 => "NONE",
  }

  Alembic::Constants::WINDOW_CLASS_COPY_FROM_PARENT = 0
  Alembic::Constants::WINDOW_CLASS_INPUT_OUTPUT = 1
  Alembic::Constants::WINDOW_CLASS_INPUT_ONLY = 2

  Alembic::Constants::WINDOW_CLASSES = {
    0 => "COPY_FROM_PARENT",
    1 => "INPUT_OUTPUT",
    2 => "INPUT_ONLY",
  }

  Alembic::Constants::CW_BACK_PIXMAP = 1
  Alembic::Constants::CW_BACK_PIXEL = 2
  Alembic::Constants::CW_BORDER_PIXMAP = 4
  Alembic::Constants::CW_BORDER_PIXEL = 8
  Alembic::Constants::CW_BIT_GRAVITY = 16
  Alembic::Constants::CW_WIN_GRAVITY = 32
  Alembic::Constants::CW_BACKING_STORE = 64
  Alembic::Constants::CW_BACKING_PLANES = 128
  Alembic::Constants::CW_BACKING_PIXEL = 256
  Alembic::Constants::CW_OVERRIDE_REDIRECT = 512
  Alembic::Constants::CW_SAVE_UNDER = 1024
  Alembic::Constants::CW_EVENT_MASK = 2048
  Alembic::Constants::CW_DONT_PROPAGATE = 4096
  Alembic::Constants::CW_COLORMAP = 8192
  Alembic::Constants::CW_CURSOR = 16384

  Alembic::Constants::CWS = {
    1 => "BACK_PIXMAP",
    2 => "BACK_PIXEL",
    4 => "BORDER_PIXMAP",
    8 => "BORDER_PIXEL",
    16 => "BIT_GRAVITY",
    32 => "WIN_GRAVITY",
    64 => "BACKING_STORE",
    128 => "BACKING_PLANES",
    256 => "BACKING_PIXEL",
    512 => "OVERRIDE_REDIRECT",
    1024 => "SAVE_UNDER",
    2048 => "EVENT_MASK",
    4096 => "DONT_PROPAGATE",
    8192 => "COLORMAP",
    16384 => "CURSOR",
  }

  Alembic::Constants::BACK_PIXMAP_NONE = 0
  Alembic::Constants::BACK_PIXMAP_PARENT_RELATIVE = 1

  Alembic::Constants::BACK_PIXMAPS = {
    0 => "NONE",
    1 => "PARENT_RELATIVE",
  }

  Alembic::Constants::GRAVITY_BIT_FORGET = 0
  Alembic::Constants::GRAVITY_WIN_UNMAP = 0
  Alembic::Constants::GRAVITY_NORTH_WEST = 1
  Alembic::Constants::GRAVITY_NORTH = 2
  Alembic::Constants::GRAVITY_NORTH_EAST = 3
  Alembic::Constants::GRAVITY_WEST = 4
  Alembic::Constants::GRAVITY_CENTER = 5
  Alembic::Constants::GRAVITY_EAST = 6
  Alembic::Constants::GRAVITY_SOUTH_WEST = 7
  Alembic::Constants::GRAVITY_SOUTH = 8
  Alembic::Constants::GRAVITY_SOUTH_EAST = 9
  Alembic::Constants::GRAVITY_STATIC = 10

  Alembic::Constants::GRAVITIES = {
    0 => "BIT_FORGET",
    0 => "WIN_UNMAP",
    1 => "NORTH_WEST",
    2 => "NORTH",
    3 => "NORTH_EAST",
    4 => "WEST",
    5 => "CENTER",
    6 => "EAST",
    7 => "SOUTH_WEST",
    8 => "SOUTH",
    9 => "SOUTH_EAST",
    10 => "STATIC",
  }

  def create_window_async (depth, wid, parent, x, y, width, height, border_width, klass, visual, value_mask, value_list)
    request do |io|
      io.write_ubyte(1)
      io.write("\0\0")
      io.write_ubyte(depth)
      io.write_utetra(wid)
      io.write_utetra(parent)
      io.write_wyde(x)
      io.write_wyde(y)
      io.write_uwyde(width)
      io.write_uwyde(height)
      io.write_uwyde(border_width)
      io.write_uwyde(klass)
      io.write_utetra(visual)
      io.write_utetra(value_mask)
      value_list.each do |item|
        io.write_utetra(item)
      end
    end
  end
  
  def create_window (*args)
    create_window_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 1, :create_window

  def change_window_attributes_async (window, value_mask, value_list)
    request do |io|
      io.write_ubyte(2)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(window)
      io.write_utetra(value_mask)
      value_list.each do |item|
        io.write_utetra(item)
      end
    end
  end
  
  def change_window_attributes (*args)
    change_window_attributes_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 2, :change_window_attributes

  Alembic::Constants::MAP_STATE_UNMAPPED = 0
  Alembic::Constants::MAP_STATE_UNVIEWABLE = 1
  Alembic::Constants::MAP_STATE_VIEWABLE = 2

  Alembic::Constants::MAP_STATES = {
    0 => "UNMAPPED",
    1 => "UNVIEWABLE",
    2 => "VIEWABLE",
  }

  def get_window_attributes_async (window)
    request do |io|
      io.write_ubyte(3)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(window)
    end
    reply do |io|
      get_window_attributes_reply(io)
    end
  end
  
  def get_window_attributes (*args)
    get_window_attributes_async(*args).wait
  end
  
  def get_window_attributes_reply (io)
    hash = {}
    hash[:backing_store] = io.read_ubyte
    hash[:visual] = io.read_utetra
    hash[:class] = io.read_uwyde
    hash[:bit_gravity] = io.read_ubyte
    hash[:win_gravity] = io.read_ubyte
    hash[:backing_planes] = io.read_utetra
    hash[:backing_pixel] = io.read_utetra
    hash[:save_under] = io.read_bool
    hash[:map_is_installed] = io.read_bool
    hash[:map_state] = io.read_ubyte
    hash[:override_redirect] = io.read_bool
    hash[:colormap] = io.read_utetra
    hash[:all_event_masks] = io.read_utetra
    hash[:your_event_mask] = io.read_utetra
    hash[:do_not_propagate_mask] = io.read_uwyde
    io.skip(2)
    hash
  end

  Alembic::Protocol.register_opcode nil, 3, :get_window_attributes

  def destroy_window_async (window)
    request do |io|
      io.write_ubyte(4)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(window)
    end
  end
  
  def destroy_window (*args)
    destroy_window_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 4, :destroy_window

  def destroy_subwindows_async (window)
    request do |io|
      io.write_ubyte(5)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(window)
    end
  end
  
  def destroy_subwindows (*args)
    destroy_subwindows_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 5, :destroy_subwindows

  Alembic::Constants::SET_MODE_INSERT = 0
  Alembic::Constants::SET_MODE_DELETE = 1

  Alembic::Constants::SET_MODES = {
    0 => "INSERT",
    1 => "DELETE",
  }

  def change_save_set_async (mode, window)
    request do |io|
      io.write_ubyte(6)
      io.write("\0\0")
      io.write_byte(mode)
      io.write_utetra(window)
    end
  end
  
  def change_save_set (*args)
    change_save_set_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 6, :change_save_set

  def reparent_window_async (window, parent, x, y)
    request do |io|
      io.write_ubyte(7)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(window)
      io.write_utetra(parent)
      io.write_wyde(x)
      io.write_wyde(y)
    end
  end
  
  def reparent_window (*args)
    reparent_window_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 7, :reparent_window

  def map_window_async (window)
    request do |io|
      io.write_ubyte(8)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(window)
    end
  end
  
  def map_window (*args)
    map_window_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 8, :map_window

  def map_subwindows_async (window)
    request do |io|
      io.write_ubyte(9)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(window)
    end
  end
  
  def map_subwindows (*args)
    map_subwindows_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 9, :map_subwindows

  def unmap_window_async (window)
    request do |io|
      io.write_ubyte(10)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(window)
    end
  end
  
  def unmap_window (*args)
    unmap_window_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 10, :unmap_window

  def unmap_subwindows_async (window)
    request do |io|
      io.write_ubyte(11)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(window)
    end
  end
  
  def unmap_subwindows (*args)
    unmap_subwindows_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 11, :unmap_subwindows

  Alembic::Constants::CONFIG_WINDOW_X = 1
  Alembic::Constants::CONFIG_WINDOW_Y = 2
  Alembic::Constants::CONFIG_WINDOW_WIDTH = 4
  Alembic::Constants::CONFIG_WINDOW_HEIGHT = 8
  Alembic::Constants::CONFIG_WINDOW_BORDER_WIDTH = 16
  Alembic::Constants::CONFIG_WINDOW_SIBLING = 32
  Alembic::Constants::CONFIG_WINDOW_STACK_MODE = 64

  Alembic::Constants::CONFIG_WINDOWS = {
    1 => "X",
    2 => "Y",
    4 => "WIDTH",
    8 => "HEIGHT",
    16 => "BORDER_WIDTH",
    32 => "SIBLING",
    64 => "STACK_MODE",
  }

  Alembic::Constants::STACK_MODE_ABOVE = 0
  Alembic::Constants::STACK_MODE_BELOW = 1
  Alembic::Constants::STACK_MODE_TOP_IF = 2
  Alembic::Constants::STACK_MODE_BOTTOM_IF = 3
  Alembic::Constants::STACK_MODE_OPPOSITE = 4

  Alembic::Constants::STACK_MODES = {
    0 => "ABOVE",
    1 => "BELOW",
    2 => "TOP_IF",
    3 => "BOTTOM_IF",
    4 => "OPPOSITE",
  }

  def configure_window_async (window, value_mask, value_list)
    request do |io|
      io.write_ubyte(12)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(window)
      io.write("\0\0")
      io.write_uwyde(value_mask)
      value_list.each do |item|
        io.write_utetra(item)
      end
    end
  end
  
  def configure_window (*args)
    configure_window_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 12, :configure_window

  Alembic::Constants::CIRCULATE_RAISE_LOWEST = 0
  Alembic::Constants::CIRCULATE_LOWER_HIGHEST = 1

  Alembic::Constants::CIRCULATES = {
    0 => "RAISE_LOWEST",
    1 => "LOWER_HIGHEST",
  }

  def circulate_window_async (direction, window)
    request do |io|
      io.write_ubyte(13)
      io.write("\0\0")
      io.write_ubyte(direction)
      io.write_utetra(window)
    end
  end
  
  def circulate_window (*args)
    circulate_window_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 13, :circulate_window

  def get_geometry_async (drawable)
    request do |io|
      io.write_ubyte(14)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(drawable)
    end
    reply do |io|
      get_geometry_reply(io)
    end
  end
  
  def get_geometry (*args)
    get_geometry_async(*args).wait
  end
  
  def get_geometry_reply (io)
    hash = {}
    hash[:depth] = io.read_ubyte
    hash[:root] = io.read_utetra
    hash[:x] = io.read_wyde
    hash[:y] = io.read_wyde
    hash[:width] = io.read_uwyde
    hash[:height] = io.read_uwyde
    hash[:border_width] = io.read_uwyde
    io.skip(2)
    hash
  end

  Alembic::Protocol.register_opcode nil, 14, :get_geometry

  def query_tree_async (window)
    request do |io|
      io.write_ubyte(15)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(window)
    end
    reply do |io|
      query_tree_reply(io)
    end
  end
  
  def query_tree (*args)
    query_tree_async(*args).wait
  end
  
  def query_tree_reply (io)
    hash = {}
    io.skip(1)
    hash[:root] = io.read_utetra
    hash[:parent] = io.read_utetra
    hash[:children_len] = io.read_uwyde
    io.skip(14)
    hash[:children] = hash[:children_len].times.map do
      io.read_utetra
    end
    hash
  end

  Alembic::Protocol.register_opcode nil, 15, :query_tree

  def intern_atom_async (only_if_exists, name_len, name)
    request do |io|
      io.write_ubyte(16)
      io.write("\0\0")
      io.write_bool(only_if_exists)
      io.write_uwyde(name_len)
      io.write("\0\0")
      io.write(name)
    end
    reply do |io|
      intern_atom_reply(io)
    end
  end
  
  def intern_atom (*args)
    intern_atom_async(*args).wait
  end
  
  def intern_atom_reply (io)
    hash = {}
    io.skip(1)
    hash[:atom] = io.read_utetra
    hash
  end

  Alembic::Protocol.register_opcode nil, 16, :intern_atom

  def get_atom_name_async (atom)
    request do |io|
      io.write_ubyte(17)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(atom)
    end
    reply do |io|
      get_atom_name_reply(io)
    end
  end
  
  def get_atom_name (*args)
    get_atom_name_async(*args).wait
  end
  
  def get_atom_name_reply (io)
    hash = {}
    io.skip(1)
    hash[:name_len] = io.read_uwyde
    io.skip(22)
    hash[:name] = io.read(hash[:name_len])
    hash
  end

  Alembic::Protocol.register_opcode nil, 17, :get_atom_name

  Alembic::Constants::PROP_MODE_REPLACE = 0
  Alembic::Constants::PROP_MODE_PREPEND = 1
  Alembic::Constants::PROP_MODE_APPEND = 2

  Alembic::Constants::PROP_MODES = {
    0 => "REPLACE",
    1 => "PREPEND",
    2 => "APPEND",
  }

  def change_property_async (mode, window, property, type, format, data_len, data)
    request do |io|
      io.write_ubyte(18)
      io.write("\0\0")
      io.write_ubyte(mode)
      io.write_utetra(window)
      io.write_utetra(property)
      io.write_utetra(type)
      io.write_ubyte(format)
      io.write("\0\0\0")
      io.write_utetra(data_len)
      io.write(data)
    end
  end
  
  def change_property (*args)
    change_property_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 18, :change_property

  def delete_property_async (window, property)
    request do |io|
      io.write_ubyte(19)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(window)
      io.write_utetra(property)
    end
  end
  
  def delete_property (*args)
    delete_property_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 19, :delete_property

  Alembic::Constants::GET_PROPERTY_TYPE_ANY = 0

  Alembic::Constants::GET_PROPERTY_TYPES = {
    0 => "ANY",
  }

  def get_property_async (delete, window, property, type, long_offset, long_length)
    request do |io|
      io.write_ubyte(20)
      io.write("\0\0")
      io.write_bool(delete)
      io.write_utetra(window)
      io.write_utetra(property)
      io.write_utetra(type)
      io.write_utetra(long_offset)
      io.write_utetra(long_length)
    end
    reply do |io|
      get_property_reply(io)
    end
  end
  
  def get_property (*args)
    get_property_async(*args).wait
  end
  
  def get_property_reply (io)
    hash = {}
    hash[:format] = io.read_ubyte
    hash[:type] = io.read_utetra
    hash[:bytes_after] = io.read_utetra
    hash[:value_len] = io.read_utetra
    io.skip(12)
    hash[:value] = io.read(hash[:value_lenformat])
    hash
  end

  Alembic::Protocol.register_opcode nil, 20, :get_property

  def list_properties_async (window)
    request do |io|
      io.write_ubyte(21)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(window)
    end
    reply do |io|
      list_properties_reply(io)
    end
  end
  
  def list_properties (*args)
    list_properties_async(*args).wait
  end
  
  def list_properties_reply (io)
    hash = {}
    io.skip(1)
    hash[:atoms_len] = io.read_uwyde
    io.skip(22)
    hash[:atoms] = hash[:atoms_len].times.map do
      io.read_utetra
    end
    hash
  end

  Alembic::Protocol.register_opcode nil, 21, :list_properties

  def set_selection_owner_async (owner, selection, time)
    request do |io|
      io.write_ubyte(22)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(owner)
      io.write_utetra(selection)
      io.write_utetra(time)
    end
  end
  
  def set_selection_owner (*args)
    set_selection_owner_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 22, :set_selection_owner

  def get_selection_owner_async (selection)
    request do |io|
      io.write_ubyte(23)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(selection)
    end
    reply do |io|
      get_selection_owner_reply(io)
    end
  end
  
  def get_selection_owner (*args)
    get_selection_owner_async(*args).wait
  end
  
  def get_selection_owner_reply (io)
    hash = {}
    io.skip(1)
    hash[:owner] = io.read_utetra
    hash
  end

  Alembic::Protocol.register_opcode nil, 23, :get_selection_owner

  def convert_selection_async (requestor, selection, target, property, time)
    request do |io|
      io.write_ubyte(24)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(requestor)
      io.write_utetra(selection)
      io.write_utetra(target)
      io.write_utetra(property)
      io.write_utetra(time)
    end
  end
  
  def convert_selection (*args)
    convert_selection_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 24, :convert_selection

  Alembic::Constants::SEND_EVENT_DEST_POINTER_WINDOW = 0
  Alembic::Constants::SEND_EVENT_DEST_ITEM_FOCUS = 1

  Alembic::Constants::SEND_EVENT_DESTS = {
    0 => "POINTER_WINDOW",
    1 => "ITEM_FOCUS",
  }

  def send_event_async (propagate, destination, event_mask, event)
    request do |io|
      io.write_ubyte(25)
      io.write("\0\0")
      io.write_bool(propagate)
      io.write_utetra(destination)
      io.write_utetra(event_mask)
      io.write(event)
    end
  end
  
  def send_event (*args)
    send_event_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 25, :send_event

  Alembic::Constants::GRAB_MODE_SYNC = 0
  Alembic::Constants::GRAB_MODE_ASYNC = 1

  Alembic::Constants::GRAB_MODES = {
    0 => "SYNC",
    1 => "ASYNC",
  }

  Alembic::Constants::GRAB_STATUS_SUCCESS = 0
  Alembic::Constants::GRAB_STATUS_ALREADY_GRABBED = 1
  Alembic::Constants::GRAB_STATUS_INVALID_TIME = 2
  Alembic::Constants::GRAB_STATUS_NOT_VIEWABLE = 3
  Alembic::Constants::GRAB_STATUS_FROZEN = 4

  Alembic::Constants::GRAB_STATUSES = {
    0 => "SUCCESS",
    1 => "ALREADY_GRABBED",
    2 => "INVALID_TIME",
    3 => "NOT_VIEWABLE",
    4 => "FROZEN",
  }

  def grab_pointer_async (owner_events, grab_window, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, time)
    request do |io|
      io.write_ubyte(26)
      io.write("\0\0")
      io.write_bool(owner_events)
      io.write_utetra(grab_window)
      io.write_uwyde(event_mask)
      io.write_byte(pointer_mode)
      io.write_byte(keyboard_mode)
      io.write_utetra(confine_to)
      io.write_utetra(cursor)
      io.write_utetra(time)
    end
    reply do |io|
      grab_pointer_reply(io)
    end
  end
  
  def grab_pointer (*args)
    grab_pointer_async(*args).wait
  end
  
  def grab_pointer_reply (io)
    hash = {}
    hash[:status] = io.read_byte
    hash
  end

  Alembic::Protocol.register_opcode nil, 26, :grab_pointer

  def ungrab_pointer_async (time)
    request do |io|
      io.write_ubyte(27)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(time)
    end
  end
  
  def ungrab_pointer (*args)
    ungrab_pointer_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 27, :ungrab_pointer

  Alembic::Constants::BUTTON_INDEX_ANY = 0
  Alembic::Constants::BUTTON_INDEX_1 = 1
  Alembic::Constants::BUTTON_INDEX_2 = 2
  Alembic::Constants::BUTTON_INDEX_3 = 3
  Alembic::Constants::BUTTON_INDEX_4 = 4
  Alembic::Constants::BUTTON_INDEX_5 = 5

  Alembic::Constants::BUTTON_INDEXES = {
    0 => "ANY",
    1 => "1",
    2 => "2",
    3 => "3",
    4 => "4",
    5 => "5",
  }

  def grab_button_async (owner_events, grab_window, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, button, modifiers)
    request do |io|
      io.write_ubyte(28)
      io.write("\0\0")
      io.write_bool(owner_events)
      io.write_utetra(grab_window)
      io.write_uwyde(event_mask)
      io.write_ubyte(pointer_mode)
      io.write_ubyte(keyboard_mode)
      io.write_utetra(confine_to)
      io.write_utetra(cursor)
      io.write_ubyte(button)
      io.write("\0")
      io.write_uwyde(modifiers)
    end
  end
  
  def grab_button (*args)
    grab_button_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 28, :grab_button

  def ungrab_button_async (button, grab_window, modifiers)
    request do |io|
      io.write_ubyte(29)
      io.write("\0\0")
      io.write_ubyte(button)
      io.write_utetra(grab_window)
      io.write_uwyde(modifiers)
      io.write("\0\0")
    end
  end
  
  def ungrab_button (*args)
    ungrab_button_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 29, :ungrab_button

  def change_active_pointer_grab_async (cursor, time, event_mask)
    request do |io|
      io.write_ubyte(30)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(cursor)
      io.write_utetra(time)
      io.write_uwyde(event_mask)
      io.write("\0\0")
    end
  end
  
  def change_active_pointer_grab (*args)
    change_active_pointer_grab_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 30, :change_active_pointer_grab

  def grab_keyboard_async (owner_events, grab_window, time, pointer_mode, keyboard_mode)
    request do |io|
      io.write_ubyte(31)
      io.write("\0\0")
      io.write_bool(owner_events)
      io.write_utetra(grab_window)
      io.write_utetra(time)
      io.write_byte(pointer_mode)
      io.write_byte(keyboard_mode)
      io.write("\0\0")
    end
    reply do |io|
      grab_keyboard_reply(io)
    end
  end
  
  def grab_keyboard (*args)
    grab_keyboard_async(*args).wait
  end
  
  def grab_keyboard_reply (io)
    hash = {}
    hash[:status] = io.read_byte
    hash
  end

  Alembic::Protocol.register_opcode nil, 31, :grab_keyboard

  def ungrab_keyboard_async (time)
    request do |io|
      io.write_ubyte(32)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(time)
    end
  end
  
  def ungrab_keyboard (*args)
    ungrab_keyboard_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 32, :ungrab_keyboard

  Alembic::Constants::GRAB_ANY = 0

  Alembic::Constants::GRABS = {
    0 => "ANY",
  }

  def grab_key_async (owner_events, grab_window, modifiers, key, pointer_mode, keyboard_mode)
    request do |io|
      io.write_ubyte(33)
      io.write("\0\0")
      io.write_bool(owner_events)
      io.write_utetra(grab_window)
      io.write_uwyde(modifiers)
      io.write_ubyte(key)
      io.write_ubyte(pointer_mode)
      io.write_ubyte(keyboard_mode)
      io.write("\0\0\0")
    end
  end
  
  def grab_key (*args)
    grab_key_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 33, :grab_key

  def ungrab_key_async (key, grab_window, modifiers)
    request do |io|
      io.write_ubyte(34)
      io.write("\0\0")
      io.write_ubyte(key)
      io.write_utetra(grab_window)
      io.write_uwyde(modifiers)
      io.write("\0\0")
    end
  end
  
  def ungrab_key (*args)
    ungrab_key_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 34, :ungrab_key

  Alembic::Constants::ALLOW_ASYNC_POINTER = 0
  Alembic::Constants::ALLOW_SYNC_POINTER = 1
  Alembic::Constants::ALLOW_REPLAY_POINTER = 2
  Alembic::Constants::ALLOW_ASYNC_KEYBOARD = 3
  Alembic::Constants::ALLOW_SYNC_KEYBOARD = 4
  Alembic::Constants::ALLOW_REPLAY_KEYBOARD = 5
  Alembic::Constants::ALLOW_ASYNC_BOTH = 6
  Alembic::Constants::ALLOW_SYNC_BOTH = 7

  Alembic::Constants::ALLOWS = {
    0 => "ASYNC_POINTER",
    1 => "SYNC_POINTER",
    2 => "REPLAY_POINTER",
    3 => "ASYNC_KEYBOARD",
    4 => "SYNC_KEYBOARD",
    5 => "REPLAY_KEYBOARD",
    6 => "ASYNC_BOTH",
    7 => "SYNC_BOTH",
  }

  def allow_events_async (mode, time)
    request do |io|
      io.write_ubyte(35)
      io.write("\0\0")
      io.write_ubyte(mode)
      io.write_utetra(time)
    end
  end
  
  def allow_events (*args)
    allow_events_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 35, :allow_events

  def grab_server_async ()
    request do |io|
      io.write_ubyte(36)
      io.write("\0\0")
      io.write("\0")
    end
  end
  
  def grab_server (*args)
    grab_server_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 36, :grab_server

  def ungrab_server_async ()
    request do |io|
      io.write_ubyte(37)
      io.write("\0\0")
      io.write("\0")
    end
  end
  
  def ungrab_server (*args)
    ungrab_server_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 37, :ungrab_server

  def query_pointer_async (window)
    request do |io|
      io.write_ubyte(38)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(window)
    end
    reply do |io|
      query_pointer_reply(io)
    end
  end
  
  def query_pointer (*args)
    query_pointer_async(*args).wait
  end
  
  def query_pointer_reply (io)
    hash = {}
    hash[:same_screen] = io.read_bool
    hash[:root] = io.read_utetra
    hash[:child] = io.read_utetra
    hash[:root_x] = io.read_wyde
    hash[:root_y] = io.read_wyde
    hash[:win_x] = io.read_wyde
    hash[:win_y] = io.read_wyde
    hash[:mask] = io.read_uwyde
    io.skip(2)
    hash
  end

  Alembic::Protocol.register_opcode nil, 38, :query_pointer

  def get_motion_events_async (window, start, stop)
    request do |io|
      io.write_ubyte(39)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(window)
      io.write_utetra(start)
      io.write_utetra(stop)
    end
    reply do |io|
      get_motion_events_reply(io)
    end
  end
  
  def get_motion_events (*args)
    get_motion_events_async(*args).wait
  end
  
  def get_motion_events_reply (io)
    hash = {}
    io.skip(1)
    hash[:events_len] = io.read_utetra
    io.skip(20)
    hash[:events] = hash[:events_len].times.map do
      {}.tap do |hash|
        hash[:time] = io.read_utetra
        hash[:x] = io.read_wyde
        hash[:y] = io.read_wyde
      end
    end
    hash
  end

  Alembic::Protocol.register_opcode nil, 39, :get_motion_events

  def translate_coordinates_async (src_window, dst_window, src_x, src_y)
    request do |io|
      io.write_ubyte(40)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(src_window)
      io.write_utetra(dst_window)
      io.write_wyde(src_x)
      io.write_wyde(src_y)
    end
    reply do |io|
      translate_coordinates_reply(io)
    end
  end
  
  def translate_coordinates (*args)
    translate_coordinates_async(*args).wait
  end
  
  def translate_coordinates_reply (io)
    hash = {}
    hash[:same_screen] = io.read_bool
    hash[:child] = io.read_utetra
    hash[:dst_x] = io.read_wyde
    hash[:dst_y] = io.read_wyde
    hash
  end

  Alembic::Protocol.register_opcode nil, 40, :translate_coordinates

  def warp_pointer_async (src_window, dst_window, src_x, src_y, src_width, src_height, dst_x, dst_y)
    request do |io|
      io.write_ubyte(41)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(src_window)
      io.write_utetra(dst_window)
      io.write_wyde(src_x)
      io.write_wyde(src_y)
      io.write_uwyde(src_width)
      io.write_uwyde(src_height)
      io.write_wyde(dst_x)
      io.write_wyde(dst_y)
    end
  end
  
  def warp_pointer (*args)
    warp_pointer_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 41, :warp_pointer

  Alembic::Constants::INPUT_FOCUS_NONE = 0
  Alembic::Constants::INPUT_FOCUS_POINTER_ROOT = 1
  Alembic::Constants::INPUT_FOCUS_PARENT = 2
  Alembic::Constants::INPUT_FOCUS_FOLLOW_KEYBOARD = 3

  Alembic::Constants::INPUT_FOCUSES = {
    0 => "NONE",
    1 => "POINTER_ROOT",
    2 => "PARENT",
    3 => "FOLLOW_KEYBOARD",
  }

  def set_input_focus_async (revert_to, focus, time)
    request do |io|
      io.write_ubyte(42)
      io.write("\0\0")
      io.write_ubyte(revert_to)
      io.write_utetra(focus)
      io.write_utetra(time)
    end
  end
  
  def set_input_focus (*args)
    set_input_focus_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 42, :set_input_focus

  def get_input_focus_async ()
    request do |io|
      io.write_ubyte(43)
      io.write("\0\0")
      io.write("\0")
    end
    reply do |io|
      get_input_focus_reply(io)
    end
  end
  
  def get_input_focus (*args)
    get_input_focus_async(*args).wait
  end
  
  def get_input_focus_reply (io)
    hash = {}
    hash[:revert_to] = io.read_ubyte
    hash[:focus] = io.read_utetra
    hash
  end

  Alembic::Protocol.register_opcode nil, 43, :get_input_focus

  def query_keymap_async ()
    request do |io|
      io.write_ubyte(44)
      io.write("\0\0")
      io.write("\0")
    end
    reply do |io|
      query_keymap_reply(io)
    end
  end
  
  def query_keymap (*args)
    query_keymap_async(*args).wait
  end
  
  def query_keymap_reply (io)
    hash = {}
    io.skip(1)
    hash[:keys] = 32.times.map do
      io.read_ubyte
    end
    hash
  end

  Alembic::Protocol.register_opcode nil, 44, :query_keymap

  def open_font_async (fid, name_len, name)
    request do |io|
      io.write_ubyte(45)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(fid)
      io.write_uwyde(name_len)
      io.write("\0\0")
      io.write(name)
    end
  end
  
  def open_font (*args)
    open_font_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 45, :open_font

  def close_font_async (font)
    request do |io|
      io.write_ubyte(46)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(font)
    end
  end
  
  def close_font (*args)
    close_font_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 46, :close_font

  Alembic::Constants::FONT_DRAW_LEFT_TO_RIGHT = 0
  Alembic::Constants::FONT_DRAW_RIGHT_TO_LEFT = 1

  Alembic::Constants::FONT_DRAWS = {
    0 => "LEFT_TO_RIGHT",
    1 => "RIGHT_TO_LEFT",
  }

  def query_font_async (font)
    request do |io|
      io.write_ubyte(47)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(font)
    end
    reply do |io|
      query_font_reply(io)
    end
  end
  
  def query_font (*args)
    query_font_async(*args).wait
  end
  
  def query_font_reply (io)
    hash = {}
    io.skip(1)
    hash[:min_bounds] = {}.tap do |hash|
      hash[:left_side_bearing] = io.read_wyde
      hash[:right_side_bearing] = io.read_wyde
      hash[:character_width] = io.read_wyde
      hash[:ascent] = io.read_wyde
      hash[:descent] = io.read_wyde
      hash[:attributes] = io.read_uwyde
    end
    io.skip(4)
    hash[:max_bounds] = {}.tap do |hash|
      hash[:left_side_bearing] = io.read_wyde
      hash[:right_side_bearing] = io.read_wyde
      hash[:character_width] = io.read_wyde
      hash[:ascent] = io.read_wyde
      hash[:descent] = io.read_wyde
      hash[:attributes] = io.read_uwyde
    end
    io.skip(4)
    hash[:min_char_or_byte2] = io.read_uwyde
    hash[:max_char_or_byte2] = io.read_uwyde
    hash[:default_char] = io.read_uwyde
    hash[:properties_len] = io.read_uwyde
    hash[:draw_direction] = io.read_byte
    hash[:min_byte1] = io.read_ubyte
    hash[:max_byte1] = io.read_ubyte
    hash[:all_chars_exist] = io.read_bool
    hash[:font_ascent] = io.read_wyde
    hash[:font_descent] = io.read_wyde
    hash[:char_infos_len] = io.read_utetra
    hash[:properties] = hash[:properties_len].times.map do
      {}.tap do |hash|
        hash[:name] = io.read_utetra
        hash[:value] = io.read_utetra
      end
    end
    hash[:char_infos] = hash[:char_infos_len].times.map do
      {}.tap do |hash|
        hash[:left_side_bearing] = io.read_wyde
        hash[:right_side_bearing] = io.read_wyde
        hash[:character_width] = io.read_wyde
        hash[:ascent] = io.read_wyde
        hash[:descent] = io.read_wyde
        hash[:attributes] = io.read_uwyde
      end
    end
    hash
  end

  Alembic::Protocol.register_opcode nil, 47, :query_font

  def query_text_extents_async (odd_length, font, string)
    request do |io|
      io.write_ubyte(48)
      io.write("\0\0")
      io.write_bool(odd_length)
      io.write_utetra(font)
      io.write(string.encode('UTF-16BE').force_encoding('BINARY'))
    end
    reply do |io|
      query_text_extents_reply(io)
    end
  end
  
  def query_text_extents (*args)
    query_text_extents_async(*args).wait
  end
  
  def query_text_extents_reply (io)
    hash = {}
    hash[:draw_direction] = io.read_byte
    hash[:font_ascent] = io.read_wyde
    hash[:font_descent] = io.read_wyde
    hash[:overall_ascent] = io.read_wyde
    hash[:overall_descent] = io.read_wyde
    hash[:overall_width] = io.read_tetra
    hash[:overall_left] = io.read_tetra
    hash[:overall_right] = io.read_tetra
    hash
  end

  Alembic::Protocol.register_opcode nil, 48, :query_text_extents

  def list_fonts_async (max_names, pattern_len, pattern)
    request do |io|
      io.write_ubyte(49)
      io.write("\0\0")
      io.write("\0")
      io.write_uwyde(max_names)
      io.write_uwyde(pattern_len)
      io.write(pattern)
    end
    reply do |io|
      list_fonts_reply(io)
    end
  end
  
  def list_fonts (*args)
    list_fonts_async(*args).wait
  end
  
  def list_fonts_reply (io)
    hash = {}
    io.skip(1)
    hash[:names_len] = io.read_uwyde
    io.skip(22)
    hash[:names] = hash[:names_len].times.map do
      {}.tap do |hash|
        hash[:name_len] = io.read_ubyte
        hash[:name] = io.read(hash[:name_len])
      end
    end
    hash
  end

  Alembic::Protocol.register_opcode nil, 49, :list_fonts

  def list_fonts_with_info_async (max_names, pattern_len, pattern)
    request do |io|
      io.write_ubyte(50)
      io.write("\0\0")
      io.write("\0")
      io.write_uwyde(max_names)
      io.write_uwyde(pattern_len)
      io.write(pattern)
    end
    reply do |io|
      list_fonts_with_info_reply(io)
    end
  end
  
  def list_fonts_with_info (*args)
    list_fonts_with_info_async(*args).wait
  end
  
  def list_fonts_with_info_reply (io)
    hash = {}
    hash[:name_len] = io.read_ubyte
    hash[:min_bounds] = {}.tap do |hash|
      hash[:left_side_bearing] = io.read_wyde
      hash[:right_side_bearing] = io.read_wyde
      hash[:character_width] = io.read_wyde
      hash[:ascent] = io.read_wyde
      hash[:descent] = io.read_wyde
      hash[:attributes] = io.read_uwyde
    end
    io.skip(4)
    hash[:max_bounds] = {}.tap do |hash|
      hash[:left_side_bearing] = io.read_wyde
      hash[:right_side_bearing] = io.read_wyde
      hash[:character_width] = io.read_wyde
      hash[:ascent] = io.read_wyde
      hash[:descent] = io.read_wyde
      hash[:attributes] = io.read_uwyde
    end
    io.skip(4)
    hash[:min_char_or_byte2] = io.read_uwyde
    hash[:max_char_or_byte2] = io.read_uwyde
    hash[:default_char] = io.read_uwyde
    hash[:properties_len] = io.read_uwyde
    hash[:draw_direction] = io.read_byte
    hash[:min_byte1] = io.read_ubyte
    hash[:max_byte1] = io.read_ubyte
    hash[:all_chars_exist] = io.read_bool
    hash[:font_ascent] = io.read_wyde
    hash[:font_descent] = io.read_wyde
    hash[:replies_hint] = io.read_utetra
    hash[:properties] = hash[:properties_len].times.map do
      {}.tap do |hash|
        hash[:name] = io.read_utetra
        hash[:value] = io.read_utetra
      end
    end
    hash[:name] = io.read(hash[:name_len])
    hash
  end

  Alembic::Protocol.register_opcode nil, 50, :list_fonts_with_info

  def set_font_path_async (font_qty, font)
    request do |io|
      io.write_ubyte(51)
      io.write("\0\0")
      io.write("\0")
      io.write_uwyde(font_qty)
      io.write("\0\0")
      font.each do |item|
        io.write_ubyte(item[:name_len])
        io.write(item[:name])
      end
    end
  end
  
  def set_font_path (*args)
    set_font_path_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 51, :set_font_path

  def get_font_path_async ()
    request do |io|
      io.write_ubyte(52)
      io.write("\0\0")
      io.write("\0")
    end
    reply do |io|
      get_font_path_reply(io)
    end
  end
  
  def get_font_path (*args)
    get_font_path_async(*args).wait
  end
  
  def get_font_path_reply (io)
    hash = {}
    io.skip(1)
    hash[:path_len] = io.read_uwyde
    io.skip(22)
    hash[:path] = hash[:path_len].times.map do
      {}.tap do |hash|
        hash[:name_len] = io.read_ubyte
        hash[:name] = io.read(hash[:name_len])
      end
    end
    hash
  end

  Alembic::Protocol.register_opcode nil, 52, :get_font_path

  def create_pixmap_async (depth, pid, drawable, width, height)
    request do |io|
      io.write_ubyte(53)
      io.write("\0\0")
      io.write_ubyte(depth)
      io.write_utetra(pid)
      io.write_utetra(drawable)
      io.write_uwyde(width)
      io.write_uwyde(height)
    end
  end
  
  def create_pixmap (*args)
    create_pixmap_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 53, :create_pixmap

  def free_pixmap_async (pixmap)
    request do |io|
      io.write_ubyte(54)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(pixmap)
    end
  end
  
  def free_pixmap (*args)
    free_pixmap_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 54, :free_pixmap

  Alembic::Constants::GC_FUNCTION = 1
  Alembic::Constants::GC_PLANE_MASK = 2
  Alembic::Constants::GC_FOREGROUND = 4
  Alembic::Constants::GC_BACKGROUND = 8
  Alembic::Constants::GC_LINE_WIDTH = 16
  Alembic::Constants::GC_LINE_STYLE = 32
  Alembic::Constants::GC_CAP_STYLE = 64
  Alembic::Constants::GC_JOIN_STYLE = 128
  Alembic::Constants::GC_FILL_STYLE = 256
  Alembic::Constants::GC_FILL_RULE = 512
  Alembic::Constants::GC_TILE = 1024
  Alembic::Constants::GC_STIPPLE = 2048
  Alembic::Constants::GC_TILE_STIPPLE_ORIGIN_X = 4096
  Alembic::Constants::GC_TILE_STIPPLE_ORIGIN_Y = 8192
  Alembic::Constants::GC_FONT = 16384
  Alembic::Constants::GC_SUBWINDOW_MODE = 32768
  Alembic::Constants::GC_GRAPHICS_EXPOSURES = 65536
  Alembic::Constants::GC_CLIP_ORIGIN_X = 131072
  Alembic::Constants::GC_CLIP_ORIGIN_Y = 262144
  Alembic::Constants::GC_CLIP_MASK = 524288
  Alembic::Constants::GC_DASH_OFFSET = 1048576
  Alembic::Constants::GC_DASH_LIST = 2097152
  Alembic::Constants::GC_ARC_MODE = 4194304

  Alembic::Constants::GCS = {
    1 => "FUNCTION",
    2 => "PLANE_MASK",
    4 => "FOREGROUND",
    8 => "BACKGROUND",
    16 => "LINE_WIDTH",
    32 => "LINE_STYLE",
    64 => "CAP_STYLE",
    128 => "JOIN_STYLE",
    256 => "FILL_STYLE",
    512 => "FILL_RULE",
    1024 => "TILE",
    2048 => "STIPPLE",
    4096 => "TILE_STIPPLE_ORIGIN_X",
    8192 => "TILE_STIPPLE_ORIGIN_Y",
    16384 => "FONT",
    32768 => "SUBWINDOW_MODE",
    65536 => "GRAPHICS_EXPOSURES",
    131072 => "CLIP_ORIGIN_X",
    262144 => "CLIP_ORIGIN_Y",
    524288 => "CLIP_MASK",
    1048576 => "DASH_OFFSET",
    2097152 => "DASH_LIST",
    4194304 => "ARC_MODE",
  }

  Alembic::Constants::GX_CLEAR = 0
  Alembic::Constants::GX_AND = 1
  Alembic::Constants::GX_AND_REVERSE = 2
  Alembic::Constants::GX_COPY = 3
  Alembic::Constants::GX_AND_INVERTED = 4
  Alembic::Constants::GX_NOOP = 5
  Alembic::Constants::GX_XOR = 6
  Alembic::Constants::GX_OR = 7
  Alembic::Constants::GX_NOR = 8
  Alembic::Constants::GX_EQUIV = 9
  Alembic::Constants::GX_INVERT = 10
  Alembic::Constants::GX_OR_REVERSE = 11
  Alembic::Constants::GX_COPY_INVERTED = 12
  Alembic::Constants::GX_OR_INVERTED = 13
  Alembic::Constants::GX_NAND = 14
  Alembic::Constants::GX_SET = 15

  Alembic::Constants::GXES = {
    0 => "CLEAR",
    1 => "AND",
    2 => "AND_REVERSE",
    3 => "COPY",
    4 => "AND_INVERTED",
    5 => "NOOP",
    6 => "XOR",
    7 => "OR",
    8 => "NOR",
    9 => "EQUIV",
    10 => "INVERT",
    11 => "OR_REVERSE",
    12 => "COPY_INVERTED",
    13 => "OR_INVERTED",
    14 => "NAND",
    15 => "SET",
  }

  Alembic::Constants::LINE_STYLE_SOLID = 0
  Alembic::Constants::LINE_STYLE_ON_OFF_DASH = 1
  Alembic::Constants::LINE_STYLE_DOUBLE_DASH = 2

  Alembic::Constants::LINE_STYLES = {
    0 => "SOLID",
    1 => "ON_OFF_DASH",
    2 => "DOUBLE_DASH",
  }

  Alembic::Constants::CAP_STYLE_NOT_LAST = 0
  Alembic::Constants::CAP_STYLE_BUTT = 1
  Alembic::Constants::CAP_STYLE_ROUND = 2
  Alembic::Constants::CAP_STYLE_PROJECTING = 3

  Alembic::Constants::CAP_STYLES = {
    0 => "NOT_LAST",
    1 => "BUTT",
    2 => "ROUND",
    3 => "PROJECTING",
  }

  Alembic::Constants::JOIN_STYLE_MITER = 0
  Alembic::Constants::JOIN_STYLE_ROUND = 1
  Alembic::Constants::JOIN_STYLE_BEVEL = 2

  Alembic::Constants::JOIN_STYLES = {
    0 => "MITER",
    1 => "ROUND",
    2 => "BEVEL",
  }

  Alembic::Constants::FILL_STYLE_SOLID = 0
  Alembic::Constants::FILL_STYLE_TILED = 1
  Alembic::Constants::FILL_STYLE_STIPPLED = 2
  Alembic::Constants::FILL_STYLE_OPAQUE_STIPPLED = 3

  Alembic::Constants::FILL_STYLES = {
    0 => "SOLID",
    1 => "TILED",
    2 => "STIPPLED",
    3 => "OPAQUE_STIPPLED",
  }

  Alembic::Constants::FILL_RULE_EVEN_ODD = 0
  Alembic::Constants::FILL_RULE_WINDING = 1

  Alembic::Constants::FILL_RULES = {
    0 => "EVEN_ODD",
    1 => "WINDING",
  }

  Alembic::Constants::SUBWINDOW_MODE_CLIP_BY_CHILDREN = 0
  Alembic::Constants::SUBWINDOW_MODE_INCLUDE_INFERIORS = 1

  Alembic::Constants::SUBWINDOW_MODES = {
    0 => "CLIP_BY_CHILDREN",
    1 => "INCLUDE_INFERIORS",
  }

  Alembic::Constants::ARC_MODE_CHORD = 0
  Alembic::Constants::ARC_MODE_PIE_SLICE = 1

  Alembic::Constants::ARC_MODES = {
    0 => "CHORD",
    1 => "PIE_SLICE",
  }

  def create_gc_async (cid, drawable, value_mask, value_list)
    request do |io|
      io.write_ubyte(55)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(cid)
      io.write_utetra(drawable)
      io.write_utetra(value_mask)
      value_list.each do |item|
        io.write_utetra(item)
      end
    end
  end
  
  def create_gc (*args)
    create_gc_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 55, :create_gc

  def change_gc_async (gc, value_mask, value_list)
    request do |io|
      io.write_ubyte(56)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(gc)
      io.write_utetra(value_mask)
      value_list.each do |item|
        io.write_utetra(item)
      end
    end
  end
  
  def change_gc (*args)
    change_gc_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 56, :change_gc

  def copy_gc_async (src_gc, dst_gc, value_mask)
    request do |io|
      io.write_ubyte(57)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(src_gc)
      io.write_utetra(dst_gc)
      io.write_utetra(value_mask)
    end
  end
  
  def copy_gc (*args)
    copy_gc_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 57, :copy_gc

  def set_dashes_async (gc, dash_offset, dashes_len, dashes)
    request do |io|
      io.write_ubyte(58)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(gc)
      io.write_uwyde(dash_offset)
      io.write_uwyde(dashes_len)
      dashes.each do |item|
        io.write_ubyte(item)
      end
    end
  end
  
  def set_dashes (*args)
    set_dashes_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 58, :set_dashes

  Alembic::Constants::CLIP_ORDERING_UNSORTED = 0
  Alembic::Constants::CLIP_ORDERING_Y_SORTED = 1
  Alembic::Constants::CLIP_ORDERING_YX_SORTED = 2
  Alembic::Constants::CLIP_ORDERING_YX_BANDED = 3

  Alembic::Constants::CLIP_ORDERINGS = {
    0 => "UNSORTED",
    1 => "Y_SORTED",
    2 => "YX_SORTED",
    3 => "YX_BANDED",
  }

  def set_clip_rectangles_async (ordering, gc, clip_x_origin, clip_y_origin, rectangles)
    request do |io|
      io.write_ubyte(59)
      io.write("\0\0")
      io.write_byte(ordering)
      io.write_utetra(gc)
      io.write_wyde(clip_x_origin)
      io.write_wyde(clip_y_origin)
      rectangles.each do |item|
        io.write_wyde(item[:x])
        io.write_wyde(item[:y])
        io.write_uwyde(item[:width])
        io.write_uwyde(item[:height])
      end
    end
  end
  
  def set_clip_rectangles (*args)
    set_clip_rectangles_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 59, :set_clip_rectangles

  def free_gc_async (gc)
    request do |io|
      io.write_ubyte(60)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(gc)
    end
  end
  
  def free_gc (*args)
    free_gc_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 60, :free_gc

  def clear_area_async (exposures, window, x, y, width, height)
    request do |io|
      io.write_ubyte(61)
      io.write("\0\0")
      io.write_bool(exposures)
      io.write_utetra(window)
      io.write_wyde(x)
      io.write_wyde(y)
      io.write_uwyde(width)
      io.write_uwyde(height)
    end
  end
  
  def clear_area (*args)
    clear_area_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 61, :clear_area

  def copy_area_async (src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height)
    request do |io|
      io.write_ubyte(62)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(src_drawable)
      io.write_utetra(dst_drawable)
      io.write_utetra(gc)
      io.write_wyde(src_x)
      io.write_wyde(src_y)
      io.write_wyde(dst_x)
      io.write_wyde(dst_y)
      io.write_uwyde(width)
      io.write_uwyde(height)
    end
  end
  
  def copy_area (*args)
    copy_area_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 62, :copy_area

  def copy_plane_async (src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height, bit_plane)
    request do |io|
      io.write_ubyte(63)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(src_drawable)
      io.write_utetra(dst_drawable)
      io.write_utetra(gc)
      io.write_wyde(src_x)
      io.write_wyde(src_y)
      io.write_wyde(dst_x)
      io.write_wyde(dst_y)
      io.write_uwyde(width)
      io.write_uwyde(height)
      io.write_utetra(bit_plane)
    end
  end
  
  def copy_plane (*args)
    copy_plane_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 63, :copy_plane

  Alembic::Constants::COORD_MODE_ORIGIN = 0
  Alembic::Constants::COORD_MODE_PREVIOUS = 1

  Alembic::Constants::COORD_MODES = {
    0 => "ORIGIN",
    1 => "PREVIOUS",
  }

  def poly_point_async (coordinate_mode, drawable, gc, points)
    request do |io|
      io.write_ubyte(64)
      io.write("\0\0")
      io.write_byte(coordinate_mode)
      io.write_utetra(drawable)
      io.write_utetra(gc)
      points.each do |item|
        io.write_wyde(item[:x])
        io.write_wyde(item[:y])
      end
    end
  end
  
  def poly_point (*args)
    poly_point_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 64, :poly_point

  def poly_line_async (coordinate_mode, drawable, gc, points)
    request do |io|
      io.write_ubyte(65)
      io.write("\0\0")
      io.write_byte(coordinate_mode)
      io.write_utetra(drawable)
      io.write_utetra(gc)
      points.each do |item|
        io.write_wyde(item[:x])
        io.write_wyde(item[:y])
      end
    end
  end
  
  def poly_line (*args)
    poly_line_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 65, :poly_line

  def poly_segment_async (drawable, gc, segments)
    request do |io|
      io.write_ubyte(66)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(drawable)
      io.write_utetra(gc)
      segments.each do |item|
        io.write_wyde(item[:x1])
        io.write_wyde(item[:y1])
        io.write_wyde(item[:x2])
        io.write_wyde(item[:y2])
      end
    end
  end
  
  def poly_segment (*args)
    poly_segment_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 66, :poly_segment

  def poly_rectangle_async (drawable, gc, rectangles)
    request do |io|
      io.write_ubyte(67)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(drawable)
      io.write_utetra(gc)
      rectangles.each do |item|
        io.write_wyde(item[:x])
        io.write_wyde(item[:y])
        io.write_uwyde(item[:width])
        io.write_uwyde(item[:height])
      end
    end
  end
  
  def poly_rectangle (*args)
    poly_rectangle_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 67, :poly_rectangle

  def poly_arc_async (drawable, gc, arcs)
    request do |io|
      io.write_ubyte(68)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(drawable)
      io.write_utetra(gc)
      arcs.each do |item|
        io.write_wyde(item[:x])
        io.write_wyde(item[:y])
        io.write_uwyde(item[:width])
        io.write_uwyde(item[:height])
        io.write_wyde(item[:angle1])
        io.write_wyde(item[:angle2])
      end
    end
  end
  
  def poly_arc (*args)
    poly_arc_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 68, :poly_arc

  Alembic::Constants::POLY_SHAPE_COMPLEX = 0
  Alembic::Constants::POLY_SHAPE_NONCONVEX = 1
  Alembic::Constants::POLY_SHAPE_CONVEX = 2

  Alembic::Constants::POLY_SHAPES = {
    0 => "COMPLEX",
    1 => "NONCONVEX",
    2 => "CONVEX",
  }

  def fill_poly_async (drawable, gc, shape, coordinate_mode, points)
    request do |io|
      io.write_ubyte(69)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(drawable)
      io.write_utetra(gc)
      io.write_ubyte(shape)
      io.write_ubyte(coordinate_mode)
      io.write("\0\0")
      points.each do |item|
        io.write_wyde(item[:x])
        io.write_wyde(item[:y])
      end
    end
  end
  
  def fill_poly (*args)
    fill_poly_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 69, :fill_poly

  def poly_fill_rectangle_async (drawable, gc, rectangles)
    request do |io|
      io.write_ubyte(70)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(drawable)
      io.write_utetra(gc)
      rectangles.each do |item|
        io.write_wyde(item[:x])
        io.write_wyde(item[:y])
        io.write_uwyde(item[:width])
        io.write_uwyde(item[:height])
      end
    end
  end
  
  def poly_fill_rectangle (*args)
    poly_fill_rectangle_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 70, :poly_fill_rectangle

  def poly_fill_arc_async (drawable, gc, arcs)
    request do |io|
      io.write_ubyte(71)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(drawable)
      io.write_utetra(gc)
      arcs.each do |item|
        io.write_wyde(item[:x])
        io.write_wyde(item[:y])
        io.write_uwyde(item[:width])
        io.write_uwyde(item[:height])
        io.write_wyde(item[:angle1])
        io.write_wyde(item[:angle2])
      end
    end
  end
  
  def poly_fill_arc (*args)
    poly_fill_arc_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 71, :poly_fill_arc

  Alembic::Constants::IMAGE_FORMAT_XY_BITMAP = 0
  Alembic::Constants::IMAGE_FORMAT_XY_PIXMAP = 1
  Alembic::Constants::IMAGE_FORMAT_Z_PIXMAP = 2

  Alembic::Constants::IMAGE_FORMATS = {
    0 => "XY_BITMAP",
    1 => "XY_PIXMAP",
    2 => "Z_PIXMAP",
  }

  def put_image_async (format, drawable, gc, width, height, dst_x, dst_y, left_pad, depth, data)
    request do |io|
      io.write_ubyte(72)
      io.write("\0\0")
      io.write_ubyte(format)
      io.write_utetra(drawable)
      io.write_utetra(gc)
      io.write_uwyde(width)
      io.write_uwyde(height)
      io.write_wyde(dst_x)
      io.write_wyde(dst_y)
      io.write_ubyte(left_pad)
      io.write_ubyte(depth)
      io.write("\0\0")
      data.each do |item|
        io.write_byte(item)
      end
    end
  end
  
  def put_image (*args)
    put_image_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 72, :put_image

  def get_image_async (format, drawable, x, y, width, height, plane_mask)
    request do |io|
      io.write_ubyte(73)
      io.write("\0\0")
      io.write_ubyte(format)
      io.write_utetra(drawable)
      io.write_wyde(x)
      io.write_wyde(y)
      io.write_uwyde(width)
      io.write_uwyde(height)
      io.write_utetra(plane_mask)
    end
    reply do |io|
      get_image_reply(io)
    end
  end
  
  def get_image (*args)
    get_image_async(*args).wait
  end
  
  def get_image_reply (io)
    hash = {}
    hash[:depth] = io.read_ubyte
    hash[:visual] = io.read_utetra
    io.skip(20)
    hash[:data] = hash[:length].times.map do
      io.read_byte
    end
    hash
  end

  Alembic::Protocol.register_opcode nil, 73, :get_image

  def poly_text8_async (drawable, gc, x, y, items)
    request do |io|
      io.write_ubyte(74)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(drawable)
      io.write_utetra(gc)
      io.write_wyde(x)
      io.write_wyde(y)
      items.each do |item|
        io.write_byte(item)
      end
    end
  end
  
  def poly_text8 (*args)
    poly_text8_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 74, :poly_text8

  def poly_text16_async (drawable, gc, x, y, items)
    request do |io|
      io.write_ubyte(75)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(drawable)
      io.write_utetra(gc)
      io.write_wyde(x)
      io.write_wyde(y)
      items.each do |item|
        io.write_byte(item)
      end
    end
  end
  
  def poly_text16 (*args)
    poly_text16_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 75, :poly_text16

  def image_text8_async (string_len, drawable, gc, x, y, string)
    request do |io|
      io.write_ubyte(76)
      io.write("\0\0")
      io.write_byte(string_len)
      io.write_utetra(drawable)
      io.write_utetra(gc)
      io.write_wyde(x)
      io.write_wyde(y)
      io.write(string)
    end
  end
  
  def image_text8 (*args)
    image_text8_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 76, :image_text8

  def image_text16_async (string_len, drawable, gc, x, y, string)
    request do |io|
      io.write_ubyte(77)
      io.write("\0\0")
      io.write_byte(string_len)
      io.write_utetra(drawable)
      io.write_utetra(gc)
      io.write_wyde(x)
      io.write_wyde(y)
      io.write(string.encode('UTF-16BE').force_encoding('BINARY'))
    end
  end
  
  def image_text16 (*args)
    image_text16_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 77, :image_text16

  Alembic::Constants::COLORMAP_ALLOC_NONE = 0
  Alembic::Constants::COLORMAP_ALLOC_ALL = 1

  Alembic::Constants::COLORMAP_ALLOCS = {
    0 => "NONE",
    1 => "ALL",
  }

  def create_colormap_async (alloc, mid, window, visual)
    request do |io|
      io.write_ubyte(78)
      io.write("\0\0")
      io.write_byte(alloc)
      io.write_utetra(mid)
      io.write_utetra(window)
      io.write_utetra(visual)
    end
  end
  
  def create_colormap (*args)
    create_colormap_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 78, :create_colormap

  def free_colormap_async (cmap)
    request do |io|
      io.write_ubyte(79)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(cmap)
    end
  end
  
  def free_colormap (*args)
    free_colormap_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 79, :free_colormap

  def copy_colormap_and_free_async (mid, src_cmap)
    request do |io|
      io.write_ubyte(80)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(mid)
      io.write_utetra(src_cmap)
    end
  end
  
  def copy_colormap_and_free (*args)
    copy_colormap_and_free_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 80, :copy_colormap_and_free

  def install_colormap_async (cmap)
    request do |io|
      io.write_ubyte(81)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(cmap)
    end
  end
  
  def install_colormap (*args)
    install_colormap_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 81, :install_colormap

  def uninstall_colormap_async (cmap)
    request do |io|
      io.write_ubyte(82)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(cmap)
    end
  end
  
  def uninstall_colormap (*args)
    uninstall_colormap_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 82, :uninstall_colormap

  def list_installed_colormaps_async (window)
    request do |io|
      io.write_ubyte(83)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(window)
    end
    reply do |io|
      list_installed_colormaps_reply(io)
    end
  end
  
  def list_installed_colormaps (*args)
    list_installed_colormaps_async(*args).wait
  end
  
  def list_installed_colormaps_reply (io)
    hash = {}
    io.skip(1)
    hash[:cmaps_len] = io.read_uwyde
    io.skip(22)
    hash[:cmaps] = hash[:cmaps_len].times.map do
      io.read_utetra
    end
    hash
  end

  Alembic::Protocol.register_opcode nil, 83, :list_installed_colormaps

  def alloc_color_async (cmap, red, green, blue)
    request do |io|
      io.write_ubyte(84)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(cmap)
      io.write_uwyde(red)
      io.write_uwyde(green)
      io.write_uwyde(blue)
      io.write("\0\0")
    end
    reply do |io|
      alloc_color_reply(io)
    end
  end
  
  def alloc_color (*args)
    alloc_color_async(*args).wait
  end
  
  def alloc_color_reply (io)
    hash = {}
    io.skip(1)
    hash[:red] = io.read_uwyde
    hash[:green] = io.read_uwyde
    hash[:blue] = io.read_uwyde
    io.skip(2)
    hash[:pixel] = io.read_utetra
    hash
  end

  Alembic::Protocol.register_opcode nil, 84, :alloc_color

  def alloc_named_color_async (cmap, name_len, name)
    request do |io|
      io.write_ubyte(85)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(cmap)
      io.write_uwyde(name_len)
      io.write("\0\0")
      io.write(name)
    end
    reply do |io|
      alloc_named_color_reply(io)
    end
  end
  
  def alloc_named_color (*args)
    alloc_named_color_async(*args).wait
  end
  
  def alloc_named_color_reply (io)
    hash = {}
    io.skip(1)
    hash[:pixel] = io.read_utetra
    hash[:exact_red] = io.read_uwyde
    hash[:exact_green] = io.read_uwyde
    hash[:exact_blue] = io.read_uwyde
    hash[:visual_red] = io.read_uwyde
    hash[:visual_green] = io.read_uwyde
    hash[:visual_blue] = io.read_uwyde
    hash
  end

  Alembic::Protocol.register_opcode nil, 85, :alloc_named_color

  def alloc_color_cells_async (contiguous, cmap, colors, planes)
    request do |io|
      io.write_ubyte(86)
      io.write("\0\0")
      io.write_bool(contiguous)
      io.write_utetra(cmap)
      io.write_uwyde(colors)
      io.write_uwyde(planes)
    end
    reply do |io|
      alloc_color_cells_reply(io)
    end
  end
  
  def alloc_color_cells (*args)
    alloc_color_cells_async(*args).wait
  end
  
  def alloc_color_cells_reply (io)
    hash = {}
    io.skip(1)
    hash[:pixels_len] = io.read_uwyde
    hash[:masks_len] = io.read_uwyde
    io.skip(20)
    hash[:pixels] = hash[:pixels_len].times.map do
      io.read_utetra
    end
    hash[:masks] = hash[:masks_len].times.map do
      io.read_utetra
    end
    hash
  end

  Alembic::Protocol.register_opcode nil, 86, :alloc_color_cells

  def alloc_color_planes_async (contiguous, cmap, colors, reds, greens, blues)
    request do |io|
      io.write_ubyte(87)
      io.write("\0\0")
      io.write_bool(contiguous)
      io.write_utetra(cmap)
      io.write_uwyde(colors)
      io.write_uwyde(reds)
      io.write_uwyde(greens)
      io.write_uwyde(blues)
    end
    reply do |io|
      alloc_color_planes_reply(io)
    end
  end
  
  def alloc_color_planes (*args)
    alloc_color_planes_async(*args).wait
  end
  
  def alloc_color_planes_reply (io)
    hash = {}
    io.skip(1)
    hash[:pixels_len] = io.read_uwyde
    io.skip(2)
    hash[:red_mask] = io.read_utetra
    hash[:green_mask] = io.read_utetra
    hash[:blue_mask] = io.read_utetra
    io.skip(8)
    hash[:pixels] = hash[:pixels_len].times.map do
      io.read_utetra
    end
    hash
  end

  Alembic::Protocol.register_opcode nil, 87, :alloc_color_planes

  def free_colors_async (cmap, plane_mask, pixels)
    request do |io|
      io.write_ubyte(88)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(cmap)
      io.write_utetra(plane_mask)
      pixels.each do |item|
        io.write_utetra(item)
      end
    end
  end
  
  def free_colors (*args)
    free_colors_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 88, :free_colors

  Alembic::Constants::COLOR_FLAG_RED = 1
  Alembic::Constants::COLOR_FLAG_GREEN = 2
  Alembic::Constants::COLOR_FLAG_BLUE = 4

  Alembic::Constants::COLOR_FLAGS = {
    1 => "RED",
    2 => "GREEN",
    4 => "BLUE",
  }

  def store_colors_async (cmap, items)
    request do |io|
      io.write_ubyte(89)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(cmap)
      items.each do |item|
        io.write_utetra(item[:pixel])
        io.write_uwyde(item[:red])
        io.write_uwyde(item[:green])
        io.write_uwyde(item[:blue])
        io.write_byte(item[:flags])
        io.write("\0")
      end
    end
  end
  
  def store_colors (*args)
    store_colors_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 89, :store_colors

  def store_named_color_async (flags, cmap, pixel, name_len, name)
    request do |io|
      io.write_ubyte(90)
      io.write("\0\0")
      io.write_ubyte(flags)
      io.write_utetra(cmap)
      io.write_utetra(pixel)
      io.write_uwyde(name_len)
      io.write("\0\0")
      io.write(name)
    end
  end
  
  def store_named_color (*args)
    store_named_color_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 90, :store_named_color

  def query_colors_async (cmap, pixels)
    request do |io|
      io.write_ubyte(91)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(cmap)
      pixels.each do |item|
        io.write_utetra(item)
      end
    end
    reply do |io|
      query_colors_reply(io)
    end
  end
  
  def query_colors (*args)
    query_colors_async(*args).wait
  end
  
  def query_colors_reply (io)
    hash = {}
    io.skip(1)
    hash[:colors_len] = io.read_uwyde
    io.skip(22)
    hash[:colors] = hash[:colors_len].times.map do
      {}.tap do |hash|
        hash[:red] = io.read_uwyde
        hash[:green] = io.read_uwyde
        hash[:blue] = io.read_uwyde
        io.skip(2)
      end
    end
    hash
  end

  Alembic::Protocol.register_opcode nil, 91, :query_colors

  def lookup_color_async (cmap, name_len, name)
    request do |io|
      io.write_ubyte(92)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(cmap)
      io.write_uwyde(name_len)
      io.write("\0\0")
      io.write(name)
    end
    reply do |io|
      lookup_color_reply(io)
    end
  end
  
  def lookup_color (*args)
    lookup_color_async(*args).wait
  end
  
  def lookup_color_reply (io)
    hash = {}
    io.skip(1)
    hash[:exact_red] = io.read_uwyde
    hash[:exact_green] = io.read_uwyde
    hash[:exact_blue] = io.read_uwyde
    hash[:visual_red] = io.read_uwyde
    hash[:visual_green] = io.read_uwyde
    hash[:visual_blue] = io.read_uwyde
    hash
  end

  Alembic::Protocol.register_opcode nil, 92, :lookup_color

  def create_cursor_async (cid, source, mask, fore_red, fore_green, fore_blue, back_red, back_green, back_blue, x, y)
    request do |io|
      io.write_ubyte(93)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(cid)
      io.write_utetra(source)
      io.write_utetra(mask)
      io.write_uwyde(fore_red)
      io.write_uwyde(fore_green)
      io.write_uwyde(fore_blue)
      io.write_uwyde(back_red)
      io.write_uwyde(back_green)
      io.write_uwyde(back_blue)
      io.write_uwyde(x)
      io.write_uwyde(y)
    end
  end
  
  def create_cursor (*args)
    create_cursor_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 93, :create_cursor

  def create_glyph_cursor_async (cid, source_font, mask_font, source_char, mask_char, fore_red, fore_green, fore_blue, back_red, back_green, back_blue)
    request do |io|
      io.write_ubyte(94)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(cid)
      io.write_utetra(source_font)
      io.write_utetra(mask_font)
      io.write_uwyde(source_char)
      io.write_uwyde(mask_char)
      io.write_uwyde(fore_red)
      io.write_uwyde(fore_green)
      io.write_uwyde(fore_blue)
      io.write_uwyde(back_red)
      io.write_uwyde(back_green)
      io.write_uwyde(back_blue)
    end
  end
  
  def create_glyph_cursor (*args)
    create_glyph_cursor_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 94, :create_glyph_cursor

  def free_cursor_async (cursor)
    request do |io|
      io.write_ubyte(95)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(cursor)
    end
  end
  
  def free_cursor (*args)
    free_cursor_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 95, :free_cursor

  def recolor_cursor_async (cursor, fore_red, fore_green, fore_blue, back_red, back_green, back_blue)
    request do |io|
      io.write_ubyte(96)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(cursor)
      io.write_uwyde(fore_red)
      io.write_uwyde(fore_green)
      io.write_uwyde(fore_blue)
      io.write_uwyde(back_red)
      io.write_uwyde(back_green)
      io.write_uwyde(back_blue)
    end
  end
  
  def recolor_cursor (*args)
    recolor_cursor_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 96, :recolor_cursor

  Alembic::Constants::QUERY_SHAPE_OF_LARGEST_CURSOR = 0
  Alembic::Constants::QUERY_SHAPE_OF_FASTEST_TILE = 1
  Alembic::Constants::QUERY_SHAPE_OF_FASTEST_STIPPLE = 2

  Alembic::Constants::QUERY_SHAPE_OFS = {
    0 => "LARGEST_CURSOR",
    1 => "FASTEST_TILE",
    2 => "FASTEST_STIPPLE",
  }

  def query_best_size_async (klass, drawable, width, height)
    request do |io|
      io.write_ubyte(97)
      io.write("\0\0")
      io.write_ubyte(klass)
      io.write_utetra(drawable)
      io.write_uwyde(width)
      io.write_uwyde(height)
    end
    reply do |io|
      query_best_size_reply(io)
    end
  end
  
  def query_best_size (*args)
    query_best_size_async(*args).wait
  end
  
  def query_best_size_reply (io)
    hash = {}
    io.skip(1)
    hash[:width] = io.read_uwyde
    hash[:height] = io.read_uwyde
    hash
  end

  Alembic::Protocol.register_opcode nil, 97, :query_best_size

  def query_extension_async (name_len, name)
    request do |io|
      io.write_ubyte(98)
      io.write("\0\0")
      io.write("\0")
      io.write_uwyde(name_len)
      io.write("\0\0")
      io.write(name)
    end
    reply do |io|
      query_extension_reply(io)
    end
  end
  
  def query_extension (*args)
    query_extension_async(*args).wait
  end
  
  def query_extension_reply (io)
    hash = {}
    io.skip(1)
    hash[:present] = io.read_bool
    hash[:major_opcode] = io.read_ubyte
    hash[:first_event] = io.read_ubyte
    hash[:first_error] = io.read_ubyte
    hash
  end

  Alembic::Protocol.register_opcode nil, 98, :query_extension

  def list_extensions_async ()
    request do |io|
      io.write_ubyte(99)
      io.write("\0\0")
      io.write("\0")
    end
    reply do |io|
      list_extensions_reply(io)
    end
  end
  
  def list_extensions (*args)
    list_extensions_async(*args).wait
  end
  
  def list_extensions_reply (io)
    hash = {}
    hash[:names_len] = io.read_ubyte
    io.skip(24)
    hash[:names] = hash[:names_len].times.map do
      {}.tap do |hash|
        hash[:name_len] = io.read_ubyte
        hash[:name] = io.read(hash[:name_len])
      end
    end
    hash
  end

  Alembic::Protocol.register_opcode nil, 99, :list_extensions

  def change_keyboard_mapping_async (keycode_count, first_keycode, keysyms_per_keycode, keysyms)
    request do |io|
      io.write_ubyte(100)
      io.write("\0\0")
      io.write_ubyte(keycode_count)
      io.write_ubyte(first_keycode)
      io.write_ubyte(keysyms_per_keycode)
      io.write("\0\0")
      keysyms.each do |item|
        io.write_utetra(item)
      end
    end
  end
  
  def change_keyboard_mapping (*args)
    change_keyboard_mapping_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 100, :change_keyboard_mapping

  def get_keyboard_mapping_async (first_keycode, count)
    request do |io|
      io.write_ubyte(101)
      io.write("\0\0")
      io.write("\0")
      io.write_ubyte(first_keycode)
      io.write_ubyte(count)
    end
    reply do |io|
      get_keyboard_mapping_reply(io)
    end
  end
  
  def get_keyboard_mapping (*args)
    get_keyboard_mapping_async(*args).wait
  end
  
  def get_keyboard_mapping_reply (io)
    hash = {}
    hash[:keysyms_per_keycode] = io.read_byte
    io.skip(24)
    hash[:keysyms] = hash[:length].times.map do
      io.read_utetra
    end
    hash
  end

  Alembic::Protocol.register_opcode nil, 101, :get_keyboard_mapping

  Alembic::Constants::KB_KEY_CLICK_PERCENT = 1
  Alembic::Constants::KB_BELL_PERCENT = 2
  Alembic::Constants::KB_BELL_PITCH = 4
  Alembic::Constants::KB_BELL_DURATION = 8
  Alembic::Constants::KB_LED = 16
  Alembic::Constants::KB_LED_MODE = 32
  Alembic::Constants::KB_KEY = 64
  Alembic::Constants::KB_AUTO_REPEAT_MODE = 128

  Alembic::Constants::KBS = {
    1 => "KEY_CLICK_PERCENT",
    2 => "BELL_PERCENT",
    4 => "BELL_PITCH",
    8 => "BELL_DURATION",
    16 => "LED",
    32 => "LED_MODE",
    64 => "KEY",
    128 => "AUTO_REPEAT_MODE",
  }

  Alembic::Constants::LED_MODE_OFF = 0
  Alembic::Constants::LED_MODE_ON = 1

  Alembic::Constants::LED_MODES = {
    0 => "OFF",
    1 => "ON",
  }

  Alembic::Constants::AUTO_REPEAT_MODE_OFF = 0
  Alembic::Constants::AUTO_REPEAT_MODE_ON = 1
  Alembic::Constants::AUTO_REPEAT_MODE_DEFAULT = 2

  Alembic::Constants::AUTO_REPEAT_MODES = {
    0 => "OFF",
    1 => "ON",
    2 => "DEFAULT",
  }

  def change_keyboard_control_async (value_mask, value_list)
    request do |io|
      io.write_ubyte(102)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(value_mask)
      value_list.each do |item|
        io.write_utetra(item)
      end
    end
  end
  
  def change_keyboard_control (*args)
    change_keyboard_control_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 102, :change_keyboard_control

  def get_keyboard_control_async ()
    request do |io|
      io.write_ubyte(103)
      io.write("\0\0")
      io.write("\0")
    end
    reply do |io|
      get_keyboard_control_reply(io)
    end
  end
  
  def get_keyboard_control (*args)
    get_keyboard_control_async(*args).wait
  end
  
  def get_keyboard_control_reply (io)
    hash = {}
    hash[:global_auto_repeat] = io.read_byte
    hash[:led_mask] = io.read_utetra
    hash[:key_click_percent] = io.read_ubyte
    hash[:bell_percent] = io.read_ubyte
    hash[:bell_pitch] = io.read_uwyde
    hash[:bell_duration] = io.read_uwyde
    io.skip(2)
    hash[:auto_repeats] = 32.times.map do
      io.read_ubyte
    end
    hash
  end

  Alembic::Protocol.register_opcode nil, 103, :get_keyboard_control

  def bell_async (percent)
    request do |io|
      io.write_ubyte(104)
      io.write("\0\0")
      io.write_byte(percent)
    end
  end
  
  def bell (*args)
    bell_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 104, :bell

  def change_pointer_control_async (acceleration_numerator, acceleration_denominator, threshold, do_acceleration, do_threshold)
    request do |io|
      io.write_ubyte(105)
      io.write("\0\0")
      io.write("\0")
      io.write_wyde(acceleration_numerator)
      io.write_wyde(acceleration_denominator)
      io.write_wyde(threshold)
      io.write_bool(do_acceleration)
      io.write_bool(do_threshold)
    end
  end
  
  def change_pointer_control (*args)
    change_pointer_control_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 105, :change_pointer_control

  def get_pointer_control_async ()
    request do |io|
      io.write_ubyte(106)
      io.write("\0\0")
      io.write("\0")
    end
    reply do |io|
      get_pointer_control_reply(io)
    end
  end
  
  def get_pointer_control (*args)
    get_pointer_control_async(*args).wait
  end
  
  def get_pointer_control_reply (io)
    hash = {}
    io.skip(1)
    hash[:acceleration_numerator] = io.read_uwyde
    hash[:acceleration_denominator] = io.read_uwyde
    hash[:threshold] = io.read_uwyde
    io.skip(18)
    hash
  end

  Alembic::Protocol.register_opcode nil, 106, :get_pointer_control

  Alembic::Constants::BLANKING_NOT_PREFERRED = 0
  Alembic::Constants::BLANKING_PREFERRED = 1
  Alembic::Constants::BLANKING_DEFAULT = 2

  Alembic::Constants::BLANKINGS = {
    0 => "NOT_PREFERRED",
    1 => "PREFERRED",
    2 => "DEFAULT",
  }

  Alembic::Constants::EXPOSURES_NOT_ALLOWED = 0
  Alembic::Constants::EXPOSURES_ALLOWED = 1
  Alembic::Constants::EXPOSURES_DEFAULT = 2

  Alembic::Constants::EXPOSURESES = {
    0 => "NOT_ALLOWED",
    1 => "ALLOWED",
    2 => "DEFAULT",
  }

  def set_screen_saver_async (timeout, interval, prefer_blanking, allow_exposures)
    request do |io|
      io.write_ubyte(107)
      io.write("\0\0")
      io.write("\0")
      io.write_wyde(timeout)
      io.write_wyde(interval)
      io.write_ubyte(prefer_blanking)
      io.write_ubyte(allow_exposures)
    end
  end
  
  def set_screen_saver (*args)
    set_screen_saver_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 107, :set_screen_saver

  def get_screen_saver_async ()
    request do |io|
      io.write_ubyte(108)
      io.write("\0\0")
      io.write("\0")
    end
    reply do |io|
      get_screen_saver_reply(io)
    end
  end
  
  def get_screen_saver (*args)
    get_screen_saver_async(*args).wait
  end
  
  def get_screen_saver_reply (io)
    hash = {}
    io.skip(1)
    hash[:timeout] = io.read_uwyde
    hash[:interval] = io.read_uwyde
    hash[:prefer_blanking] = io.read_byte
    hash[:allow_exposures] = io.read_byte
    io.skip(18)
    hash
  end

  Alembic::Protocol.register_opcode nil, 108, :get_screen_saver

  Alembic::Constants::HOST_MODE_INSERT = 0
  Alembic::Constants::HOST_MODE_DELETE = 1

  Alembic::Constants::HOST_MODES = {
    0 => "INSERT",
    1 => "DELETE",
  }

  Alembic::Constants::FAMILY_INTERNET = 0
  Alembic::Constants::FAMILY_DE_CNET = 1
  Alembic::Constants::FAMILY_CHAOS = 2
  Alembic::Constants::FAMILY_SERVER_INTERPRETED = 5
  Alembic::Constants::FAMILY_INTERNET6 = 6

  Alembic::Constants::FAMILIES = {
    0 => "INTERNET",
    1 => "DE_CNET",
    2 => "CHAOS",
    5 => "SERVER_INTERPRETED",
    6 => "INTERNET6",
  }

  def change_hosts_async (mode, family, address_len, address)
    request do |io|
      io.write_ubyte(109)
      io.write("\0\0")
      io.write_ubyte(mode)
      io.write_ubyte(family)
      io.write("\0")
      io.write_uwyde(address_len)
      address.each do |item|
        io.write_byte(item)
      end
    end
  end
  
  def change_hosts (*args)
    change_hosts_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 109, :change_hosts

  def list_hosts_async ()
    request do |io|
      io.write_ubyte(110)
      io.write("\0\0")
      io.write("\0")
    end
    reply do |io|
      list_hosts_reply(io)
    end
  end
  
  def list_hosts (*args)
    list_hosts_async(*args).wait
  end
  
  def list_hosts_reply (io)
    hash = {}
    hash[:mode] = io.read_byte
    hash[:hosts_len] = io.read_uwyde
    io.skip(22)
    hash[:hosts] = hash[:hosts_len].times.map do
      {}.tap do |hash|
        hash[:family] = io.read_ubyte
        io.skip(1)
        hash[:address_len] = io.read_uwyde
        hash[:address] = hash[:address_len].times.map do
          io.read_byte
        end
      end
    end
    hash
  end

  Alembic::Protocol.register_opcode nil, 110, :list_hosts

  Alembic::Constants::ACCESS_CONTROL_DISABLE = 0
  Alembic::Constants::ACCESS_CONTROL_ENABLE = 1

  Alembic::Constants::ACCESS_CONTROLS = {
    0 => "DISABLE",
    1 => "ENABLE",
  }

  def set_access_control_async (mode)
    request do |io|
      io.write_ubyte(111)
      io.write("\0\0")
      io.write_ubyte(mode)
    end
  end
  
  def set_access_control (*args)
    set_access_control_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 111, :set_access_control

  Alembic::Constants::CLOSE_DOWN_DESTROY_ALL = 0
  Alembic::Constants::CLOSE_DOWN_RETAIN_PERMANENT = 1
  Alembic::Constants::CLOSE_DOWN_RETAIN_TEMPORARY = 2

  Alembic::Constants::CLOSE_DOWNS = {
    0 => "DESTROY_ALL",
    1 => "RETAIN_PERMANENT",
    2 => "RETAIN_TEMPORARY",
  }

  def set_close_down_mode_async (mode)
    request do |io|
      io.write_ubyte(112)
      io.write("\0\0")
      io.write_ubyte(mode)
    end
  end
  
  def set_close_down_mode (*args)
    set_close_down_mode_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 112, :set_close_down_mode

  Alembic::Constants::KILL_ALL_TEMPORARY = 0

  Alembic::Constants::KILLS = {
    0 => "ALL_TEMPORARY",
  }

  def kill_client_async (resource)
    request do |io|
      io.write_ubyte(113)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(resource)
    end
  end
  
  def kill_client (*args)
    kill_client_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 113, :kill_client

  def rotate_properties_async (window, atoms_len, delta, atoms)
    request do |io|
      io.write_ubyte(114)
      io.write("\0\0")
      io.write("\0")
      io.write_utetra(window)
      io.write_uwyde(atoms_len)
      io.write_wyde(delta)
      atoms.each do |item|
        io.write_utetra(item)
      end
    end
  end
  
  def rotate_properties (*args)
    rotate_properties_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 114, :rotate_properties

  Alembic::Constants::SCREEN_SAVER_RESET = 0
  Alembic::Constants::SCREEN_SAVER_ACTIVE = 1

  Alembic::Constants::SCREEN_SAVERS = {
    0 => "RESET",
    1 => "ACTIVE",
  }

  def force_screen_saver_async (mode)
    request do |io|
      io.write_ubyte(115)
      io.write("\0\0")
      io.write_ubyte(mode)
    end
  end
  
  def force_screen_saver (*args)
    force_screen_saver_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 115, :force_screen_saver

  Alembic::Constants::MAPPING_STATUS_SUCCESS = 0
  Alembic::Constants::MAPPING_STATUS_BUSY = 1
  Alembic::Constants::MAPPING_STATUS_FAILURE = 2

  Alembic::Constants::MAPPING_STATUSES = {
    0 => "SUCCESS",
    1 => "BUSY",
    2 => "FAILURE",
  }

  def set_pointer_mapping_async (map_len, map)
    request do |io|
      io.write_ubyte(116)
      io.write("\0\0")
      io.write_ubyte(map_len)
      map.each do |item|
        io.write_ubyte(item)
      end
    end
    reply do |io|
      set_pointer_mapping_reply(io)
    end
  end
  
  def set_pointer_mapping (*args)
    set_pointer_mapping_async(*args).wait
  end
  
  def set_pointer_mapping_reply (io)
    hash = {}
    hash[:status] = io.read_byte
    hash
  end

  Alembic::Protocol.register_opcode nil, 116, :set_pointer_mapping

  def get_pointer_mapping_async ()
    request do |io|
      io.write_ubyte(117)
      io.write("\0\0")
      io.write("\0")
    end
    reply do |io|
      get_pointer_mapping_reply(io)
    end
  end
  
  def get_pointer_mapping (*args)
    get_pointer_mapping_async(*args).wait
  end
  
  def get_pointer_mapping_reply (io)
    hash = {}
    hash[:map_len] = io.read_ubyte
    io.skip(24)
    hash[:map] = hash[:map_len].times.map do
      io.read_ubyte
    end
    hash
  end

  Alembic::Protocol.register_opcode nil, 117, :get_pointer_mapping

  Alembic::Constants::MAP_INDEX_SHIFT = 0
  Alembic::Constants::MAP_INDEX_LOCK = 1
  Alembic::Constants::MAP_INDEX_CONTROL = 2
  Alembic::Constants::MAP_INDEX_1 = 3
  Alembic::Constants::MAP_INDEX_2 = 4
  Alembic::Constants::MAP_INDEX_3 = 5
  Alembic::Constants::MAP_INDEX_4 = 6
  Alembic::Constants::MAP_INDEX_5 = 7

  Alembic::Constants::MAP_INDEXES = {
    0 => "SHIFT",
    1 => "LOCK",
    2 => "CONTROL",
    3 => "1",
    4 => "2",
    5 => "3",
    6 => "4",
    7 => "5",
  }

  def set_modifier_mapping_async (keycodes_per_modifier, keycodes)
    request do |io|
      io.write_ubyte(118)
      io.write("\0\0")
      io.write_ubyte(keycodes_per_modifier)
      keycodes.each do |item|
        io.write_ubyte(item)
      end
    end
    reply do |io|
      set_modifier_mapping_reply(io)
    end
  end
  
  def set_modifier_mapping (*args)
    set_modifier_mapping_async(*args).wait
  end
  
  def set_modifier_mapping_reply (io)
    hash = {}
    hash[:status] = io.read_byte
    hash
  end

  Alembic::Protocol.register_opcode nil, 118, :set_modifier_mapping

  def get_modifier_mapping_async ()
    request do |io|
      io.write_ubyte(119)
      io.write("\0\0")
      io.write("\0")
    end
    reply do |io|
      get_modifier_mapping_reply(io)
    end
  end
  
  def get_modifier_mapping (*args)
    get_modifier_mapping_async(*args).wait
  end
  
  def get_modifier_mapping_reply (io)
    hash = {}
    hash[:keycodes_per_modifier] = io.read_ubyte
    io.skip(24)
    hash[:keycodes] = hash[:keycodes_per_modifier].times.map do
      io.read_ubyte
    end
    hash
  end

  Alembic::Protocol.register_opcode nil, 119, :get_modifier_mapping

  def no_operation_async ()
    request do |io|
      io.write_ubyte(127)
      io.write("\0\0")
      io.write("\0")
    end
  end
  
  def no_operation (*args)
    no_operation_async(*args)
  end

  Alembic::Protocol.register_opcode nil, 127, :no_operation

  def read_setup (io)
    hash = {}
    hash[:status] = io.read_ubyte
    io.skip(1)
    hash[:protocol_major_version] = io.read_uwyde
    hash[:protocol_minor_version] = io.read_uwyde
    hash[:length] = io.read_uwyde
    hash[:release_number] = io.read_utetra
    hash[:resource_id_base] = io.read_utetra
    hash[:resource_id_mask] = io.read_utetra
    hash[:motion_buffer_size] = io.read_utetra
    hash[:vendor_len] = io.read_uwyde
    hash[:maximum_request_length] = io.read_uwyde
    hash[:roots_len] = io.read_ubyte
    hash[:pixmap_formats_len] = io.read_ubyte
    hash[:image_byte_order] = io.read_ubyte
    hash[:bitmap_format_bit_order] = io.read_ubyte
    hash[:bitmap_format_scanline_unit] = io.read_ubyte
    hash[:bitmap_format_scanline_pad] = io.read_ubyte
    hash[:min_keycode] = io.read_ubyte
    hash[:max_keycode] = io.read_ubyte
    io.skip(4)
    hash[:vendor] = io.read(hash[:vendor_len])
    hash[:pixmap_formats] = hash[:pixmap_formats_len].times.map do
      {}.tap do |hash|
        hash[:depth] = io.read_ubyte
        hash[:bits_per_pixel] = io.read_ubyte
        hash[:scanline_pad] = io.read_ubyte
        io.skip(5)
      end
    end
    hash[:roots] = hash[:roots_len].times.map do
      {}.tap do |hash|
        hash[:root] = io.read_utetra
        hash[:default_colormap] = io.read_utetra
        hash[:white_pixel] = io.read_utetra
        hash[:black_pixel] = io.read_utetra
        hash[:current_input_masks] = io.read_utetra
        hash[:width_in_pixels] = io.read_uwyde
        hash[:height_in_pixels] = io.read_uwyde
        hash[:width_in_millimeters] = io.read_uwyde
        hash[:height_in_millimeters] = io.read_uwyde
        hash[:min_installed_maps] = io.read_uwyde
        hash[:max_installed_maps] = io.read_uwyde
        hash[:root_visual] = io.read_utetra
        hash[:backing_stores] = io.read_byte
        hash[:save_unders] = io.read_bool
        hash[:root_depth] = io.read_ubyte
        hash[:allowed_depths_len] = io.read_ubyte
        hash[:allowed_depths] = hash[:allowed_depths_len].times.map do
          {}.tap do |hash|
            hash[:depth] = io.read_ubyte
            io.skip(1)
            hash[:visuals_len] = io.read_uwyde
            io.skip(4)
            hash[:visuals] = hash[:visuals_len].times.map do
              {}.tap do |hash|
                hash[:visual_id] = io.read_utetra
                hash[:class] = io.read_ubyte
                hash[:bits_per_rgb_value] = io.read_ubyte
                hash[:colormap_entries] = io.read_uwyde
                hash[:red_mask] = io.read_utetra
                hash[:green_mask] = io.read_utetra
                hash[:blue_mask] = io.read_utetra
                io.skip(4)
              end
            end
          end
        end
      end
    end
    hash
  end

end
