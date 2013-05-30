#include <ruby.h>
#include <ctype.h>

static VALUE shift (VALUE array) {
  if (RARRAY_LEN(array) == 0) rb_raise(rb_eArgError, "Too few arguments");
  return rb_funcall(array, rb_intern("shift"), 0);
}

static char *find_ending_bracket (char *fmt) {
  int c = 0;
  while (*fmt) {
    switch (*fmt++) {
    case '[':
    case '{':
      c++;
      break;
    case ']':
    case '}':
      if (0 == c--)
        return fmt;
      break;
    }
  }
  return fmt;
}

static char *do_condense (char *fmt, VALUE dest, VALUE array) {
  VALUE val;
  char *nfmt;
  signed char c;
  signed int l;
  signed short s;
  unsigned char C;
  unsigned int L;
  unsigned short S;
  int num;
  for (; *fmt; ) {
    switch (*fmt++) {
      #define PACKER(c,k) \
        case c: \
          val = shift(array); \
          k = NUM2INT(val); \
          rb_str_cat(dest, (char *) &k, sizeof(k)); \
          break
      PACKER('C', C);
      PACKER('c', c);
      PACKER('S', S);
      PACKER('s', s);
      PACKER('L', L);
      PACKER('l', l);
      case 'p':
        num = strtol(fmt, &fmt, 10);
        if (num == 0)
          num = -RSTRING_LEN(dest) & 3;
        {
          char pad[num];
          memset(pad, 0x42, num);
          rb_str_cat(dest, pad, num);
        }
        break;
      case 'a':
        num = strtol(fmt, &fmt, 10);
        val = shift(array);
        val = rb_funcall(val, rb_intern("to_s"), 0);
        //Check_Type(val, T_STRING);
        rb_str_append(dest, val);
        break;
      case 'A':
        val = shift(array);
        val = rb_funcall(val, rb_intern("to_s"), 0);
        //Check_Type(val, T_STRING);
        c = RSTRING_LEN(val);
        rb_str_cat(dest, (char *) &c, 1);
        rb_str_append(dest, val);
        break;
      case ']':
        return fmt;
      case '[':
        num = strtol(fmt, &fmt, 10);
        val = shift(array);
        Check_Type(val, T_ARRAY);
        nfmt = fmt;
        while (RARRAY_LEN(val) > 0) {
          nfmt = do_condense(fmt, dest, val);
        }
        fmt = find_ending_bracket(fmt);
        break;
    }
  }
  return fmt;
}

VALUE condense (VALUE self, VALUE array) {
  VALUE dest;
  VALUE format = rb_ary_shift(array);
  dest = rb_str_new("", 0);
  array = rb_funcall(array, rb_intern("dup"), 0);
  char *fmtstr = rb_string_value_cstr(&format);
  do_condense(fmtstr, dest, array);
  return dest;
}

static char *do_vaporise (char *fmt, char *&str, unsigned int &idx,
                          unsigned int &len, VALUE array, VALUE hash)
{
  VALUE subarray, subarray2, subhash;
  char *nfmt;
  signed char c;
  signed int l;
  signed short s;
  unsigned char C;
  unsigned int L;
  unsigned short S;
  char name[strlen(fmt) + 1], *np;
  int num;
  name[0] = '\0';
  for (; *fmt; ) {
    switch (*fmt++) {
      #define STORE2(val1, val2) \
        rb_ary_push(array, val1); \
        if (hash) { \
          if (TYPE(hash) == T_HASH && *name) { \
            rb_str_new2(name); \
            rb_hash_aset(hash, rb_str_new2(name), val2); \
            name[0] = '\0'; \
          } else if (TYPE(hash) == T_ARRAY) { \
            rb_ary_push(hash, val2); \
          } \
        }
      #define STORE(val) STORE2(val, val)
      #define UNPACKER(c,k) \
        case c: \
          num = sizeof(k); \
          if (num > len) break;\
          k = *(typeof(k) *) str; \
          STORE(LONG2NUM(k)); \
          break
      UNPACKER('C', C);
      UNPACKER('c', c);
      UNPACKER('S', S);
      UNPACKER('s', s);
      UNPACKER('L', L);
      UNPACKER('l', l);
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
        while (isdigit(*fmt))
          fmt++;
        num = 0;
        break;
      case 'p':
        num = strtol(fmt, &fmt, 10);
        if (num == 0) num = -len & 3;
        if (num > len) break;
        break;
      case 'a':
        num = strtol(fmt, &fmt, 10);
        num = NUM2INT(rb_ary_entry(array, num - 1));
        if (num > len) break;
        STORE(rb_str_new(str, num));
        break;
      case '(':
        while (*fmt && *fmt != ')')
          fmt++;
        num = 0;
        break;
      case '<':
        num = 0;
        np = name;
        while (*fmt && *fmt != '>')
          *np++ = *fmt++;
        *np++ = '\0';
        fmt++;
        break;
      case ']':
        return fmt;
      case '[':
        num = strtol(fmt, &fmt, 10);
        num = NUM2INT(rb_ary_entry(array, num - 1));
        subarray = rb_ary_new();
        subarray2 = rb_ary_new();
        for (int i = 0; i < num; ++i) {
          do_vaporise(fmt, str, idx, len, subarray, subarray2);
        }
        STORE2(subarray, subarray2);
        fmt = find_ending_bracket(fmt);
        num = 0;
        break;
      case '}':
        return fmt;
      case '{':
        subarray = rb_ary_new();
        subhash = rb_hash_new();
        do_vaporise(fmt, str, idx, len, subarray, subhash);
        STORE2(subarray, subhash);
        fmt = find_ending_bracket(fmt);
        num = 0;
        break;
      default:
        num = 0;
        break;
    }
    str += num;
    idx += num;
    len -= num;
  }
  return fmt;
}

VALUE vaporise (VALUE self, VALUE format, VALUE string, VALUE use_hash) {
  VALUE array, hash;
  char *str;
  Check_Type(string, T_STRING);
  str = RSTRING_PTR(string);
  array = rb_ary_new();
  hash = rb_hash_new();
  char *fmt = rb_string_value_cstr(&format);
  unsigned int idx = 0, len = RSTRING_LEN(string);
  do_vaporise(fmt, str, idx, len, array, hash);
  return use_hash ? hash : array;
}

VALUE mAlembic;

extern "C" void Init_alembic () {
  mAlembic = rb_define_module("Alembic");
  rb_define_singleton_method(mAlembic, "condense", (VALUE(*)(...)) condense, -2);
  rb_define_singleton_method(mAlembic, "vaporise", (VALUE(*)(...)) vaporise, 3);
  rb_define_singleton_method(mAlembic, "vaporize", (VALUE(*)(...)) vaporise, 3);
}

