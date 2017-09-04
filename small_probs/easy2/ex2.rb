# How big is the room
def room_area
  puts "Enter the length of the room in meters:"
  length = gets.chomp.to_f
  puts "Enter the width of the room in meters:"
  width = gets.chomp.to_f

  area = (length * width).round(2)

  puts "The room is #{area} square meterss (#{area * 10.7639} square feet)."
end
