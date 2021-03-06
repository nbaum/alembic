
module Alembic
  module Generator
    class Element
      
      attr_accessor :extension, :doc
      
      def format_help (str)
        return [] if !str
        str.split("\n").map do |line|
          "# #{line}"
        end
      end
      
      def initialize (extension, node, attrs = {})
        @extension = extension
        parse(node, attrs)
      end
      
      def const_name
        name
      end
      
      def class_name
        "#{extension.extension_name}#{name.snake_case.to_const_string}"
      end
      
      def var_name
        "#{extension.prefix}#{name}"
      end
      
      def parse (node, attrs = {})
        if node
          node.attributes.each do |name, value|
            __send__("#{name.to_s.gsub("-", "_")}=", value)
          end
        end
        attrs.each do |name, value|
          __send__("#{name.to_s.gsub("-", "_")}=", value)
        end
        return unless node
        unless (children = node.locate("^Element")).empty?
          add_nodes children
        end
        self.text = node.text if node.text
      end
      
      def add_nodes (nodes)
        nodes = nodes.map do |node|
          klass = extension.element_class(node)
          case klass
          when false
          when nil
            puts node
            raise "No element class for `#{node.name}'"
          else
            klass.new(extension, node).post_process
          end
        end.compact
        add(*nodes)
      end
      
      def post_post_process
        nil
      end
      
      def post_process
        self
      end
      
      def packable? at_end = false
        false
      end
      
      def unpackable? at_end = false
        false
      end
      
      def lengther
        []
      end
      
      def compile_comments
        []
      end
      
      def compile_constants
        []
      end
      
      def compile_methods
        []
      end
      
      def hides
        []
      end
      
      def lookup name
        extension.lookup(name) || raise(name.inspect)
      end
      
    end
  end
end

