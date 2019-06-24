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
  
  context '#first_player' do
    it 'should return first player based on random symbol chosen by the game; board state does not contain that symbol' do
      expect(@board.state.include?@game.first_player.symbol).to eql(false)
    end
  end
  context '#current_player' do
    it 'should swap game turn between player 1 and player 2' do
      @game.play_turn = 0
      expect(@game.current_player.symbol).to eql(@player_two.symbol)
    end
 end
  context '#make_move' do
    before do
      @game.make_move(@player_one, 4)
    end
    it 'should position the player\'s move on the board' do
      expect(@board.state[4]).to eql('X')
    end
  end
  context '#winner_status_update' do
    it 'should update game winner to current player if winner moves result to win' do
      0.upto(2) { |indx| @board.state[indx] = 'X'}
      @game.winner_status_update(@player_one)
       expect(@game.winner.symbol).to eql(@player_one.symbol) #winner is player one
    end
    it 'should NOT update winner status when current player move does NOT result to win' do
      @game.winner_status_update(@player_two)
       expect(@game.winner).to be_nil #no winner yet
    end
  end
  context '#draw?' do
    it 'should return true when board is full' do
      0.upto(8) { |i| @board.update_state("O", i) }
      expect(@game.draw?).to be(true)
    end
    it 'should return false when board is NOT full' do
      0.upto(6) { |i| @board.update_state("X", i) }
      expect(@game.draw?).to be(false)
    end
  end
  context '#game_over' do
    it 'should return true when board is full and no winner yet in-play' do
      0.upto(8) { |i| @board.update_state("X", i) }
      expect(@game.game_over?).to be(true)
    end
    it 'should return false when board is NOT full and no winner yet in-play' do
        0.upto(1) { |indx| @board.state[indx] = 'X'}
        expect(@game.game_over?).to be(false)
    end
  end

end
