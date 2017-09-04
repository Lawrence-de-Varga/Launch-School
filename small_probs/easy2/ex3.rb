# Tip calculator
def tip_calculator
  puts "What is the bill?"
  bill = gets.chomp.to_f
  puts "What is the tip percentage?"
  tip_percentage = gets.chomp.to_f
  
  tip = bill * (tip_percentage / 100)
  total_payment = bill + tip

  puts "The tip it #{tip}."
  puts "The total is #{total_payment}."
end
