def get_number
  puts "Please enter a number greater than zero:"
  number = gets.chomp.to_i
  if number > 0
    number
  else
    puts "Error. Input must be greater than zero."
    get_number
  end
end

number = get_number 

loop do
  puts "Would you like the sum or product of all the integer up to #{number}? (1 for sum, 2 for product)."
  sum_or_product = gets.chomp
  
  if sum_or_product == '1'
    puts (1..number).reduce(:+)
    break
  elsif  sum_or_product == '2'
    puts (1..number).reduce(:*)
    break
  else 
    puts "Error. Please enter 1 for sum or 2 for product."
  end
end
