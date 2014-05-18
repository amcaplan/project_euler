# This class brute forces the problem, but is too slow.
# Pascal's triangle works better.

class MazeWalker
  attr_reader :size

  def initialize(size)
    @size = size
  end

  def paths_count
    paths_from(0, 0)
  end

  def paths_from(i, j)
    if i == self.size && j == self.size
      1
    elsif i > self.size || j > self.size
      0
    else
      paths_from(i+1, j) + paths_from(i, j+1)
    end
  end
end