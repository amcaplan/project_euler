require_relative 'csv_reader'
require_relative 'string_evaluator'

reader = CSVReader.new('data/names.txt')
puts reader.file_contents.sort.map.with_index { |name, index|
  StringEvaluator.new(name).value * (index + 1)
}.inject(:+)