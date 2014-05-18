require_relative '../../spec/spec_helper'
require_relative '../factorial'

describe "Math.factorial" do
  it "factorializes a small number" do
    expect(Math.factorial(5)).to eq(120)
  end

  it "factorializes a large number" do
    expect(Math.factorial(100)).to eq(93326215443944152681699238856266700490715968264381621468592963895217599993229915608941463976156518286253697920827223758251185210916864000000000000000000000000)
  end
end