require 'rspec'
require_relative './calculator'

RSpec.describe Calculator do
  let(:calculator) { Calculator.new }

  describe "#add" do
    it "returns 0 for an empty string" do
      expect(calculator.add("")).to eq(0)
    end

    it "returns the value for a single number" do
      expect(calculator.add("1")).to eq(1)
      expect(calculator.add("5")).to eq(5)
    end

    it "returns the sum of two comma-separated numbers" do
      expect(calculator.add("1,5")).to eq(6)
    end

    it "returns the sum of multiple comma-separated numbers" do
      expect(calculator.add("1,2,3,4")).to eq(10)
    end

    it "returns the sum of numbers separated by newlines" do
      expect(calculator.add("1\n2,3")).to eq(6)
    end

    it "returns the sum of numbers with a custom delimiter" do
      expect(calculator.add("//;\n1;2")).to eq(3)
      expect(calculator.add("//|\n1|2|3")).to eq(6)
    end

    it "raises an exception for negative numbers" do
        expect { raise "oops" }.to raise_error(RuntimeErro)
        expect { calculator.add("1,-2,3") }.to raise_error

      expect { calculator.add("1,-2,3") }.to raise_error("negative numbers not allowed: -2")
      expect { calculator.add("1,-2,-3") }.to raise_error("negative numbers not allowed: -2, -3")
    end
  end
end
