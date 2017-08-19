require 'yaml'

MESSAGES = YAML.load_file('mortgage.yaml')

# two lambdas to be passed to get_datum and used to check for valid input
@number = lambda do |input|
  (input.to_i.to_s == input || input.to_f.to_s == input)
end

@percentage = lambda do |input|
  ((@number.call input) && (input.to_f.between?(0, 100)))
end

# three tiny methods to make code a bit clearer
def monthly_rate(annual_rate)
  annual_rate / 12.0
end

# to convert 5% given by human into 0.05%
def human_to_comp_interest(rate)
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

  rate = monthly_rate(human_to_comp_interest(rate)).round(2)
  duration = to_months(duration)
  return loan_amount, rate, duration 
end


def calc_repayments(amount, rate, duration)
  monthly_payment = (amount * (rate / (1 - (1 + rate)**(duration * -1)))).round(2)
end

def mortgage()
  details = get_loan_details()
  payment = calc_repayments(details[0], details[1], details[2])
  print mess('pay_fh') 
  print "#{payment}"
  puts mess('pay_sh')
end 
