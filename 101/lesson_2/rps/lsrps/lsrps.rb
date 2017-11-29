RPS = %w(rock paper scissors) 


def display_results(choice, computer_choice)
  if (choice == 'rock' && computer_choice == 'scissors') ||
      (choice == 'paper' && computer_choice == 'rock') ||
      (choice == 'scissors' && computer_choice == 'paper')
    prompt("You won!")
  elsif (choice == 'rock' && computer_choice == 'paper') ||
          (choice == 'paper' && computer_choice == 'scissors') ||
          (choice == 'scissors' && computer_choice == 'rock') 
      prompt("You lose...")
  else
    prompt("It's a tie.")
  end
end


def test_method
  prompt('test message')
end

test_method

def prompt(message)
  puts "==> #{message}"
end

loop do
  choice = ''
  loop do 
    prompt("Choose one: #{RPS.join(', ')}") 
    choice = gets.chomp
  
    if RPS.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end
    
  computer_choice = RPS.sample
    
  prompt("You chose #{choice}. The computer chose #{computer_choice}")
  
  display_results(choice, computer_choice) 

  prompt("Do you want to play again?")
  answer = gets.chomp.downase

  break unless answer.start_with?('y')
  
end 
  
prompt("Thanks for playing.")
