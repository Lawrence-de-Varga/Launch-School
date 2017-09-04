# when will I retire

def get_age
  puts "What is your age?"
  age = gets.chomp.to_i
end

def get_retirement_age
  puts "At what age would you like to retire?"
  retirement_age = gets.chomp.to_i
end

years_to_retirement = (get_age * -1) + get_retirement_age

puts "It's #{Time.now.year}. You will retire in #{Time.now.year + years_to_retirement}."
puts "You only have #{years_to_retirement} years of work to go!"
