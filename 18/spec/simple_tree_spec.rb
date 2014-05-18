require_relative '../../spec/spec_helper'
require_relative '../simple_tree'

describe SimpleTree do
  it "generates a tree from an array" do
    tree = SimpleTree.new([[1],[2,3]])
    expect(tree.all).to eq([2,1,3])
  end

  it "generates a tree from a string" do
    str = "1 \n 1 2 \n 3 4 15"
    tree = SimpleTree.from_string(str)
    expect(tree.all).to eq([3,1,4,1,4,2,15])
  end

  it "finds the maximum value from a single traversal down the tree" do
    tree = SimpleTree.new([[1],[2,3]])
    expect(tree.max_traversal).to eq(4)
  end

  it "solves Project Euler Problem 16" do
    triangle = <<-TRIANGLE
    75
    95 64
    17 47 82
    18 35 87 10
    20 04 82 47 65
    19 01 23 75 03 34
    88 02 77 73 07 63 67
    99 65 04 28 06 16 70 92
    41 41 26 56 83 40 80 70 33
    41 48 72 33 47 32 37 16 94 29
    53 71 44 65 25 43 91 52 97 51 14
    70 11 33 28 77 73 17 78 39 68 17 57
    91 71 52 38 17 14 91 43 58 50 27 29 48
    63 66 04 68 89 53 67 30 73 16 69 87 40 31
    04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
    TRIANGLE

    tree = SimpleTree.from_string(triangle)
    expect(tree.max_traversal).to eq(1074)
  end
end