require './bin/game_cli'

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

  describe '#ask_Player_input for different game moves a player makes', :ui_tests => :ui do
    it 'returns true if players input is valid move (1..9)' do
      expect(is_valid_move?(10)).to be_falsy
    end
  end

  describe '#show_board_occupied_warning', :ui_tests => :ui do
    it 'should display warning position is occupied!! player name try again' do
      output = capture_puts{ show_board_occupied_warning('Vic') }
      rows = output.split("\n")
      expect(rows[0]).to eq("warning position is occupied!! Vic try again ")
    end
  end

  describe '#show_gameover_board', :ui_tests => :ui do
    it 'should display Gameover player name Wins!! when game is won' do
      output = capture_puts{ show_gameover_board(true, 'Vic') }
      rows = output.split("\n")
      expect(rows[0]).to eq("Gameover: Vic WINS !!!")
    end
    it 'should display Gameover: Game Draw when game is Draw' do
      output = capture_puts{ show_gameover_board }
      rows = output.split("\n")
      expect(rows[0]).to eq("Gameover: GAME DRAW")
    end
  end

  describe '#ask_player_name', :ui_tests => :ui do
    it 'should display prompt for a player name' do
      output = capture_puts{ ask_player_name('X') }
      rows = output.split("\n")
      expect(rows[0]).to eq("Player 'X' Enter a name: ")
    end
  end

  describe '#board_guide', :ui_tests => :ui do
    it 'should display board guide with symbols and positions' do
      output = capture_puts{ board_guide  }
      rows = output.split("\n")
      expect(rows[2]).to eq(" X | O | X |=>  1 | 2 | 3 ".rjust(49))
    end
  end

  describe '#show_welcome_message', :ui_tests => :ui do
    it 'should display welcom message to players' do
      output = capture_puts{ show_welcome_message  }
      rows = output.split("\n")
      expect(rows[1]).to eq("Tic Tac Toe is a paper-and-pencil game for two players, X and O, ".center(80))
    end
  end


end