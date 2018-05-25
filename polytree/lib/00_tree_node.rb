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
    @parent.children.delete(self) if @parent
    @parent = node
    @parent.children << self if @parent && !@parent.children.include?(self)
  end

end
