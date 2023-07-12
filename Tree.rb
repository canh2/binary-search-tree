require_relative './Node.rb'
class Tree
    def initialize
        @root = nil
    end
   def build_tree(array)
    array = array.uniq 
    @root = Node.new(array.shift)
    array.each do |value|
        current = @root
        while current.get_left!=nil && current.get_right!=nil
           if value > current.get_data
            current = current.get_right
            else
                current = current.get_left
            end
        end
        while  current.get_right!=nil && value>=current.get_data
            current = current.get_right
        end
        while current.get_left!=nil && value<current.get_data
           current = current.get_left
        end 
        if value > current.get_data
        current.set_right(Node.new(value))
        else
            current.set_left(Node.new(value))
        end
    end
end

    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.get_right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.get_right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.get_data}"
        pretty_print(node.get_left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.get_left
      end
end