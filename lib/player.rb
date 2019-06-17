class Player
 attr_accessor :symbol
  
  def initialize(symbol)
   @symbol = symbol
  end

  



  private  
  def my_turn?(current_symbol)
    @symbol.eql?(current_symbol) ? true : false
  end
end