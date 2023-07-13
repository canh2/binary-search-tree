require_relative './Tree.rb'
tree = Tree.new
array=Array.new(15) { rand(1..100) }
tree.build_tree(array)
tree.pretty_print
if tree.balanced? == true
   puts "this tree is balanced"
else
   puts "this tree is not balanced"
end
tree.level_order
tree.inorder_traversal 
tree.preorder_traversal 
tree.postorder_traversal 
tree.insert(100)
tree.insert(200)
tree.insert(300)
tree.insert(400)

tree.pretty_print
if tree.balanced? == true
    puts "this tree is balanced"
 else
    puts "this tree is not balanced"
 end
 tree.rebalance
 tree.pretty_print
 if tree.balanced? == true
    puts "this tree is balanced"
 else
    puts "this tree is not balanced"
 end
 tree.level_order
tree.inorder_traversal 
tree.preorder_traversal 
tree.postorder_traversal 
# tree.build_tree([2,7,4,2,9,1,0,17,43])
# tree.pretty_print
# tree.insert(-4)
# tree.insert(100)
# tree.insert(8)
# tree.insert(13)
# tree.insert(15)
# tree.insert(11)
# tree.insert(12)
# tree.insert(10)
# tree.pretty_print
# tree.delete(13)
# tree.pretty_print
# tree.delete(12)
# tree.pretty_print
# tree.delete(17)
# tree.pretty_print
# tree.find(20054)
# tree.level_order
# tree.inorder_traversal 
# tree.preorder_traversal 
# tree.postorder_traversal 
# tree.depth(11)
# tree.height(9)
# if tree.balanced? == true
#    puts "this tree is balanced"
# else
#    puts "this tree is not balanced"
# end
# # tree.delete(43)
# # tree.delete(100)
# # tree.pretty_print
# # puts tree.balanced?
# tree.rebalance
# tree.pretty_print
# if tree.balanced? == true
#     puts "this tree is balanced"
#  else
#     puts "this tree is not balanced"
#  end