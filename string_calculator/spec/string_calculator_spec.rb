require 'rspec'
require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  describe ".add" do
    it "returns 0 for an empty string" do
      expect(StringCalculator.add("")).to eq(0)
    end

    it "returns the number for a single number" do
      expect(StringCalculator.add("1")).to eq(1)
    end

    it "returns the sum of two numbers" do
      expect(StringCalculator.add("1,2")).to eq(3)
    end

    it "returns the sum of multiple numbers" do
      expect(StringCalculator.add("1,2,3,4")).to eq(10)
    end

    it "returns the sum of numbers with new lines between them" do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    it "returns the sum of numbers with different delimiters" do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end

    it "raises an error for negative numbers" do
      expect { StringCalculator.add("1,-2,3") }.to raise_error(RuntimeError, "negative numbers not allowed: -2")
    end
  end
end
