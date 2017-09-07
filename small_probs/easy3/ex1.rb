# Searching 101

def valid_number?(input)
  (input.to_i.to_s == input) || (input.to_f.to_s == input)
end

def get_number
  puts "Please enter a number:"
  number = gets.chomp
  return number if valid_number?(number)
  puts "Error. Please enter a valid number."
  get_number
end

def collect_numbers(n)
  numbers = []

  n.times { numbers << get_number } 
  numbers
end

def last_number_included?(numbers)
  last = numbers.pop
  if numbers.include?(last)
    puts "The number #{last} appears in #{numbers}."
  else
    puts "The number #{last} does not appear in #{numbers}."
  end
end

last_number_included?(collect_numbers(6))
