require_relative '../bin/game_cli'

class Player
  include UserInterface
  attr_reader :name, :symbol 
  
  def initialize(name, symbol)
   @name = name.upcase
   @symbol = symbol
  end

  
  def play(current_symbol)
    my_next_move = nil
    if my_turn?(current_symbol)
      my_next_move = ask_position(@name)
    end
    my_next_move
  end


  private  
  def my_turn?(current_symbol)
    @symbol.eql?(current_symbol) ? true : false
  end
end