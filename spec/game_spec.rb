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
      describe '#won?' do
        it 'returns true for a win; otherwise false' do
          @board.state = %w[X O X O X X O O X]
          expect(@game.won?).to be(true)
        end
      end
    end
    context '#game over' do
      describe '#full?' do
        it 'returns gameover when board is full and no winner yet in play' do
        
        end
      end
    end

    # context '#winning the game' do
    #     describe 'WIN_COMBINATIONS' do
    #       it 'defines a constant WIN_COMBINATIONS with arrays for each win combination' do
    #         expect(WIN_COMBINATIONS.size).to eq(8)
      
    #         expect(WIN_COMBINATIONS).to include_array([0, 1, 2])
    #         expect(WIN_COMBINATIONS).to include_array([3, 4, 5])
    #         expect(WIN_COMBINATIONS).to include_array([6, 7, 8])
    #         expect(WIN_COMBINATIONS).to include_array([0, 3, 6])
    #         expect(WIN_COMBINATIONS).to include_array([1, 4, 7])
    #         expect(WIN_COMBINATIONS).to include_array([2, 5, 8])
    #         expect(WIN_COMBINATIONS).to include_array([0, 4, 8])
    #         expect(WIN_COMBINATIONS).to include_array([6, 4, 2])
    #       end
    #   end
    # end
  end
end