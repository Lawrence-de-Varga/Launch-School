# squaring an argument

def multiply(num1, num2)
  num1 * num2
end

def square(num)
  mutiply(num, num)
end

def power_of_n(num, n)
  power_of_n_help(num, n, 1)
end

def power_of_n_help(num, n, result)
  return result if n == 0
  power_of_n_help(num, (n - 1), (multiply(num, result)))
end
