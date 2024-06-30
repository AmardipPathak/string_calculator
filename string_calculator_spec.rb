require './string_calculator.rb'

RSpec.describe StringCalculator do
  describe '.add' do
    it 'returns 0 for an empty string' do
      expect(StringCalculator.add("")).to eq(0)
    end

    it 'returns the number itself for a single number' do
      expect(StringCalculator.add("1")).to eq(1)
      expect(StringCalculator.add("5")).to eq(5)
    end

    it 'returns the sum of two numbers' do
      expect(StringCalculator.add("1,2")).to eq(3)
      expect(StringCalculator.add("3,5")).to eq(8)
    end

    it 'returns the sum of multiple numbers' do
      expect(StringCalculator.add("1,2,3")).to eq(6)
      expect(StringCalculator.add("4,5,6,7")).to eq(22)
    end

    it 'handles new lines between numbers' do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
      expect(StringCalculator.add("4\n5\n6")).to eq(15)
    end

    it 'supports custom delimiters' do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
      expect(StringCalculator.add("//|\n3|4|5")).to eq(12)
    end

    it 'supports multiple custom delimiters' do
      expect(StringCalculator.add("//[*][%]\n1*2%3")).to eq(6)
      expect(StringCalculator.add("//[***][%%]\n1***2%%3")).to eq(6)
    end
  end
end