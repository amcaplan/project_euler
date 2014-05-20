require_relative '../../spec/spec_helper'
require_relative '../csv_reader'

describe CSVReader do
  it "reads a file on initialization" do
    reader = CSVReader.new('data/names.txt')
    expect(reader.file).to be_a(String)
  end

  it "splits the file by commas" do
    reader = CSVReader.new('data/names.txt')
    reader.stub(:file){'"BOB","STEVE"'}
    expect(reader.file_contents).to be_an(Array)
    expect(reader.file_contents.join).not_to include(',')
  end

  it "shaves off quotes from a file" do
    reader = CSVReader.new('data/names.txt')
    reader.stub(:file){'"BOB","STEVE"'}
    expect(reader.file_contents).to eq(["BOB", "STEVE"])
  end
end