require_relative '../../spec/spec_helper'
require_relative '../digit_summer'

describe DigitSummer do
  it "sums the digits of a small number" do
    expect(DigitSummer.sum(1)).to eq(1)
  end

  it "sums the digits of a large number" do
    expect(DigitSummer.sum(1234567899)).to eq(1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 9)
  end
end