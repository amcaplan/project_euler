require 'prime'

class Factorizer

  def factors(num)
    all_multiplied_combinations(prime_factorization(num))
  end

  private
    def all_multiplied_combinations(numbers)
      (0...numbers.size).flat_map do |combo_size|
        all_combinations_multiplied(numbers, combo_size)
      end
    end

    def all_combinations_multiplied(numbers, combo_size)
      numbers.combination(combo_size).map {|factor_set|
        factor_set.inject(1, :*)
      }.uniq
    end

    def prime_factorization(num)
      Prime.prime_division(num).flat_map do |num_and_exponent|
        num = num_and_exponent[0]
        exponent = num_and_exponent[1]
        [num] * exponent
      end
    end
end