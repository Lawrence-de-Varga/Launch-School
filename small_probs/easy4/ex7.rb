# convert a string to a number

def convert_string_digit(string_digit)
  case string_digit
  when '1' then 1
  when '2' then 2
  when '3' then 3
  when '4' then 4
  when '5' then 5
  when '6' then 6
  when '7' then 7
  when '8' then 8
  when '9' then 9
  end
end

def gen_decimal_position(array)
  array = array.reverse

  array.map do |num|
    index = array.find_index(num)
    num * (10 ** index)
  end
end

def string_to_integer(string)
  num_ary = string.chars
  #sign = num_ary.shift if ['+','-'].include?(num_ary[0])
  
  num = gen_decimal_position(num_ary.map {|digit| convert_string_digit(digit)}).reduce(:+)
  #sign == '-' ? num * -1 : num
end

# LS stuff

def string_to_signed_integer(string)
  head = string[0]
  tail = string[1..-1]

  result = string_to_integer case head
                             when '-' || '+' then tail
                             else string
                             end
  head == '-' ? -result : result
end 
   
  
