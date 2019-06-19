require '../lib/game'
require '../lib/board'
require '../lib/player'
require '../lib/game_cli'


def main
  player_1 = Player.new("Victor", "X")
  player_2 = Player.new("Ojohny", "O")
  board = Board.new
  game = Game.new(player_1, player_2, board)

  game.start
end

main



