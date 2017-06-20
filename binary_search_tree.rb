require_relative 'bst_node.rb'
# require 'pry'

class BinarySearchTree
  attr_accessor :root, :current_root

  def initialize
    @root = BSTNode.new(nil)
    @current_root = @root
  end

  def find(val)
    if @current_root.nil? || @current_root.val.nil?
      @current_root = @root
      return false
    elsif @current_root.val == val
      found = @current_root
      @current_root = @root
      return found
    elsif val < @current_root.val
      @current_root = @current_root.left
      find(val)
    elsif val > @current_root.val
      @current_root = @current_root.right
      find(val)
    end

  end

  def insert(el)
    if @root.val.nil?
      @root.val = el
      @current_root = @root
      return el
    end

    if @current_root.nil?
      @current_root = BSTNode.new(el)
      @current_root = @root
    elsif el <= @current_root.val
      if @current_root.left.nil?
        @current_root.left = BSTNode.new(el)
        @current_root = @root
      else
        @current_root = @current_root.left
        insert(el)
      end
    else
      if @current_root.right.nil?
        @current_root.right = BSTNode.new(el)
        @current_root = @root
      else
        @current_root = @current_root.right
        insert(el)
      end
    end

    el
  end

  def delete(el)
    node = find(el)
    return "Value doesn't exist" unless node
    parent = node == @root ? nil : find_parent(node)

    if node.right.nil? && node.left.nil?
      parent.right = nil if parent.right == node
      parent.left = nil if parent.left == node
    elsif node.right.nil?
      temp = node.left
      node.left= nil
      parent.right = temp if parent.right == node
      parent.left = temp if parent.left == node
    elsif node.left.nil?
      temp = node.right
      node.right= nil
      parent.right = temp if parent.right == node
      parent.left = temp if parent.left == node
    else
      max_node = maximum(node)
      # max_parent = find_parent(node)
      left = node.left == max_node ? nil : node.left
      right = node.right
      delete(max_node.val)
      max_node.left = left
      max_node.right = right
      parent.right = max_node if parent.right == node
      parent.left = max_node if parent.left == node
    end
  end

  def is_balanced?
  end

  def in_order_traversal
  end

  def maximum(node)
    max = node.right
    until node.nil?
      if node.right.val > max.val
        max = node.right
      end
      node = node.right
    end

    max
  end

  def depth
  end

  def find_parent(node)
    current_node = @root
    until current_node.nil?
      if current_node.left == node || current_node.right == node
        return current_node
      elsif node.val > current_node.val
        current_node = current_node.right
      elsif node.val < current_node.val
        current_node = current_node.left
      end
    end
  end
end

# tree = BinarySearchTree.new
# node1 = (4)
# node2 = (2)
# node3 = (6)
# node4 = (1)
# node5 = (3)
# node6 = (5)
# node7 = (7)
# tree.insert(node1)
# tree.insert(node2)
# tree.insert(node3)
# tree.insert(node4)
# tree.insert(node5)
# tree.insert(node6)
# tree.insert(node7)
# binding.pry
