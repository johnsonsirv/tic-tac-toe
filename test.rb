require './lib/game_cli'
include UserInterface

show_welcome_message
show_board([""]*9)
ask_position("vic")
show_gameover_board(false, "vice")