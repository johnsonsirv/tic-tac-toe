class Player
 attr_accessor :symbol
  
  def initialize(symbol)
   @symbol = symbol
  end

  
  def play(current_symbol)
    my_turn?(current_symbol) ? true : false
  end


  private  
  def my_turn?(current_symbol)
    @symbol.eql?(current_symbol) ? true : false
  end
end