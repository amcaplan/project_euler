require_relative 'factorizer'
require_relative 'triangle_number_generator'

class TriangleNumberWithFactors
  FACTORIZER = Factorizer.new
  attr_reader :num

  def self.lowest_with_factors(num_factors)
    TriangleNumberGenerator.all.find do |num|
      self.new(num).factors >= num_factors
    end
  end

  def initialize(num)
    @num = num
  end

  def factors
    FACTORIZER.factors(self.num).size
  end
end

puts TriangleNumberWithFactors.lowest_with_factors(500)