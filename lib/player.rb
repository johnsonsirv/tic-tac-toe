# require './lib/game_cli'

class Player
  include UserInterface
  attr_accessor :symbol
  
  def initialize(symbol)
   @symbol = symbol
  end

  
  def play(current_symbol)
    my_next_move = nil
    if my_turn?(current_symbol)
      my_next_move = ask_position(@symbol)
    end
    my_next_move
  end


  private  
  def my_turn?(current_symbol)
    @symbol.eql?(current_symbol) ? true : false
  end
end