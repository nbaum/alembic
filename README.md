![Alembic](https://raw.github.com/nbaum/alembic/gh-pages/logo.png)

Alembic is a pure Ruby implementation of X11, based on bindings automatically generated from the XCB project's XML protocol definitions.

It is designed for implementing a Window Manager, and may not be useful for anything, or even for that.

Using
==

Having made sure Alembic is on Ruby's library search path...

```ruby
require 'alembic/connection'
conn = Alembic::Connection.new
conn.query_tree(conn.setup.roots[0].root)
```

Instances of `Alembic::Connection` contain methods for X11 requests. The interface is not very much like Xlib, but is very similar to XCB, except that length arguments for array parameters are ommitted, since Ruby always know how long an array is.

You might find the [XCB manual](http://xcb.freedesktop.org/manual/) useful.

To allocate an X resource, invoke `alloc_<type>`. e.g. For a Window invoke `alloc_window`.

Operations are synchronous by default. All operations have an asynchronous variant named with a trailing exclamation mark. These methods return a `Ticket` which can be waited on using their `wait` method.

You can turn a hash into a `value_mask, value_list` parameter for operations such as *CreateWindow* by calling the `params` method on the enum hash.

```ruby
conn.create_window(0, alloc_window, root, 0, 0, 100, 100, 1, 0, *CW.params(override_redirect: true))
```

Extension methods are prefixed with their extension's name. You must `query_extension` an extension before its methods will be available.

```ruby
conn.randr_get_screen_resources(root) #=> error, no such method
conn.query_extension("RANDR")
conn.randr_get_screen_resources(root) #=> okay, method now defined
```

Building bindings
==

The X11 protocol is implemented in Ruby source generated from the XML bindings. You can generate the bindings required by running

```
ruby -Ilib build.rb
```

You can build bindings for other extensions by modifying that file. Not all extensions can be built. None of them are fully tested

