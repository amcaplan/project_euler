class StringEvaluator
  attr_reader :string

  def initialize(string)
    @string = string.upcase
  end

  def value
    self.string.each_char.map {|char|
      value = char.ord - pre_alphabet
      value.between?(0,27) ? value : 0
    }.inject(:+)
  end

  def pre_alphabet
    'A'.ord - 1
  end
end