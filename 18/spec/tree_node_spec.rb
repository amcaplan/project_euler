require_relative '../../spec/spec_helper'
require_relative '../tree_node'

describe TreeNode do
  it "holds a datum" do
    expect(TreeNode.new("bob").datum).to eq("bob")
  end

  it "has a left node" do
    expect(TreeNode.new.left).to be_a(TreeNode)
  end

  it "has a right node" do
    expect(TreeNode.new.right).to be_a(TreeNode)
  end

  it "stores information in lower nodes" do
    tree_node = TreeNode.new("bob")
    tree_node.right = "dave"
    tree_node.left = "steve"
    expect(tree_node.right.datum + tree_node.left.datum).to eq("davesteve")
  end

  it "can sum its lower nodes" do
    tree_node = TreeNode.new(1)
    tree_node.right = 2
    tree_node.left = 3
    expect(tree_node.sum).to eq(6)
  end

  it "can sum many levels" do
    tree_node = TreeNode.new(1)
    tree_node.right = 2
    tree_node.right.right = 3
    expect(tree_node.sum).to eq(6)
  end

  it "finds maximum line from this point on" do
    tree_node = TreeNode.new
    expect(tree_node.max_line).to eq(0)

    tree_node = TreeNode.new(1)
    tree_node.left = 4
    tree_node.right = 400
    expect(tree_node.max_line).to eq(401)
  end
end