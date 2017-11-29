def gen_indent(num)
  ' ' * num
end

def print_indented_message(message, repeatitions)
  0.upto(repeatitions) {|num| puts "#{gen_indent(num)}#{message}."}
end
