# start
# It decides player turn (random chooses the first player - symbol)

# in play
# It asks player to play
# It places move on board if position is free
# it decides gameover? when winner, board is full

# gameover
# it decides winner baased on win combinations

# classs = {
#   win: [ [1,2,3],[4,5,6],[7,8,9] ]
# }

require './lib/game'
require './lib/board'
require './lib/player'

player_1 = Player.new("X")
player_2 = Player.new("O")
board = Board.new
game = Game.new(player_1, player_2, board)

game.start


