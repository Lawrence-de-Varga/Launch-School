# Odd lists

def oddities(ary)
  new_ary = []
  ary.each_with_index { |val, index| new_ary << val if index.even?}
  new_ary
end
