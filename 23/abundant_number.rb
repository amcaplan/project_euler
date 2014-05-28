require_relative '../12/factorizer'
require 'set'

class AbundantNumber
  ABUNDANT_NUMBERS = Set.new

  class << self

    def generator
      new.generator
    end

    def find_additive_pair(num)
      gen = generator
      while gen.peek <= num/2
        current_num = gen.next
        other_num = num - current_num
        return [current_num, other_num] if is_abundant?(other_num)
      end
    end

    def is_abundant?(num)
      ABUNDANT_NUMBERS.include?(num) ||
        Factorizer.new.factors(num).inject(:+) > num && ABUNDANT_NUMBERS << num
    end

  end

  def generator
    Enumerator.new do |yielder|
      i = 1
      loop do
        i += 1
        yielder << i if is_abundant?(i)
      end
    end
  end

  def is_abundant?(num)
    self.class.is_abundant?(num)
  end
end