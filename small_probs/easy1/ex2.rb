# odd

def is_odd?(num)
  num % 2 == 1
end

# if unsure about modulus operator
def is_odd2?(num)
  num.abs & 2 == 1
end

# with remainder method
def oddp(num)
  num.abs.remainder(2) == 1
end
  
