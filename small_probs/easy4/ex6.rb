def running_total(ary)
  current_total = 0

  ary.map {|num| current_total += num }
end
  
# below intentionally does not use a 'current_total' var, but as a result is inefficient
def rt(ary)
  ary.each_with_object([]) {|num,new_ary| new_ary << ary[0..ary.find_index(num)].reduce(:+)}
end
