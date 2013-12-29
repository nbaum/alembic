
module Alembic
  module ValueParamHelper
    def value_param (hash)
      mask = 0
      values = []
      each do |name, mask0|
        if hash.has_key?(name)
          mask |= mask0
          value = hash[name]
          value = ({ true => 1, false => 0 }[value] || value)
          values << value
        end
      end
      [mask, values]
    end
  end
end

