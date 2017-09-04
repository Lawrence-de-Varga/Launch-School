require 'yaml'
require 'pry'

MESSAGES = YAML.load_file('rps.yaml')
RPS = ['r', 'p', 's']

# Just two helpers
def system_clear
  (system('clear') || system('cls'))
end

def message(key)
  MESSAGES[key] 
end

# constructs a variable message to be displayed at the end of the game.
def game_result_message(choices, result)
  message('you_chose') + message(choices[0]) + message('computer_chose') + message(choices[1]) + message(result)
end 

def make_choices
  puts message('make_player_choice')
  choice = gets.chomp.downcase
  return [choice, RPS.sample] if RPS.include?(choice)

  puts message('bad_player_choice')
  make_choices
end

# returns true if the player wants to play again, else false
def go_again
  puts message('go_again')
  repeat = gets.chomp.downcase
  
  unless ['y','n'].include?(repeat)
    puts message('bad_input_go_again')
    return go_again
  end
  repeat == 'y' ? true : nil
end

# returns 'draw', 'win', or 'lose'
def victor(choices)
  player = choices[0]
  computer = choices[1]
  
  case
  when player == computer then 'draw'
  when player == 'r' && computer == 's' then 'win'
  when player == 'r' && computer == 'p' then 'lose'
  when player == 'p' && computer == 'r' then 'win'
  when player == 'p' && computer == 's' then 'lose'
  when player == 's' && computer == 'p' then 'win'
  when player == 's' && computer == 'r' then 'lose'
  end
end

# determines the victor via 'victor' the calls 'game_result_message' to print the result
# and determine whether or not to play again via 'go_again'
def resolve(choices)
  puts game_result_message(choices, victor(choices))
  go_again
end

# starts the game
def play_game
  puts message('new_game')  
  # since the last thing called by 'resolve', is the boolean function 'go_again' we can
  # put it in a conditional
  if resolve(make_choices)
    system_clear
    play_game
  else
    puts message('exit')
  end
end

system_clear
puts message('welcome')
play_game
