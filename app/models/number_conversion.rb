class NumberConversion < ApplicationRecord
  validates :number, numericality: { greater_than_or_equal_to: 0 }
  validates :from_base, :to_base, numericality: { greater_than_or_equal_to: 2, less_than_or_equal_to: 16}

  def result
    base_converter(self.number, self.from_base, self.to_base)
  end

  def base_converter(num_string, current_base, end_base)
    num_string = num_string.to_s
    if num_string != '0'
      num_array = num_string.scan /\w/
      addition_array = []
      converted_number = 0
      i = 1

      num_array.each do |num_str|

        num_caps = num_str.upcase

        case
        when num_caps == 'A'
          num_caps = 10
        when num_caps == 'B'
          num_caps = 11
        when num_caps == 'C'
          num_caps == 12
        when num_caps == 'D'
          num_caps == 13
        when num_caps == 'E'
          num_caps == 14
        when num_caps == 'F'
          num_caps == 15
        end

        num = num_caps.to_i
        digit = num_array.length - i
        convert_digit_to_decimal = (current_base ** digit) * num
        converted_number = converted_number + convert_digit_to_decimal
        i = i + 1
      end

      number_of_digits = (Math.log(converted_number, end_base) + 1).floor
      converted_digit_array = []
      j = 0
      while j < number_of_digits
        converted_digit = (converted_number / (end_base ** (number_of_digits - 1))).to_s
        case
        when converted_digit == '10'
          converted_digit = 'a'
        when converted_digit == '11'
          converted_digit = 'b'
        when converted_digit == '12'
          converted_digit = 'c'
        when converted_digit == '13'
          converted_digit = 'd'
        when converted_digit == '14'
          converted_digit = 'e'
        when converted_digit == '15'
          converted_digit = 'f'
        end
        converted_number = (converted_number % (end_base ** (number_of_digits - 1)))
        number_of_digits = number_of_digits - 1
        converted_digit_array << converted_digit
      end

      converted_num = converted_digit_array.join
    
    else
      converted_num = '0'
    end

    converted_num
  end
end
