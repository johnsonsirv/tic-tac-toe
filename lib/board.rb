class Board
  attr_accessor :state

  def initialize
    @count_of_elem = 0
    @state = (1..9).to_a
  end

  def full?
    @state.length.eql?(@count_of_elem)
  end

  def position_is_free?(position)
    @state[position].is_a? Integer
  end

  def update_state(symbol, position)
    
  end
  
  def increment_count_elem
    @count_of_elem += 1
  end
end