require 'alembic'
require 'socket'
require 'awesome_print'

class Connection
  
  MAGIC = 0x426C
  
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
    ap hdec("1  L                (release number)
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
  end
  
  def create_window (wid, parent, x, y, width, height, border_width, klass,
                     visual, value_mask, value_list)
    
  end
  
end

c = Connection.new

