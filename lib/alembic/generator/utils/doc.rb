
module Alembic
  module Generator
    class Doc < Element
      
      attr_accessor :description, :fields
      
      def add_nodes (nodes)
        @fields = {}
        nodes.each do |node|
          case node.name
          when "description"
            @description = node.nodes.map(&:value).join.strip
          when "brief"
            @description ||= node.text
          when "field"
            @fields[node['name']] = node.nodes.map(&:value).join.strip
          else
            p node.name
          end
        end
      end
      
    end
  end
end

