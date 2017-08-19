def digit_list(num)
  num.to_s.split('').map { |num| num.to_i }
end
