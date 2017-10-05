require 'rails_helper'

RSpec.describe NumberConversion, type: :model do
  it "should convert number from decimal to binary" do
    n = NumberConversion.new(number: 7, from_base: 10, to_base: 2)
    expect(n.result).to eq('111')

    n = NumberConversion.new(number: 9, from_base: 10, to_base: 2)
    expect(n.result).to eq('1001')

    n = NumberConversion.new(number: 1, from_base: 10, to_base: 2)
    expect(n.result).to eq('1')
  end

  it "should convert number from base 3 to 16" do
    n = NumberConversion.new(number: 22010, from_base: 3, to_base: 16)
    expect(n.result).to eq('db')
    n = NumberConversion.new(number: 1, from_base: 3, to_base: 16)
    expect(n.result).to eq('1')

    (0..1000).each do |n|
      from_actual = n.to_s(3)
      to_actual = n.to_s(16)
      a = NumberConversion.new(number: from_actual, from_base: 3, to_base: 16)
      expect(a.result).to eq(to_actual)
    end
  end

  it "should allow valid values" do
      expect(NumberConversion.new(number: 1, from_base: 3, to_base: 16)).to be_valid
      expect(NumberConversion.new(number: 5, from_base: 2, to_base: 10)).to be_valid
      expect(NumberConversion.new(number: 5, from_base: 10, to_base: 2)).to be_valid
      expect(NumberConversion.new(number: 0, from_base: 10, to_base: 2)).to be_valid
  end

  it "should disallow invalid numbers" do
      expect(NumberConversion.new(number: -1, from_base: 10, to_base: 2)).to be_invalid
      expect(NumberConversion.new(number: 'abc', from_base: 10, to_base: 2)).to be_invalid
  end

  it "should disallow invalid bases" do
      expect(NumberConversion.new(number: 1, from_base: 10, to_base: 0)).to be_invalid
      expect(NumberConversion.new(number: 5, from_base: -1, to_base: 5)).to be_invalid
      expect(NumberConversion.new(number: 5, from_base: 'abc', to_base: 1)).to be_invalid
  end

  it "should disallow missing required attributes" do
      expect(NumberConversion.new).to be_invalid
      expect(NumberConversion.new(number: '', from_base: '', to_base: '')).to be_invalid
  end
end

