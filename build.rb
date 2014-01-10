$: << "lib"

require 'alembic/generator'

Alembic::Generator.compile "xproto"
Alembic::Generator.compile "randr"
Alembic::Generator.compile "render"
#Alembic::Generator.compile "composite"
Alembic::Generator.compile "xfixes"
#Alembic::Generator.compile "shape"

