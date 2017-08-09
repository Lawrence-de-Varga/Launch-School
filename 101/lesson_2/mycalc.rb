def get_nums()
  Kernel.puts ("Please enter two numbers:")
  num1 = Kernel.gets()
  num2 = Kernel.gets()

  if (num1.to_f.to_s == num1 && num2.to_f.to_s == num2)
    return [num1.to_f, num2.to_f]
  else
    puts "Please check your input and try again."
    get_nums()
  end
end


def get_operation()
  Kernel.puts("What operation would you like to perform on the numbers? (Basic Arithmetic Only)")

  operation = Kernel.gets().chomp.downcase

  case operation
    when "multiplication" then return :multi 
    when "addition" then return :add
    when "subtraction" then return :sub
    when "division" then return :div
    else puts "Error"; get_operation()
  end
end

def perform_operation(nums_ary, operation)
  num1 = nums_ary[0]
  num2 = nums_ary[1]
  
  mess = "The result is: "

  case operation
    when :multi then puts "#{mess}#{num1 * num2}"
    when :add then puts "#{mess}#{num1 + num2}"
    when :sub then puts "#{mess}#{num1 - num2}"
    when :div then puts "#{mess}#{num1 / num2}"
  end
end

def calc()
  perform_operation(get_nums, get_operation)
end

