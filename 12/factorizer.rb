require 'prime'

class Factorizer
  def factors(num)
    prime_factors = prime_factorization(num)
    (1..prime_factors.size).map { |num_prime_factors|
      prime_factors.combination(num_prime_factors).map { |factor_set|
        factor_set.inject(:*)
      }
    }.flatten.uniq
  end

  def prime_factorization(num)
    Prime.prime_division(num).map { |num_and_exponent|
      num = num_and_exponent[0]
      exponent = num_and_exponent[1]
      [num] * exponent
    }.flatten
  end
end