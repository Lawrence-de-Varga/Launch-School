require 'yaml'

MESSAGES = YAML.load_file('yrps.yaml')
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
  'You chose ' + message(choices[0]) +
    'The computer chose ' + message(choices[1]) + message(result)
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

  unless repeat.start_with?('y', 'n') 
    puts message('bad_input_go_again')
    return go_again
  end
  repeat.start_with?('y') 
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

# starts the game
def play_game
  refresh_display
  puts message('welcome')

  loop do
    puts message('new_game')
    choices = make_choices
    puts game_result_message(choices, victor(choices))
    break puts message('exit') unless go_again
    refresh_display
  end
end

play_game
