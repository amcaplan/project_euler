require_relative '../../spec/spec_helper'
require_relative '../sunday_finder.rb'

describe SundayFinder do
  it "solves Project Euler Problem 19" do
    sf = SundayFinder.new("Jan 1 1901", "Dec 31 2000")
    expect(sf.num_month_beginning_sundays).to eq(171)
  end
end