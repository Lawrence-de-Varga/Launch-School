# Array Average
def array_average(ary)
  sum = 0
  ary.each { |int| sum += int }
  
  sum.to_f / ary.length.to_f
end
