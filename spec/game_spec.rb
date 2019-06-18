require './lib/game'
require './lib/board'
require './lib/player'


# Game Controller
RSpec.describe Game do
  before do 
    @player_one = Player.new("X")
    @player_two = Player.new("O")
    @board = Board.new
    @game = Game.new(@player_one, @player_two, @board)
  end
  
  describe '#game controller' do
    context '#game start' do
      it 'decides first player symbol' do
        first_player_symb = @game.choose_first_player_symbol
        expect(@board.state.include?(first_player_symb)).to eql(false)
      end
      it 'passes game turn between player 1 and player 2' do
        
      end
    end
    context '#game in play' do
      it 'places the player\'s move on the board if position is free' do
        
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