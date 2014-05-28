require_relative '../../spec/spec_helper'
require_relative '../abundant_number.rb'

describe AbundantNumber do
  let(:generator) {AbundantNumber.generator}

  context "generator" do
    it "returns an enumerator" do
      expect(generator).to be_an(Enumerator)
    end

    it "generates abundant numbers" do
      expect(generator.take(4)).to eq([12, 18, 20, 24])
    end
  end

  it "tests whether a number is abundant" do
    expect(AbundantNumber.is_abundant?(12)).to be_true
    expect(AbundantNumber.is_abundant?(10)).to be_false
  end

  it "finds an additive pair" do
    expect(AbundantNumber.find_additive_pair(24)).to eq([12, 12])
  end

  it "returns nil when no pair is found" do
    expect(AbundantNumber.find_additive_pair(101)).to be_nil
  end
end