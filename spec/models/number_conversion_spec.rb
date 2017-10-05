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

    (1..1000).each do |n|
      from_actual = n.to_s(3)
      to_actual = n.to_s(16)
      a = NumberConversion.new(number: from_actual, from_base: 3, to_base: 16)
      expect(a.result).to eq(to_actual)
    end
  end
end
