module Alembic; end
module Alembic::Protocol; end
module Alembic::Protocol::Xinerama

  def xinerama_query_version_async (major, minor)
    request do |io|
      io.write_ubyte(extension("XINERAMA"))
      io.write_ubyte(0)
      io.write("\u0000\u0000")
      io.write_ubyte(major)
      io.write_ubyte(minor)
      reply do |io|
        xinerama_query_version_reply(io)
      end
    end
  end
  
  def xinerama_query_version (*args)
    xinerama_query_version_async(*args).wait
  end
  
  def xinerama_query_version_reply (io)
    hash = {}
    io.skip(1)
    hash[:major] = io.read_uwyde
    hash[:minor] = io.read_uwyde
    hash
  end

  Alembic::Protocol.register_opcode "XINERAMA", 0, :xinerama_query_version

  def xinerama_get_state_async (window)
    request do |io|
      io.write_ubyte(extension("XINERAMA"))
      io.write_ubyte(1)
      io.write("\u0000\u0000")
      io.write_utetra(window)
      reply do |io|
        xinerama_get_state_reply(io)
      end
    end
  end
  
  def xinerama_get_state (*args)
    xinerama_get_state_async(*args).wait
  end
  
  def xinerama_get_state_reply (io)
    hash = {}
    hash[:state] = io.read_byte
    hash[:window] = io.read_utetra
    hash
  end

  Alembic::Protocol.register_opcode "XINERAMA", 1, :xinerama_get_state

  def xinerama_get_screen_count_async (window)
    request do |io|
      io.write_ubyte(extension("XINERAMA"))
      io.write_ubyte(2)
      io.write("\u0000\u0000")
      io.write_utetra(window)
      reply do |io|
        xinerama_get_screen_count_reply(io)
      end
    end
  end
  
  def xinerama_get_screen_count (*args)
    xinerama_get_screen_count_async(*args).wait
  end
  
  def xinerama_get_screen_count_reply (io)
    hash = {}
    hash[:screen_count] = io.read_byte
    hash[:window] = io.read_utetra
    hash
  end

  Alembic::Protocol.register_opcode "XINERAMA", 2, :xinerama_get_screen_count

  def xinerama_get_screen_size_async (window, screen)
    request do |io|
      io.write_ubyte(extension("XINERAMA"))
      io.write_ubyte(3)
      io.write("\u0000\u0000")
      io.write_utetra(window)
      io.write_utetra(screen)
      reply do |io|
        xinerama_get_screen_size_reply(io)
      end
    end
  end
  
  def xinerama_get_screen_size (*args)
    xinerama_get_screen_size_async(*args).wait
  end
  
  def xinerama_get_screen_size_reply (io)
    hash = {}
    io.skip(1)
    hash[:width] = io.read_utetra
    hash[:height] = io.read_utetra
    hash[:window] = io.read_utetra
    hash[:screen] = io.read_utetra
    hash
  end

  Alembic::Protocol.register_opcode "XINERAMA", 3, :xinerama_get_screen_size

  def xinerama_is_active_async ()
    request do |io|
      io.write_ubyte(extension("XINERAMA"))
      io.write_ubyte(4)
      io.write("\u0000\u0000")
      reply do |io|
        xinerama_is_active_reply(io)
      end
    end
  end
  
  def xinerama_is_active (*args)
    xinerama_is_active_async(*args).wait
  end
  
  def xinerama_is_active_reply (io)
    hash = {}
    io.skip(1)
    hash[:state] = io.read_utetra
    hash
  end

  Alembic::Protocol.register_opcode "XINERAMA", 4, :xinerama_is_active

  def xinerama_query_screens_async ()
    request do |io|
      io.write_ubyte(extension("XINERAMA"))
      io.write_ubyte(5)
      io.write("\u0000\u0000")
      reply do |io|
        xinerama_query_screens_reply(io)
      end
    end
  end
  
  def xinerama_query_screens (*args)
    xinerama_query_screens_async(*args).wait
  end
  
  def xinerama_query_screens_reply (io)
    hash = {}
    io.skip(1)
    hash[:number] = io.read_utetra
    io.skip(20)
    hash[:screen_info] = hash[:number].times.map do
      {}.tap do |hash|
        hash[:x_org] = io.read_wyde
        hash[:y_org] = io.read_wyde
        hash[:width] = io.read_uwyde
        hash[:height] = io.read_uwyde
      end
    end
    hash
  end

  Alembic::Protocol.register_opcode "XINERAMA", 5, :xinerama_query_screens

end
