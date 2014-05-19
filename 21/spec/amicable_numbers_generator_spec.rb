require_relative '../../spec/spec_helper'
require_relative '../amicable_numbers_generator'

describe AmicableNumbersGenerator do
  let(:gen) {AmicableNumbersGenerator.generator}
  
  it "generates a new enumerator" do
    expect(gen).to be_an AmicableNumbersGenerator
  end

  it "generates pairs of amicable numbers" do
    expect(gen.next).to eq([220, 284])
    expect(gen.next).to eq([1184, 1210])
  end

  it "can restart" do
    gen.next
    gen.restart
    expect(gen.next).to eq([220, 284])
  end

  it "is independent of other instances" do
    gen2 = AmicableNumbersGenerator.generator
    gen.next
    expect(gen.next).to eq([1184, 1210])
    expect(gen2.next).to eq([220, 284])
  end
end