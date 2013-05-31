require 'alembic'
require 'socket'
require 'awesome_print'

class Connection
  
  class Error < Exception
    def initialize value
      super("Error with value 0x%08x" % [value])
    end
  end
  
  RequestError = Class.new(Error)
  ValueError = Class.new(Error)
  WindowError = Class.new(Error)
  PixmapError = Class.new(Error)
  AtomError = Class.new(Error)
  CursorError = Class.new(Error)
  FontError = Class.new(Error)
  MatchError = Class.new(Error)
  DrawableError = Class.new(Error)
  AccessError = Class.new(Error)
  AllocError = Class.new(Error)
  ColormapError = Class.new(Error)
  GContextError = Class.new(Error)
  IDChoiceError = Class.new(Error)
  NameError = Class.new(Error)
  LengthError = Class.new(Error)
  ImplementationError = Class.new(Error)
  
  ERRORS =  [nil, RequestError, ValueError, WindowError, PixmapError, AtomError,
             CursorError, FontError, MatchError, DrawableError, AccessError, 
             AllocError, ColormapError, GContextError, IDChoiceError, 
             NameError, LengthError, ImplementationError]
  
  MAGIC = 0x426C
  
  attr_accessor :roots
  
  def enc fmt, *args
    Alembic.condense(fmt, *args)
  end
  
  def dec fmt, str
    Alembic.vaporise(fmt, str, false)
  end
  
  def hdec fmt, str
    Alembic.vaporise(fmt, str, true)
  end
  
  def read (*args)
    @socket.read(*args)
  end
  
  def write (*args)
    @socket.write(*args)
  end
  
  def initialize display = ":0"
    secret = `xauth list #{display}`.split[2]
    @socket = TCPSocket.new('localhost', 6001)
    write enc("SSSSSp2apap", MAGIC, 11, 0, 18, secret.length, "MIT-MAGIC-COOKIE-1", secret)
    result, maj, min, len = dec("Cp1SSS", read(8))
    @hash = hdec("1  L                (release number)
             2  <xid_base>L      (resource-id-base)
             3  <xid_mask>L      (resource-id-mask)
             4  L                (motion-buffer-size)
             5  S                (length of vendor)
             6  S                (maximum-request-length)
             7  C                (number of roots)
             8  C                (number of formats)
             9  C                (image-byte-order)
             10 C                (bitmap-format-byte-order)
             11 C                (bitmap-format-scanline-unit)
             12 C                (bitmap-format-scanline-pad)
             13 C                (min-keycode)
             14 C                (max-keycode)
                p4               (unused)
             15 a5               (vendor)
                p                (unused)
             17 [8{              (pixmap-formats)
                  1 C            (depth)
                  2 C            (bits-per-pixel)
                  3 C            (scanline-pad)
                    p5           (unused)
                }]
             18 <screens>[7{     (roots)
                  1  <root>L     (root)
                  2  L           (default-colormap)
                  3  <white>L    (white-pixel)
                  4  <black>L    (black-pixel)
                  5  L           (current-input-mask)
                  6  <width>S    (width-in-pixels)
                  7  <height>S   (height-in-pixels)
                  8  S           (width-in-mm)
                  9  S           (height-in-mm)
                  10 S           (min-installed-maps)
                  11 S           (max-installed-maps)
                  12 L           (root-visual)
                  13 C           (backing-stores)
                  14 C           (save-unders)
                  15 C           (root-depth)
                  16 C           (number of allowed depths)
                  17 [16{        (allowed-depths)
                       1 C       (depth)
                         p1
                       2 S       (number of visuals)
                         p4
                       3 [2{     (visuals)
                            1 L  (visual-id)
                            2 C  (class)
                            3 C  (bits-per-rgb-value)
                            4 S  (colormap-entries)
                            5 L  (red-mask)
                            6 L  (green-mask)
                            7 L  (blue-mask)
                              p4
                         }]
                     }]
                 }]", read(len * 4))
    @xid_mask = @hash["xid_mask"]
    @xid_base = @hash["xid_base"]
    @roots = @hash["screens"].map{|s|s["root"]}
  end
  
  def genxid
    @xid ||= 0
    xid = @xid * (@xid_mask & -@xid_mask) | @xid_base
    @xid += 1
    xid
  end
  
  def req fmt, *args
    r = enc fmt, *args
    r << "\0" * (-r.length & 3)
    r[2, 2] = [r.length / 4].pack("S")
    write r
    nil
  end
  
  def raw_reply (block = true)
    while
      c = block ? read(1) : read_nonblock(1)
      return unless c
      case c.ord
      when 0
        code, seq, datum, _, opcode = dec "CSLSCp21", read(31)
        raise ERRORS[code], datum
      when 1
        extra, seq, len = dec "CSL", read(7)
        return extra.chr + read(len * 4 + 24)
      else
        @events ||= []
        @events << read(31)
      end
    end
  end
  
  def reply fmt
    hdec fmt, raw_reply
  end
  
  require 'api'
  
  include GeneratedAPI
  
  def intern_atom (only_if_exists = false, name)
    super(only_if_exists, name.length, name)["atom"]
  end

  def change_property (mode, window, property, type, format, data)
    data_len = data.length / (format >> 3)
    super mode, window, property, type, format, data_len, data
  end
  
  def get_property (delete, window, property, type = 0, long_offset = 0, long_length = -1)
    super delete, window, property, type, long_offset, long_length
  end
  
end

c = Connection.new
w = c.genxid
c.create_window 0, w, c.roots[0], 100, 100, 200, 200, 1, 0, 0, 0, []
c.change_window_attributes w, 0x100, [1]
c.get_window_attributes w
c.get_geometry w
c.query_tree c.roots[0]
atom = c.intern_atom("HELLO")
c.get_atom_name(atom)
c.change_property(0, w, atom, atom, 8, "HELP")
ap c.get_property(false, w, atom)
ap c.list_properties(w)
ap c.set_selection_owner(w, 1, 0)
ap c.get_selection_owner(1)
ap c.query_pointer(w)
ap c.get_motion_events(w, 1, 0)
ap c.translate_coordinates(c.roots[0], w, 0, 0);

