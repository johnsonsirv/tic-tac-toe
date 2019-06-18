require './lib/game_cli'

class Game
  include UserInterface
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

  def start
    show_board(@board.state)
    first_player = first_player
    first_player.play(f_player.symbol)
    
    #game_loop_here

    c_player = current_player
    c_player.play(c_player.symbol)


    show_gameover_status
  end

  def first_player
    if @player_one.symbol.eql?(choose_first_play_symbol)
      @play_turn = 0
      return @player_one
    else
      @play_turn = 1
      return @player_two
    end
  end

  def current_player
    swap_player_turn.zero? ? @player_one : @player_two
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

  def game_over?
    won?(@player_one.moves) || won?(@player_two.moves) || draw?
  end

  private
  def choose_first_play_symbol
    @@game_symbols[rand(2)]
  end
  
  def swap_player_turn
    @play_turn = @play_turn.eql?(1) ? 0 : 1
  end

  def show_gameover_status
    if won?(@player_one)
      show_gameover_board(true, @player_one.symbol)
    elsif won?(@player_two)
      show_gameover_board(true, @player_two.symbol)
    else
      show_gameover_board
    end
   
  end

end
