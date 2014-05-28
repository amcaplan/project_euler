require_relative 'abundant_number_sum'
require 'benchmark'

2.times do
  measure = Benchmark.measure do
    non_abundant_sums = AbundantNumberSum.new.non_abundant_sums
    puts non_abundant_sums.inject(:+)
  end
  puts measure
end