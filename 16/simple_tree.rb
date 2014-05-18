require_relative 'tree_node'

class SimpleTree
  attr_reader :tree

  def self.from_string(str)
    rows = str.strip.split("\n")
    rows.map! {|row| row.strip.split.map(&:to_i)}
    new(rows)
  end

  def initialize(two_d_array)
    @tree = generate_tree(two_d_array)
  end

  def generate_tree(two_d_array)
    TreeNode.new(two_d_array[0][0]).tap do |tree_node|
      if two_d_array.length > 1
        tree_node.left = generate_subtree(two_d_array) { |line| line[0..-2] }
        tree_node.right = generate_subtree(two_d_array) { |line| line[1..-1] }
      end
    end
  end

  def generate_subtree(two_d_array, &block)
    subtree = two_d_array[1..-1]
    generate_tree(subtree.map(&block))
  end

  def all
    self.tree.to_a
  end

  def max_traversal
    self.tree.max_line
  end
end