class Board
  attr_accessor :state

  def initialize
    @count_of_elem = 0
    @state = (1..9).to_a
  end

  def full?
    
  end

  def position_is_free?(position)
    
  end

  def increment_count_elem
    @count_of_elem += 1
  end
end