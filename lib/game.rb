# require './lib/game_cli'

class Game
  # include UserInterface
  @@game_symbols = ["X","O"]
  attr_accessor :player_one, :player_two, :board
  
  def initialize(player_one, player_two, board)
    @player_one = player_one
    @player_two = player_two
    @board = board
  end

  def choose_first_player_symbol
    @@game_symbols[rand(2)]
  end
  
end