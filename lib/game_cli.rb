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

  def ask_position(player)
    print "#{player} your turn: "
    move = gets.chomp.to_i
    unless is_valid_move?(move)
      loop do
        print "#{player} try again. you entered invalid input choose 1 - 9 (unoccupied): "
        move = gets.chomp.to_i
        break if is_valid_move?(move)
      end
    end

    move - 1
  end

end
