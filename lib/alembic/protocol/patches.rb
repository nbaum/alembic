module Alembic; end
module Alembic::Protocol; end
module Alembic::Protocol::Patches
  
  def intern_atom_async (only_if_exists = false, name)
    super(only_if_exists, name.length, name)
  end
  
  def intern_atom_reply (io)
    super(io)[:atom]
  end
  
  def change_property_async (mode, window, property, type, format, data)
    data_len = data.length / (format >> 3)
    super(mode, window, property, type, format, data_len, data)
  end
  
  def get_property_async (delete, window, property, type = 8, long_offset = 0, long_length = 0)
    super(delete, window, property, type, long_offset, long_length)
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

