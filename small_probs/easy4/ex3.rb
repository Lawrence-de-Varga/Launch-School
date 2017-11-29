def divisible_by?(num, divisor)
  num % divisor == 0
end

def leap_year?(year)
  ((divisible_by?(year, 4)) && !(divisible_by?(year, 100))) || (divisible_by?(year, 400))
end
