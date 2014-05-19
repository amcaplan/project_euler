require_relative 'amicable_numbers_generator'

gen = AmicableNumbersGenerator.generator
nums = gen.take_while{|pair| pair[0] < 10_000}.flatten
puts nums.inject(:+)