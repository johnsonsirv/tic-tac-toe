require './lib/board'



#Player
RSpec.describe Board do
  before { @board = Board.new  }
  
  describe '#board state at different situations' do
    context '#full?' do
      it 'should return true if all board state has been filled with X or O; otherwise false' do
        1.upto(9) { @board.increment_count_elem }
        expect(@board.full?).to eql(true)
      end
    end
    context '#position_occupied?' do
      it 'should return true if specified position is occupied; otherwise false' do
        @board.state[6] = "O"
        expect(@board.position_is_free?(6)).to eql(false)
      end
    end
  end

  describe '#update board state' do
    context 'player.play returns a valid move' do
      it 'should update board state at player position with their symbol' do
        
      end
    end
  end
  
end