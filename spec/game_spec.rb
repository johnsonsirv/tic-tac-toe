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
      it 'decides first player based on random symbol chosen by the game; board state does not contain that symbol' do
        expect(@board.state.include?@game.first_player.symbol).to eql(false)
      end
      it 'returns current player by swapping game turn between player 1 and player 2' do
        @game.play_turn = 0
        expect(@game.current_player.symbol).to eql(@player_two.symbol)
      end
    end
    context '#game in play' do
      it 'positions the player\'s move on the board if position is free; otherwise game ask you for another position' do
        curr_player = @game.current_player
        curr_player_move = curr_player.play(curr_player.symbol)
        @game.make_move(curr_player, curr_player_move) if @board.position_is_free(curr_player_move)
        expect(@board.state[curr_player_move]).to eql(curr_player.symbol)
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