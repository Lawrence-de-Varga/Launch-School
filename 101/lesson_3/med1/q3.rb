def factors(number)
  return "Error, number must be positive integer." if number < 1
  (1..number).each_with_object([]) {|num, new_ary| new_ary << num if number % num == 0 }
end
