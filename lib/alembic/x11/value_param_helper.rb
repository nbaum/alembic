
module Alembic
  module ValueParamHelper
    def param (hash)
      mask = 0
      values = []
      each do |name, mask0|
        if hash.has_key?(name)
          mask |= mask0
          values << hash[name].to_i
        end
      end
      [mask, *values]
    end
  end
end

