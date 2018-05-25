require "byebug"

class PolyTreeNode
  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(node)
    parent.children.delete(self) if parent
    @parent = node
    parent.children << self if parent && !parent.children.include?(self)
  end

  def add_child(child_node)
    child_node.parent = self
    children << child_node unless children.include?(child_node)
  end

  def remove_child(child_node)
    raise "Not a child!!" unless children.include?(child_node)
    children.delete(child_node)
    child_node.parent = nil
  end

  # def dfs(target_value, &prc)
  #   prc ||= Proc.new{|el| el == target_value}
  #   return self if self.value == target_value
  #   children.each do |child|
  #     # return child if child.value == target_value
  #     child_return = child.dfs(target_value, prc)
  #     return child_return unless child_return.nil?
  #   end
  #   return nil
  # end

  def dfs(target_value)
    return self if self.value == target_value
    children.each do |child|
      child_return = child.dfs(target_value)
      return child_return unless child_return.nil?
    end
    return nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      current_node = queue.shift
      return current_node if current_node.value == target_value
      current_node.children.each do |child|
        queue << child
      end
    end
    nil
  end

end
