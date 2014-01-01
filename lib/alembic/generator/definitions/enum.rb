
module Alembic
  module Generator
    class Enum < Element
      
      attr_accessor :name, :values, :bits
      
      def add_nodes (nodes)
        @values = {}
        @bits = {}
        nodes.each do |node|
          next unless node.name == 'item'
          value = node.nodes[0]
          value = case value.name
          when 'value'
            value.text.to_i
          when 'bit'
            @bits[node['name'].snake_case.to_sym] = 1 << value.text.to_i
            1 << value.text.to_i
          end
          @values[node['name'].snake_case.to_sym] = value
        end
      end
      
      def compile_comments
        [
        ]
      end
      
      def compile_constants
        [
          "#{var_name.snake_case.upcase} = #{values.inspect}",
          "#{var_name.snake_case.upcase}_I = #{values.invert.inspect}",
          nil,
          *values.map do |name, value|
            const_name = "#{var_name}_#{name}".snake_case.upcase
            "#{const_name} = #{value}"
          end,
          nil
        ]
      end
      
    end
  end
end

