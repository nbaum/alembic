require 'alembic/connection'

d = Alembic::Connection.new

p d.setup.roots[0].root.query_tree

