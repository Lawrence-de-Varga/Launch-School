require 'yaml'

MESSAGES = YAML.load_file('rps.yaml')
RPS = %w(r p s)

# Just two helpers
def refresh_display
  (system('clear') || system('cls'))
end

def message(key)
  MESSAGES[key]
end

# constructs a variable message to display the results of the game.
def game_result_message(choices, result)
  message('you_chose') + message(choices[0]) +
    message('computer_chose') + message(choices[1]) + message(result)
end

# Returns an array containing the players choice and the computer
# choice as selected by '.sample'
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

  unless %w(y n).include?(repeat)
    puts message('bad_input_go_again')
    return go_again
  end
  repeat == 'y'
end

# the following three methods combine to determine the game result

def player_win?(player, computer)
  (player == 'r' && computer == 's') ||
    (player == 'p' && computer == 'r') ||
    (player == 's' && computer == 'p')
end

def player_lose?(player, computer)
  (player == 'r' && computer == 'p') ||
    (player == 'p' && computer == 's') ||
    (player == 's' && computer == 'r')
end

def victor(choices)
  player = choices[0]
  computer = choices[1]

  case
  when player == computer then 'draw'
  when player_win?(player, computer) then 'win'
  when player_lose?(player, computer) then 'lose'
  end
end

# determines the victor via 'victor' the calls 'game_result_message' to
# print the result and determine whether or not to play again via 'go_again'
def resolve(choices)
  puts game_result_message(choices, victor(choices))
  go_again
end

# starts the game
def play_game
  puts message('new_game')
  # since the last thing called by 'resolve', is the boolean function 'go_again'
  # it can be put it in a conditional
  if resolve(make_choices)
    refresh_display
    play_game
  else
    puts message('exit')
  end
end

refresh_display
puts message('welcome')
play_game
