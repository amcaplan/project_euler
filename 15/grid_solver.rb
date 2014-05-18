require_relative 'pascals_triangle'

class GridSolver
  def self.num_paths(grid_size)
    row = PascalsTriangle.new.row(grid_size * 2 + 1)
    row[row.size / 2]
  end
end

puts GridSolver.num_paths(20)