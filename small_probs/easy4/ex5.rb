def multiple_of_3_or_5(num)
  (num % 5 == 0) || (num % 3 == 0)
end

def multisum(num)
  (1..num).select {|num| multiple_of_3_or_5(num)}.reduce(:+)
end
