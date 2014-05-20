require_relative 'csv_reader'
require_relative 'string_evaluator'

def name_value(name)
  StringEvaluator.new(name).value
end

def value_for(name, position)
  name_value(name) * position
end

sorted_names = CSVReader.new('data/names.txt').file_contents.sort
name_values = sorted_names.map.with_index { |name, index|
  value_for(name, index + 1)
}.inject(:+)

puts name_values