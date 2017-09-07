# Arithmetic Integer

puts "Please enter the first number:"
num1 = gets.chomp.to_i
puts "Please enter the second number:"
num2 = gets.chomp.to_i

operations = %w(+ - * / % **)

operations.each { |operation| puts "==> #{num1} #{operation} #{num2} = #{num1.method(operation).(num2)}}
