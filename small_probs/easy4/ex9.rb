DIGITS = %w(0 1 2 3 4 5 6 7 8 9)

def num_to_str(number)
  num_string = ''

  return '0' if number == 0

  loop do
    break num_string.reverse if number == 0
    num_string += DIGITS[number % 10]
    number = (number - (number % 10)) / 10
  end
end

def signed_num_to_str(number)
  negative = (number < 0 ? true : false) 
  number = (negative ? number * -1 : number)

  num_to_str(number).prepend(negative ? '-' : '')
end

  
  
    
  
  
