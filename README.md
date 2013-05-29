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
    aN      String    Same as above
    A       String    Byte sequence with a one-byte length prefix
    pN      None      N-byte long sequence of an arbitrary character
    [..]    Array     Apply the syntax inside the brackets to the argument until
                      there are no arguments left
    [N..]   Array     Same as above

    The [N..] syntax exists to allow the same specification string to be used
    for condensing and vaporising

### Example
    
    Alembic.condense("L[1CS]", 2, [1, 2, 3, 4])
    => "\2\0\0\0\1\2\0\3\4\0"

## Vaporising Syntax

    Syntax  Argument  Encoding
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
    [..]    Array     Apply the syntax inside the brackets once

### Example

    Alembic.vaporise("L[1CS]", "\2\0\0\0\1\2\0\3\4\0")
    => [2, [1, 2, 3, 4]]

