require './lib/game_cli'

#configure module for ui tests
RSpec.configure do |c|
  c.include UserInterface, :ui_tests => :ui
end

#game CLI
RSpec.describe UserInterface do
  let (:empty_state) {[""]*9}
  let (:game_won_state) {["O"]*3}
  let (:game_draw_state) {[""]}
  let (:board_full_state) {["X","O","O","O","X","X","O","X","O"]}
  
  describe '#show_board in different Game Board situations on CLI', :ui_tests => :ui do
    it 'prints a blank board when the board state is empty' do
      output = capture_puts{ show_board(empty_state) }
      rows = output.split("\n")
      expect(rows[0]).to eq("  |  |  ")
      expect(rows[1]).to eq("-----------")
      expect(rows[2]).to eq("  |  |  ")
      expect(rows[3]).to eq("-----------")
      expect(rows[4]).to eq("  |  |  ")
    end
    it 'prints a won board when board state is won' do
      output = capture_puts{ show_board(game_won_state) }
      rows = output.split("\n")
      expect(rows[0]).to eq(" O | O | O ")
      expect(rows[1]).to eq("-----------")
      expect(rows[2]).to eq("  |  |  ")
      expect(rows[3]).to eq("-----------")
      expect(rows[4]).to eq("  |  |  ")
    end
    it 'prints a full board when the board state is full' do
      output = capture_puts{ show_board(board_full_state) }
      rows = output.split("\n")
      expect(rows[0]).to eq(" X | O | O ")
      expect(rows[1]).to eq("-----------")
      expect(rows[2]).to eq(" O | X | X ")
      expect(rows[3]).to eq("-----------")
      expect(rows[4]).to eq(" O | X | O ")
    end
  end

  describe '#valid_input for different game moves a user makes', :ui_tests => :ui do
    it 'asks player for input and return true if input is valid move (1..9)' do
      expect(is_valid_move?(10)).to be_falsy
    end
  end
end