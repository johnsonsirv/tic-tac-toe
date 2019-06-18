# require './lib/game_cli'

class Player
  include UserInterface
  attr_accessor :name, :symbol, :game_moves
  
  def initialize(name, symbol)
   @name = name
   @symbol = symbol
   @game_moves = []
  end

  
  def play(current_symbol, new_move: true)
    my_next_move = nil
    if my_turn?(current_symbol)
      my_next_move = ask_position(@symbol)
      @game_moves << my_next_move if new_move
    end
    my_next_move
  end


  private  
  def my_turn?(current_symbol)
    @symbol.eql?(current_symbol) ? true : false
  end
end