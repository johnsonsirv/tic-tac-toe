# require './lib/game_cli'

class Game
  # include UserInterface
  attr_accessor :player_one, :player_two, :board, :play_turn
  
  @@game_symbols = ["X","O"]
  WINNING_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],
    [0,3,6], [1,4,7], [2,5,8],
    [0,4,8], [2,4,6]
  ].freeze

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

  def make_move(player, position)
    @board.update_state(player.symbol, position)
  end

  def won?(player)
    (player.game_moves.combination(3).to_a & WINNING_COMBINATIONS).size > 0
  end

  def draw?
    return true if @board.full?
    false
  end

  private
  def choose_first_play_symbol
    @@game_symbols[rand(2)]
  end
  
  def player_turn
    @play_turn = @play_turn.eql?(1) ? 0 : 1
  end
end
