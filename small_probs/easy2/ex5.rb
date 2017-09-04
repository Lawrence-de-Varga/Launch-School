# Greeting a user

puts "What's you name?"
name = gets.chomp
if name.end_with?('!')
  puts "Hello #{name.chop}. Why are you screaming at me?".upcase
else
  puts "Hello #{name}."
end
