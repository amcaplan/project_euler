class CSVReader
  attr_reader :file

  def initialize(filename)
    @file = File.open(filename, &:read)
  end

  def file_contents
    self.file.gsub(/\"/,'').split(',')
  end
end