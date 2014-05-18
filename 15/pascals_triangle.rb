class PascalsTriangle
  def row(num)
    if num == 1
      [1]
    else
      prev_row = row(num - 1)
      expanded_prev_row = [0, *prev_row, 0]
      expanded_prev_row.each_cons(2).map{|pair| pair.inject(:+)}
    end
  end
end