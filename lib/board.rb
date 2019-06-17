class Board
  attr_accessor :state

  def initialize
    @count_of_elem = 0
    @state = (1..9).to_a
  end

end