# How old is Teddy?
def teddy_age
  puts "What's your name?"
  name = gets.chomp
  name = "Teddy" if name.empty?
  puts "#{name} is #{rand(20..200)} years old today."
end
