require 'alembic'
 
c = Alembic::Connection.new
s = c.setup
r = s.roots[0].root

r.query_tree.children.each do |w|
  #p w.get_window_attributes
  #p w.get_geometry
  w.list_properties.each do |a|
    p a.get_atom_name
    prop = w.get_property(false, a, 0, 0, 40)
    p prop.type.get_atom_name
  end
end

#include Alembic::Enumerants

#ATOM_CLIPBOARD = c.intern_atom(true, "CLIPBOARD").atom
#p c.get_selection_owner(ATOM_PRIMARY)
#p c.get_selection_owner(ATOM_SECONDARY)
#p c.get_selection_owner(ATOM_CLIPBOARD)

