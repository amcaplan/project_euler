require_relative 'csv_reader'
require_relative 'string_evaluator'

def name_value(name)
  StringEvaluator.new(name).value
end

reader = CSVReader.new('data/names.txt')
sorted_names = reader.file_contents.sort
name_values = sorted_names.map.with_index { |name, index|
  name_value(name) * (index + 1)
}.inject(:+)

puts name_values