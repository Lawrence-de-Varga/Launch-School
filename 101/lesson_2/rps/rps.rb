require 'yaml'

MESSAGES = YAML.load_file('yrps.yaml')
RPS = %w(r p s l sp)
VICTORY_CONDITIONS = { 'r' => %w(s l),
                       'p' => %w(r sp),
                       's' => %w(p l),
                       'l' => %w(sp p),
                       'sp' => %w(s r) }

# Just two helpers
def refresh_display
  (system('clear') || system('cls'))
end

def message(key)
  MESSAGES[key]
end

# constructs a variable message to display the results of the game.
def print_round_result(choices, result, player_score, computer_score)
  puts 'You chose ' + message(choices[0]) +
       'The computer chose ' + message(choices[1]) + message(result) +
       " The scores are :: You: #{player_score}. Computer: #{computer_score}."
end

# Returns an array containing the player and computer choices
def make_choices
  puts message('player_options')
  choice = gets.chomp.downcase
  return [choice, RPS.sample] if RPS.include?(choice)

  puts message('bad_player_options')
  make_choices
end

# returns true if the player wants to play again, else false
def another_game?
  loop do
    puts message('go_again')
    answer = gets.chomp.downcase

    next puts message('bad_input_go_again') unless answer.start_with?('y', 'n')
    break answer.start_with?('y') ? true : false
  end
end

# The next two method combine to determine the result of the match
def player_win?(player, computer)
  VICTORY_CONDITIONS[player].include?(computer)
end

def game_result(choices)
  player, computer = choices[0], choices[1]

  case player
  when computer then 'draw'
  when player_win?(player, computer) then 'win'
  else 'lose'
  end
end

def update_scores(scores, result)
  case result
  when 'win' then [scores[0] + 1, scores[1]]
  when 'lose' then [scores[0], scores[1] + 1]
  else scores
  end
end

# Plays a single round of rps
def play_round(scores)
  choices = make_choices
  result = game_result(choices)
  scores = update_scores(scores, result)
  print_round_result(choices, result, scores[0], scores[1])
  scores
end

# string used when a match (5 games) has been won.
def victor_string(scores)
  message(scores[0] == 5 ? 'match_won' : 'match_lost')
end

def play_match(scores)
  refresh_display
  loop do
    puts message('new_game')
    scores = play_round(scores)
    break puts victor_string(scores) if scores.include(5)

    puts message('next_round')
    refresh_display if gets
  end
end

def play_game
  refresh_display
  puts message('welcome')
  play_match([0, 0])
  play_match([0, 0]) if another_game?
  puts message('exit')
end

play_game
