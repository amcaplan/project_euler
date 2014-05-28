require_relative '../../spec/spec_helper'
require_relative '../abundant_number_sum.rb'

describe AbundantNumberSum do
  let(:generator) {AbundantNumberSum.generator}
  let(:non_abundant_sums) {AbundantNumberSum.new.non_abundant_sums}

  context "generator" do
    it "returns an enumerator" do
      expect(generator).to be_an(Enumerator)
    end

    it "generates abundant number sums" do
      expect(generator.first).to eq(24)
    end
  end

  context "non_abundant_sums" do
    it "returns a list of numbers not in the generator" do
      hundred_non_abundant_sums = non_abundant_sums.take(100)
      hundred_abundant_sums = generator.take(100)
      expect(hundred_abundant_sums & hundred_non_abundant_sums).to be_empty
    end
  end
end