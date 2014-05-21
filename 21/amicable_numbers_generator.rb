require_relative '../12/factorizer'
require 'set'

class AmicableNumbersGenerator
  attr_reader :used_pairs, :enum
  attr_accessor :i

  def self.generator
    self.new.enum
  end

  def initialize
    restart
    generate_enum
  end

  def restart
    @used_pairs = Set.new
    @i = 1
  end

  private
    def generate_enum
      @enum = Enumerator.new do |yielder|
        loop do
          self.i += 1
          other_num = factor_sum(self.i)

          if new_pair?(self.i, other_num)
            self.used_pairs << other_num
            yielder << [self.i, other_num]
          end
        end
      end
      add_restart_to_enum
    end

    def factor_sum(num)
      factorize(num).inject(:+)
    end

    def factorize(num)
      Factorizer.new.factors(num)
    end

    def new_pair?(a, b)
      are_pair?(a, b) && is_unused?(a) && a != b
    end

    def are_pair?(a, b)
      factor_sum(b) == a
    end

    def is_unused?(num)
      !self.used_pairs.include?(num)
    end

    def add_restart_to_enum
      gen = self
      self.enum.define_singleton_method(:restart) { gen.restart }
    end
end