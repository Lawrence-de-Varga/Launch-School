def divisible_by?(num, divisor)
  num % divisor == 0
end

def leap_year?(year)
  if year <= 1752
   divisible_by?(year, 4)
  else
    ((divisible_by?(year, 4)) && !(divisible_by?(year, 100))) || (divisible_by?(year, 400))
  end
end 
