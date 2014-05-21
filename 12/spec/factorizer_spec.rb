require_relative '../../spec/spec_helper'
require_relative '../factorizer'

describe Factorizer do
  let(:num){100}
  let(:factors){Factorizer.new.factors(num)}

  it "gives all factors of a number" do
    expect(factors.sort).to eq([1, 2, 4, 5, 10, 20, 25, 50])
  end

  it "does not include the number itself" do
    expect(factors).not_to include(num)
  end

  it "includes 1 as a factor" do
    expect(factors).to include(1)
  end

  it "does not list 1 as a factor of 1" do
    expect(Factorizer.new.factors(1)).not_to include(1)
  end
end