# frozen_string_literal: true
module UserInterface
  VALID_MOVES = (1..9)
 
  def board_guide
    board = ""
    board_positions = ""
    grid_board = board.dup
    row_1 = " X | O | X |=>  1 | 2 | 3 \n".rjust(50)
    row_2 = " O | O | X |=>  4 | 5 | 6 \n".rjust(50)
    row_3 = " O | X | O |=>  7 | 8 | 9 \n".rjust(50)
    line = "--------------------------\n".rjust(50)
    grid_board << "Board Guide / Board Positions (1 - 9) \n\n".rjust(60)
    grid_board << row_1 << line
    grid_board << row_2 << line
    grid_board << row_3 << line
    grid_board
  end

  def show_welcome_message
    border = "-----------------------------------------------------------------".center(80)
    line1 = "Tic Tac Toe is a paper-and-pencil game for two players, X and O, ".center(80)
    line2 = "who take turns marking the spaces in a 3×3 grid.".center(80)
    line3 = "The player who succeeds in placing three of their marks in a ".center(80)
    line4 = "horizontal, vertical, or diagonal row wins the game.".center(80)
    puts border, line1, line2, line3, line4, border
    puts board_guide
  end
 

  def show_board(state)
    board = ""
    grid_board = board.dup
    row_1 = " #{state[0]} | #{state[1]} | #{state[2]} \n"
    line = "-----------\n"
    row_2 = " #{state[3]} | #{state[4]} | #{state[5]} \n"
    row_3 = " #{state[6]} | #{state[7]} | #{state[8]} \n"
    grid_board << row_1 << line
    grid_board << row_2 << line
    grid_board << row_3
    
    puts grid_board
  end

  def is_valid_move?(move)
    return true if VALID_MOVES.cover? move
    false
  end

  def ask_position(player)
    print "#{player} your turn. choose position: "
    move = gets.chomp.to_i
    unless is_valid_move?(move)
      loop do
        print "#{player} try again. you entered invalid position choose 1 - 9 (unoccupied): "
        move = gets.chomp.to_i
        break if is_valid_move?(move)
      end
    end

    move - 1 #position on board
  end

  def show_gameover_board(won=false, winner=nil)
    status = won ? "Gameover: #{winner} WINS !!!" : "Gameover: GAME DRAW"
    puts status
  end

end
