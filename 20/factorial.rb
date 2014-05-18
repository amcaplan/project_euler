module Math
  def self.factorial(num)
    num.downto(1).inject(:*)
  end
end