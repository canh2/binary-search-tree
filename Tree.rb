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
def insert(value)
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
def delete(value)
    puts "Deleting #{value}..."
    current = @root
    prev =@root
     while current.get_left!=nil && current.get_right!=nil
        if value == current.get_data
            break
        end
        if value > current.get_data
            prev = current
            current = current.get_right
            else 
                prev = current
                current = current.get_left
        end
   end
   if current.get_data !=value

    while current.get_left!=nil && value!=current.get_data && value<current.get_data
            prev=current
        current = current.get_left
     end
    \
     while current.get_right!=nil && value!=current.get_data && value >current.get_data
        prev = current
          current = current.get_right
     end
    end
    if current.get_left == nil && current.get_right == nil
        if value > prev.get_data
            prev.set_right(nil)
            return
            else
                prev.set_left(nil)
                return
        end
    end
    if current.get_left == nil
        if value > prev.get_data
            prev.set_right(current.get_right)
            return
            else
                prev.set_left(current.get_right)
                return
        end
     
    end

    if current.get_right == nil
        if value > prev.get_data
            prev.set_right(current.get_left)
            return
           
            else
                prev.set_left(current.get_left)
                return
        end
     
    end
    most_right = current.get_left
    while most_right.get_right!=nil
        most_right = most_right.get_right
    end
  
    most_right.set_right(current.get_right)
  
    if value > prev.get_data
  
        prev.set_right(current.get_left)
        return
       
        else
            prev.set_left(current.get_left)
            return
    end

end
def find(value)
    current = @root
    while current.get_left!=nil && current.get_right!=nil && current.get_data != value
        if value > current.get_data
            current = current.get_right
            else
                current = current.get_left
        end
    end
    if current.get_data == value
            puts "Found #{value}"
            return current
        else
           if value > current.get_data
               while current.get_right!=nil && current.get_data != value && current.get_data < value
                  
                   current = current.get_right
               end
            else
                 while current.get_left!=nil && current.get_data!= value && current.get_data> value

                    current = current.get_left
                 end
            end
            if current.get_data == value
                puts "Found #{value}"
                return current
            end
     end
     puts "value  #{value} not found"
end
def level_order
    puts "level order :"
    output_array = Array.new
    current = @root
    q = Queue.new
    q.push(current)
    while q.size > 0  
          current = q.pop
         if current.get_left!=nil
         q.push(current.get_left)
         end
         if current.get_right!=nil
         q.push(current.get_right)
         end
     
         
         output_array << current.get_data
    end
   p output_array
   return output_array
end
def inorder(curr)
    if curr == nil
        return
    end
        inorder(curr.get_left)
        print curr.get_data
        print  "   "
        inorder(curr.get_right)    
end
def inorder_traversal
    puts "inorder_traversal : "
    inorder(@root)
    puts
end
def preorder(curr)
    if curr == nil
        return
    end 
    print curr.get_data
        print  "   "
        preorder(curr.get_left)
       
        preorder(curr.get_right)    
end
def preorder_traversal
    puts "preorder_traversal : "
    preorder(@root)
    puts
end
def postorder(curr)
    if curr == nil
        return
    end
        postorder(curr.get_left)
        postorder(curr.get_right) 
          print curr.get_data
        print  "   "   
end
def postorder_traversal
    puts "postorder_traversal : "
    postorder(@root)
    puts 
end
def height(value)
    if find(value)!=nil
        puts "the height of #{value}"
       puts heightrec(find(value))
    end
end
def heightrec(node)
    if node == nil
        return -1
    end
    right =heightrec(node.get_right)
    left = heightrec(node.get_left)
        if right>left
            return right+1
        else
            return left+1
        end
end
def balanced?
    if heightrec(@root.get_left) - heightrec(@root.get_right) in -2...1
        return true 
    else
        return  false 
    end
end
def depth(value)
    dpth=0
    current = @root
    while current.get_left!=nil && current.get_right!=nil && current.get_data != value
        if value > current.get_data
            current = current.get_right
             dpth+=1
            else
                current = current.get_left
                dpth+=1
        end
    end
    if current.get_data == value
        puts "depth of #{value} is #{dpth}"
            return dpth
        else
           if value > current.get_data
               while current.get_right!=nil && current.get_data != value && current.get_data < value
                  
                   current = current.get_right
                   dpth+=1
               end
            else
                 while current.get_left!=nil && current.get_data!= value && current.get_data> value

                    current = current.get_left
                        dpth+=1
                 end
            end

            if current.get_data == value
                puts "depth of #{value} is #{dpth}"
                return dpth
            end
     end
   
end

def rebalance
   array = Array.new
   array=level_order.sort
   arr=Array.new
   arr.push (array[array.size/2+1])
   array = arr.concat(level_order)
   build_tree(array)
end

    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.get_right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.get_right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.get_data}"
        pretty_print(node.get_left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.get_left
      end
end