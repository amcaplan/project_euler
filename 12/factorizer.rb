require 'prime'

class Factorizer
  def factors(num)
    all_multiplied_combinations(prime_factorization(num))
  end

  def all_multiplied_combinations(numbers)
    [].tap do |combinations|
      (0...numbers.size).each do |combo_size|
        combinations.concat all_combinations_multiplied(numbers, combo_size)
      end
    end
  end

  def prime_factorization(num)
    [].tap do |factors|
      Prime.prime_division(num).each do |num_and_exponent|
        num = num_and_exponent[0]
        exponent = num_and_exponent[1]
        exponent.times {factors << num}
      end
    end
  end

  def all_combinations_multiplied(numbers, combo_size)
    numbers.combination(combo_size).map {|factor_set|
      factor_set.inject(1, :*)
    }.uniq
  end
end