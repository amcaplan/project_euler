require_relative 'abundant_number'
require 'set'
require 'pry'

class AbundantNumberSum
  ABUNDANT_SUMS = Set.new
  @@filled = false

  def self.generator
    self.new.generator
  end

  def generator
    Enumerator.new do |yielder|
      i = 0
      loop do
        i += 1
        if ABUNDANT_SUMS.include?(i) ||
          AbundantNumber.find_additive_pair(i)

            ABUNDANT_SUMS << i
            yielder << i
        end
      end
    end
  end

  def non_abundant_sums
    fill_abundant_sums
    (1...28123).select { |num| !ABUNDANT_SUMS.include?(num) }
  end

  private
    def fill_abundant_sums
      unless @@filled
        abundant_nums = AbundantNumber.generator.take_while do |num|
          ABUNDANT_SUMS << num * 2 if num < 28123
        end
        abundant_nums.combination(2) do |pair|
          sum = pair[0] + pair[1]
          ABUNDANT_SUMS << sum
        end
      end
      @@filled = true
    end
end