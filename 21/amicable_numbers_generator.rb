require_relative '../12/factorizer'

class AmicableNumbersGenerator
  include Enumerable

  attr_reader :used_pairs, :enum
  attr_accessor :i

  def self.generator
    self.new
  end

  def initialize
    restart
    generate_enum
  end

  def restart
    @used_pairs = {}
    @i = 1
  end

  def generate_enum
    @enum = Enumerator.new do |yielder|
      while self.i += 1
        other_num = factorize(self.i).inject(:+)
        if new_pair?(self.i, other_num)
          @used_pairs[other_num] = self.i
          yielder << [self.i, other_num]
        end
      end
    end
  end

  def method_missing(meth, *args, &block)
    self.enum.send(meth, *args, &block)
  end

  private
    def factorize(num)
      factors = Factorizer.new.factors(num)
      factors.pop
      factors << 1
    end

    def new_pair?(a, b)
      are_pair?(a, b) && is_unused?(a) && a != b
    end

    def are_pair?(a, b)
      factorize(b).inject(:+) == a
    end

    def is_unused?(num)
      !self.used_pairs[num]
    end
end