TEENS = (10..19).to_a.map { |val| val.to_s}
NORM = %w(0 4 5 6 7 8 9)

def last_two_digits(number)
  number = number.to_s
  d1 = number[-2]
  d2 = number[-1]
  if d1 
    if d1 == '1'
      d1 + d2
    else
      d2
    end
  else
    d2
  end
end

def get_suffix(number)
  end_of_num = last_two_digits(number)
  case 
  when TEENS.include?(end_of_num) || NORM.include?(end_of_num)
    'th'
  when end_of_num == '2'
    'nd'
  when end_of_num == '1'
    'st'
  else
    'rd'
  end
end


def century_number(number)
  count = 0
  loop do
    break count if number == 0 || number < 0
    count +=1 
    number -= 100
  end
end

def century(number)
  century = century_number(number)
  suffix = get_suffix(century)
  century.to_s + suffix
end
  
