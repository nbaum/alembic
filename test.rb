
require 'awesome_print'
require 'alembic'

include Alembic::Constants

c = Alembic::Connection.new

p c.query_extension("XINERAMA")
ap c.data
p c.xinerama_query_screens

w = c.genxid
c.change_window_attributes(c.roots[0], CW_EVENT_MASK, [EVENT_MASK_SUBSTRUCTURE_NOTIFY])
c.create_window(0, w, c.roots[0], 100, 100, 200, 200, 1, 0, 0, 0, [])
ap c.get_window_attributes(w)
ap c.get_geometry(w)
#ap c.query_tree(c.roots[0])
#atom = c.intern_atom("HELLO")
#ap c.get_atom_name(atom)
#c.change_property(0, w, atom, atom, 8, "HELP")
#ap c.get_property(false, w, atom)
#ap c.list_properties(w)
#c.set_selection_owner(w, 1, 0)
#ap c.get_selection_owner(1)
#ap c.query_pointer(w)
#ap c.get_motion_events(w, 1, 0)
#ap c.translate_coordinates(c.roots[0], w, 0, 0);
#c.do_events(true)

