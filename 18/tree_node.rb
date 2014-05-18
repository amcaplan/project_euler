class TreeNode
  attr_reader :datum

  def initialize(datum = nil)
    @datum = datum
  end

  def left
    @left || TreeNode.new
  end

  def right
    @right || TreeNode.new
  end

  def left=(datum)
    @left = datum.is_a?(TreeNode) ? datum : TreeNode.new(datum)
  end

  def right=(datum)
    @right = datum.is_a?(TreeNode) ? datum : TreeNode.new(datum)
  end

  def sum
    datum ? left.sum + right.sum + datum : 0
  end

  def to_a
    return unless datum
    [self.left.to_a, self.datum, self.right.to_a].flatten.compact
  end

  def max_line
    self.datum ? [left.max_line, right.max_line].max + datum : 0
  end
end