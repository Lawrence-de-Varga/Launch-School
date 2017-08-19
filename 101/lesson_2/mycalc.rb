# have not localised the 'choose and operation' part
# as I did not follow the course program and so chaging that is just going to be a pain


require 'yaml'

MESSAGES = YAML.load_file('calc_mess.yaml')

LOCMESS = MESSAGES['used_lang']
def set_lang()
  lang = nil
  loop do
    puts "Deutsch (DE) or English (ENG)?"
    lang = gets.chomp.downcase
    break if (lang == 'de' || lang == 'eng')
    puts
    puts "Bad input."
    puts
  end
  
  messages = MESSAGES[lang].values
  LOCMESS.each_key { |key| LOCMESS[key] = messages.shift }
end
       


def number?(input)
  (input.to_i.to_s == input || input.to_f.to_s == input)
end

def get_nums()
  puts "#{LOCMESS['fnum']}"
  num1 = Kernel.gets().chomp()
  puts "#{LOCMESS['snum']}"
  num2 = Kernel.gets().chomp()

  if (number?(num1) && number?(num2))
    return [num1.to_f, num2.to_f]
  else
    puts "#{LOCMESS['wrong_input']}" 
    get_nums()
  end
end


def get_operation()
  puts "#{LOCMESS['what_op']}"

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

  return puts "#{LOCMESS['div_0']}" if (num2 == 0 && operation == :div)
  
  mess = LOCMESS['final_result'] 

  case operation
    when :multi then puts "#{mess}#{num1 * num2}"
    when :add then puts "#{mess}#{num1 + num2}"
    when :sub then puts "#{mess}#{num1 - num2}"
    when :div then puts "#{mess}#{num1 / num2}"
  end
end

def calc()
  set_lang()
  loop do
    perform_operation(get_nums, get_operation)
    puts "#{LOCMESS['new_calc?']}"
    ans = Kernel.gets.chomp.downcase
    break if ans.start_with?('n')
  end 
end

