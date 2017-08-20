require 'yaml'

MESSAGES = YAML.load_file('mortgage.yaml')

# two procs to be passed to get_datum and used to check for valid input 
# they are @vars because I can't figure out how to get pry(or irb) to 
# recognise them for testing otherwise. 
@number = Proc.new do |input|
  (input.to_i.to_s == input || input.to_f.to_s == input)
end

@percentage = Proc.new do |input|
  ((@number.call input) && (input.to_f.between?(0, 100)))
end

# three tiny methods to make code a bit clearer
def monthly_rate(annual_rate)
  annual_rate / 12.0
end

# to convert 5% given by human into 0.05%
# no percent sign given in input 
def change_rate_form(rate)
  rate / 100.0
end

def to_months(years)
  years * 12
end

# just to make code clearer
def mess(key)
  MESSAGES[key]
end

# abstracted the acquisition of one input value
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

  rate = monthly_rate(change_rate_form(rate))
  duration = to_months(duration)
  return loan_amount, rate, duration 
end


def calc_repayments(amount, rate, duration)
  monthly_payment = (amount * (rate / (1 - (1 + rate)**(duration * -1))))
end

def mortgage()
  details = get_loan_details()
  payment = calc_repayments(details[0], details[1], details[2]).round(2)
  puts "#{mess('pay_fh')} #{payment} #{mess('pay_sh')}"
end 

loop do
  puts "Would you like to calculate a mortgage repayment?"
  ans = gets.chomp.downcase
  break unless ans.start_with?('y')
  mortgage()
  puts
end
