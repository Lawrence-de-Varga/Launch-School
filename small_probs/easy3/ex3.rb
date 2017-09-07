# Counting the number of characters

puts "Please write a word or a sentence:"
words = gets.chomp
puts "There are #{words.delete(' ').split('').length} characters in \"#{words}\""
