# require './lib/game_cli'

class Game
  # include UserInterface
  @@game_symbols = ["X","O"]
 
  attr_accessor :player_one, :player_two, :board, :play_turn
  
  def initialize(player_one, player_two, board)
    @player_one = player_one
    @player_two = player_two
    @board = board
    @play_turn = 0
  end

  def first_player
    @player_one.symbol.eql?(choose_first_play_symbol) ? @player_one : @player_two
  end

  def current_player
   player_turn.zero? ? @player_one : @player_two
  end



  private
  def choose_first_play_symbol
    @@game_symbols[rand(2)]
  end
  
  def player_turn
    @play_turn = @play_turn.eql?(1) ? 0 : 1
  end
end