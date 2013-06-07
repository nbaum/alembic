module Alembic; end
module Alembic::Protocol; end
module Alembic::Protocol::Patches
  
  def get_keyboard_mapping_reply (io)
    hash = {}
    keysyms_per_keycode = io.read_byte
    length = (io.length - 24) / keysyms_per_keycode / 4
    io.skip(24)
    hash[:keysyms] = length.times.map do
      keysyms_per_keycode.times.map do
        io.read_utetra
      end
    end
    hash
  end
  
  def explode_attributes_hash hash, attributes
    bit = 1
    mask = 0
    values = []
    attributes.each do |key|
      if hash.has_key?(key)
        mask |= bit
        values << hash[key]
      end
      bit <<= 1
    end
    [mask, values]
  end
  
  def explode_window_attributes_hash hash
    explode_attributes_hash hash, %i(background_pixmap background_pixel border_pixmap border_pixel bit_gravity win_gravity backing_store backing_planes backing_pixel override_redirect save_under event_mask do_not_propogate_mask colormap cursor)
  end
  
  def create_window_async (depth, wid, parent, x, y, width, height, border_width, klass, visual, hash)
    super(depth, wid, parent, x, y, width, height, border_width, klass, visual, *explode_window_attributes_hash(hash))
  end
  
  def change_window_attributes_async (window, hash)
    super(window, *explode_window_attributes_hash(hash))
  end
  
  def configure_window_async (window, hash)
    super(window, *explode_attributes_hash(hash, %i(x y width height border_width sibling stack_mode)))
  end
  
  def open_font_async (fid, font)
    super(fid, font.length, font)
  end
  
  def intern_atom_async (only_if_exists = false, name)
    super(only_if_exists, name.length, name)
  end
  
  def intern_atom_reply (io)
    super(io)[:atom]
  end
  
  def change_property_async (mode, window, property, type, format, data)
    case format >> 3
    when 1
      super(mode, window, atomize(property), atomize(type), format, data.length, data.to_s)
    when 2
      data = Array(data)
      super(mode, window, atomize(property), atomize(type), format, data.length, data.pack("S*"))
    when 4
      data = Array(data)
      super(mode, window, atomize(property), atomize(type), format, data.length, data.pack("L*"))
    end
  end
  
  def atomize pseudoatom
    return pseudoatom if Integer === pseudoatom
    @atoms ||= {}
    @atoms[pseudoatom.to_s] ||= begin
      intern_atom(pseudoatom)
    end
  end
  
  def get_property_async (delete, window, property, type = 0, long_offset = 0, long_length = -1)
    super(delete, window, atomize(property), atomize(type), long_offset, long_length)
  end
  
  def get_property_reply (io)
    r = super(io)
    case r[:format] >> 3
    when 1
      r[:value] = r[:value][0, r[:value_len]]
    when 2
      r[:value] = r[:value][0, r[:value_len] * 2].unpack("S*")
    when 4
      r[:value] = r[:value][0, r[:value_len] * 4].unpack("L*")
    end
    r
  end
  
  def get_selection_owner_reply (io)
    super(io)[:owner]
  end
  
  def query_extension (name)
    super(name.length, name)
  end
  
  def extension name
    @extensions ||= {}
    @extensions[name] ||= begin
      query_extension(name)[:major_opcode]
    end
  end
  
  def xinerama_query_screens_reply (io)
    r = super(io)
    if r[:number == 0]
      {
        :number => 1,
        :screen_info => [
          :x_org => 0,
          :y_org => 0,
          :width => @data[:roots][0][:width_in_pixels],
          :height => @data[:roots][0][:width_in_pixels],
        ]
      }
    else
      r
    end
  end
  
end

