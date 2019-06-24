require './lib/board'

RSpec.describe Board do
  before { @board = Board.new  }
  
 
    context '#full?' do
      it 'should return true if all board state has been filled with X or O; otherwise false' do
        0.upto(8) { |i| @board.update_state("X", i) }
        expect(@board.full?).to eql(true)
      end
      it 'should return false if board state has not been filled with X or O' do
        0.upto(6) { |i| @board.update_state("X", i) }
        expect(@board.full?).to eql(false)
      end
    end
    context '#position_is_free?' do
      it 'should return true if specified position is NOT occupied' do
        @board.state[6] = "O"
        expect(@board.position_is_free?(4)).to eql(true)
      end
      it 'should return false if specified position is occupied' do
        @board.state[6] = "O"
        expect(@board.position_is_free?(6)).to eql(false)
      end
    end
    context '#update_state' do
      it 'should update board state at player position with their symbol' do
        @board.update_state("X", 5)
        expect(@board.state[5]).to eql("X")
      end
    end
 
  
end