require './lib/game_cli'

#configure module for ui tests
RSpec.configure do |c|
  c.include UserInterface, :ui_tests => :ui
end

#game CLI
RSpec.describe UserInterface do
  let (:empty_state) {[" "]}
  let (:game_won_state) {[""]}
  let (:game_draw_state) {[""]}
  let (:board_full_state) {[""]}
  
  describe '#display_board in different Game Board situations', :ui_tests => :ui do
    it 'prints a blank board when the board state is empty' do
      output = capture_puts{ show_board(empty_state) }
      rows = output.split("\n")
      expect(rows[0]).to eq("   |   |   ")
      expect(rows[1]).to eq("-----------")
      expect(rows[2]).to eq("   |   |   ")
      expect(rows[3]).to eq("-----------")
      expect(rows[4]).to eq("   |   |   ")
    end
  end

end