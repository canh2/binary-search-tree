require_relative './Tree.rb'
tree = Tree.new
puts "hello"
tree.build_tree([2,7,4,2,9,1,0,12,43])
tree.pretty_print
tree.insert(-4)
tree.insert(100)
tree.pretty_print
