# 'limit' is defined outside the scope of the method.
# The method has no idea what 'limit' is and therefore
# throws a undefined variable error

# One way of fixing it would be as follows:
def fib(first_num, second_num, limit)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

# Another way with a fixed limit would be as follows:
def fib2(first_num, second_num)
  limit = 100
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end
