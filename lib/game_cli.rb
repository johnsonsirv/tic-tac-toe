# frozen_string_literal: true
module UserInterface
  VALID_MOVES = (1..9)
  def show_board(state)
    board = ""
    grid_board = board.dup
    row_1 = " #{state[0]} | #{state[1]} | #{state[2]} \n"
    line = "-----------\n"
    row_2 = " #{state[3]} | #{state[4]} | #{state[5]} \n"
    row_3 = " #{state[6]} | #{state[7]} | #{state[8]} \n"
    grid_board << row_1 << line
    grid_board << row_2 << line
    grid_board << row_3 << line
    
    puts grid_board
  end

  def is_valid_move?(move)
    return true if VALID_MOVES.cover? move
    false
  end

end