# Alembic

A pack/unpack alternative.

Alembic is an alternative to Ruby's standard Array#pack and String#unpack
methods. It offers an overlapping featureset, but does not provide everything
that pack/unpack offers.

The Alembic.condense method corresponds to Array#pack, whilst Alembic.vaporise
corresponds to Array#unpack. Vaporisation is the opposite of condensation, and
an alembic is a device used to condense gases into liquids.

Alembic uses the native endianness of your compiler.

## Use Case

Alembic was designed specifically for {en,de}coding the X11 protocol.

## Condensing Syntax

    Syntax  Argument  Encoding
    C       Number    Unsigned 8-bit integer
    c       Number    Signed 8-bit integer
    S       Number    Unsigned 16-bit integer
    s       Number    Signed 16-bit integer
    L       Number    Unsigned 32-bit integer
    l       Number    Signed 32-bit integer
    a       String    Byte sequence
    A       String    Byte sequence with a one-byte length prefix
    pN      None      N-byte long sequence of an arbitrary character
    [..]    Array     Apply the syntax inside the brackets to the argument until
                      there are no arguments left

### Example
    
    Alembic.condense("L[1CS]", 2, [1, 2, 3, 4])
    => "\2\0\0\0\1\2\0\3\4\0"

## Vaporising Syntax
  
    Syntax  Result    Meaning
    C       Number    Unsigned 8-bit integer
    c       Number    Signed 8-bit integer
    S       Number    Unsigned 16-bit integer
    s       Number    Signed 16-bit integer
    L       Number    Unsigned 32-bit integer
    l       Number    Signed 32-bit integer
    aN      String    Byte sequence, length determined by the Nth value decoded
                      so far
    A       String    Byte sequence with a one-byte length prefix
    pN      None      N-byte long sequence of an arbitrary character
    [N..]   Array     Apply the syntax inside the brackets M times, where M is
                      the integer value of the Nth value decoded so far
    {..}    Hash      Apply the syntax inside the brackets once, storing the
                      result in a hash.
    (..)    None      An embedded comment
    <..>    None      Specifies the key the next decoded element will be stored
                      under in a hash.
    N       None      Digits are ignored. This is to enable numbering elements
                      in a specification for [] references.
  
  Whitespace is ignored.
  
  The syntax allows very compact specifications, and also highly verbose
  specifications with inline documentation.
  
  Here is a specification for the "additional data" of an X11 server connection
  response.
  
         1  L                (release number)
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
             }]

  The above specification produces the same result as the far more compact:
  
        L<xid_base>L<xid_mask>LLSSCCCCCCCCp4a5p[8{CCCp5}]<screens>[7{<root>LL
        <white>L<black>LL<width>S<height>SSSSSLCCCC[16{Cp1Sp4[2{LCCSLLLp4}]}]}]

### Example

    Alembic.vaporise("L[1CS]", "\2\0\0\0\1\2\0\3\4\0")
    => [2, [1, 2, 3, 4]]

