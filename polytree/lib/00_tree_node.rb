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

end
