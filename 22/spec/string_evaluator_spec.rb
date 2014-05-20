require_relative '../../spec/spec_helper'
require_relative '../string_evaluator'

describe StringEvaluator do
  it "upcases a string" do
    evaluator = StringEvaluator.new("hello world")
    expect(evaluator.string).to eq("HELLO WORLD")
  end

  it "evaluates a string" do
    evaluator = StringEvaluator.new("hello world")
    expect(evaluator.value).to eq(124)
  end
end