require 'yaml'

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

# The next two functions make the computer and player choices respectively
def make_computer_choice
  RPS.sample
end

def make_player_choice
  puts message('make_player_choice')
  choice = gets.chomp.downcase
  unless RPS.include?(choice)
    puts message('bad_input_player') 
    return make_player_choice
  end

  choice
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

# returns 0 for a draw, 1 for player win, 2 for player loss
def victor(choices)
  player = choices[0]
  computer = choices[1]
  
  case
  when player == computer then 0
  when player == 'r' && computer == 's' then 1
  when player == 'r' && computer == 'p' then 2
  when player == 'p' && computer == 'r' then 1
  when player == 'p' && computer == 's' then 2
  when player == 's' && computer == 'p' then 1
  when player == 's' && computer == 'r' then 2
  end
end

# Makes 'resolve' (below) less cluttered
def resolve_helper(choices, result)
  puts game_result_message(choices, result)
  go_again
end

# Main function, determines who won and in turn whether to play again 
def resolve(choices)
  result = victor(choices)
  case 
  when result == 0 then resolve_helper(choices, 'draw')
  when result == 1 then resolve_helper(choices, 'win')
  when result == 2 then resolve_helper(choices, 'lose')
  end
end

# starts the game
def play_game
  puts message('new_game')  
  # since the last thing called by 'resolve', is the boolean function 'go_again' we can
  # put it in a conditional
  if resolve([make_player_choice, make_computer_choice])
    system_clear
    play_game
  else
    puts message('exit')
  end
  
end

puts message('welcome')
play_game
