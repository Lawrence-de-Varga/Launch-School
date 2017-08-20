require 'yaml'

# the way I set the language is probably inefficient, but I tried doing it myself 
# before reading the LS way. 
MESSAGES = YAML.load_file('mortgage.yaml')

LOCMESS = MESSAGES['used_lang']
def set_lang()
  lang = nil
  loop do 
    puts "Sprichst du Deutsch (DE)? Or do you speak English (EN)?"
    lang = gets.chomp.downcase
    if lang.start_with?('e')
      lang = 'eng'
      break
    end
    if lang.start_with?('d')
      lang = 'de'
      break
    end
    puts "\nBad Input.\n"
  end

  messages = MESSAGES[lang].values
  LOCMESS.each_key { |key| LOCMESS[key] = messages.shift } 
end

# just to make code clearer
def mess(key)
  LOCMESS[key]
end

# two procs to be passed to get_datum and used to check for valid input 
# they are @vars because I can't figure out how to get pry(or irb) with 
# pry -r ./file.rb to recognise them for testing otherwise. 
@number = Proc.new do |input|
  (input.to_i.to_s == input || input.to_f.to_s == input)
end

@percentage = Proc.new do |input|
  ((@number.call input) && (input.to_f.between?(0, 100)))
end


# abstracted the acquisition and validation of one input value
def get_datum(data_request, error, test_proc)
  puts mess(data_request)
  datum = gets.chomp
  return datum if test_proc.call datum
  puts mess(error)
  get_datum(data_request, error, test_proc)
end  


def get_loan_details()
  loan_amount = get_datum('enter_loan', 'bad_loan', @number).to_f
  rate = get_datum('enter_percentage', 'bad_percentage', @percentage).to_f
  duration = get_datum('enter_duration', 'bad_duration', @number).to_f

  rate = rate / 12 / 100 
  duration = duration * 12 
  return loan_amount, rate, duration 
end


def calc_repayment(amount, rate, duration)
  monthly_payment = (amount * (rate / (1 - (1 + rate)**(duration * -1))))
end

def mortgage()
  details = get_loan_details()
  payment = calc_repayment(details[0], details[1], details[2]).round(2)
  puts "#{mess('pay_fh')}#{payment}#{mess('pay_sh')}"
end 

set_lang() 

loop do
  mortgage()
  puts
  puts  "#{mess('start_mess')}" 
  ans = gets.chomp.downcase
  break unless %w(y j ja yes).include?(ans) 
  puts
end
