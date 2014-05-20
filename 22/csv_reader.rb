class CSVReader
  attr_reader :file

  def initialize(filename)
    @file = File.open(filename) do |file|
      file.read
    end
  end

  def file_contents
    self.file.gsub(/\"/,'').split(',')
  end
end