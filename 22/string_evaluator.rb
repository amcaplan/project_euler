class StringEvaluator
  attr_reader :string

  def initialize(string)
    @string = string.upcase
  end

  def value
    self.string.each_char.map {|char|
      value = char.ord
      value.between?(64, 91) ? value - 64 : 0
    }.inject(:+)
  end
end