# The error is caused by the attempt to add a string to a integer.
# This can be fixed in the following ways:

puts "The value of 40 + 2 is " + (40 + 2).to_s
puts "The value of 40 + 2 is #{40 + 2}."
