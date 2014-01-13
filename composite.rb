$: << "lib"

require 'alembic/with_accessors'
require 'alembic/errors'
require 'alembic/resource'
require 'alembic/connection'
require 'alembic/reactor'
require 'pp'

using HashAccessors
include Alembic::Extensions::Xproto
include Alembic::Extensions::Composite
include Alembic::Extensions::Render

d = Alembic::Reactor.new
c = d.connection

root = c.setup.roots[0].root
win = 0x1a0000d

c.load_extension("Composite")
c.load_extension("RENDER")

c.composite_redirect_window(win, COMPOSITE_REDIRECT_MANUAL)

geom = c.get_geometry(win)
parent = c.query_tree(win).parent
geom2 = c.get_geometry(parent)

width = geom.width
height = geom.height

#c.load_extension("RENDER")

pf1 = c.render_query_pict_formats.formats.each do |f|
  next unless f.depth == geom.depth
  break f.id
end

pf2 = c.render_query_pict_formats.formats.each do |f|
  next unless f.depth == geom2.depth
  break f.id
end

c.render_create_picture(p1 = c.make_resource(RenderPicture), win, pf1, 0)
c.render_create_picture(p2 = c.make_resource(RenderPicture), parent, pf2, 0)
c.render_create_solid_fill(p3 = c.make_resource(RenderPicture), [0, 0, 0, 0xFFFF/2])
c.render_create_solid_fill(p4 = c.make_resource(RenderPicture), [0, 0, 0, 0xFFFF])

c.render_composite(RENDER_PICT_OP_SRC, p1, nil, p2, 0, 0, 0, 0, geom.x, geom.y, width, height)
c.render_composite(RENDER_PICT_OP_OVER, p3, nil, p2, 0, 0, 0, 0, geom.x, geom.y, width, height)
c.render_composite(RENDER_PICT_OP_HSL_SATURATION, p4, nil, p2, 0, 0, 0, 0, geom.x, geom.y, width, height)

d.run
#op, src, mask, dst, src_x, src_y, mask_x, mask_y, dst_x, dst_y, width, height

