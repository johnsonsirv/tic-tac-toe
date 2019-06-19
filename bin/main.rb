require '../lib/game'
require '../lib/board'
require '../lib/player'
require '../lib/game_cli'

extend UserInterface

def start_game
  show_welcome_message

  player_one_name = ask_player_name('X')
  player_two_name = ask_player_name('O')
  
  player_1 = Player.new(player_one_name, "X")
  player_2 = Player.new(player_two_name, "O")
  board = Board.new
  game = Game.new(player_1, player_2, board)

  game.start
end

# the game starts from here
start_game



