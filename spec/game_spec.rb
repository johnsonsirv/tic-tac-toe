require './lib/game'
require './lib/board'
require './lib/player'


# Game Controller
RSpec.describe Game do
  before do 
    @player_one = Player.new("vic","X")
    @player_two = Player.new("oj","O")
    @board = Board.new
    @game = Game.new(@player_one, @player_two, @board)
  end
  
  describe '#game controller' do
    context '#game start' do
      describe '#first_player' do
        it 'decides first player based on random symbol chosen by the game; board state does not contain that symbol' do
          expect(@board.state.include?@game.first_player.symbol).to eql(false)
        end
      end
     describe '#current_player' do
        it 'returns current player by swapping game turn between player 1 and player 2' do
          @game.play_turn = 0
          expect(@game.current_player.symbol).to eql(@player_two.symbol)
        end
     end
    end

    context '#game in play' do
      describe '#position_taken?' do
        it 'returns true/false based on position in board' do
          @board.state[0] = 'X'
          expect(@board.position_is_free?(0)).to be(false)
          expect(@board.position_is_free?(8)).to be(true)
    
        end
      end
      describe '#make_move' do
        it 'positions the player\'s move on the board if position is free; otherwise game ask you for another position' do
          curr_player = @game.current_player
          curr_player_move = curr_player.play(curr_player.symbol)
          @game.make_move(curr_player, curr_player_move) if @board.position_is_free?(curr_player_move)
          expect(@board.state[curr_player_move]).to eql(curr_player.symbol)
        end
      end
    end
    context '#game over' do
      describe '#game_winner?' do
        it 'returns true for a win; otherwise false' do
         0.upto(2) { |indx| @board.state[indx] = 'X'}
         @game.winner_status_update(@player_one)
          expect(@game.winner.symbol).to eql(@player_one.symbol)
        end
      end
      describe '#game_draw?' do
        it 'returns true when board is full and no winner yet in-play' do
          expect(@game.draw?).to be(false)
        end
      end
    end

  end
end
