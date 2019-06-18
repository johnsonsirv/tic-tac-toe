require './lib/game'



# Game Controller
RSpec.describe Game do
  before do 
    @board = Board.new
   @game = Game.new("X","Y", @board)
  end
  
  describe '#game controller' do
    context '#game start' do
      it 'decides first player symbol' do
        first_player_symb = @game.choose_first_player_symbol
        expect(@board.sate.include?first_player_symb).to eql(false)
      end
    end
    context '#game in play' do
      it 'places the player\'s move on the board if position is free' do
        
      end
      it 'passes game turn between player 1 and player 2' do
        
      end
      it 'returns gameover when there is a winnner and board is not full' do
        
      end
    end
    context '#game over' do
      it 'returns gameover when board is full and no winner yet in play' do
        
      end
    end
  end

end