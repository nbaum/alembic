
%w"atom colormap cursor display drawable font fontable gcontext painting pixmap resource window".each do |name|
  require "alembic/classes/#{name}"
end

