require './lib/player'



#Player
RSpec.describe Player do
  before do 
    @victor  = Player.new("victor","X")
    @ojhonny  = Player.new("ojohny", "O")
  end
  
  context '#a new player and symbol for the game' do
    it 'creates a new player and set his symbol for the game' do
      expect(@victor.symbol).to eql("X")
      expect(@ojhonny.symbol).to eql("O")
    end
  end
  
  context '#game play for each player' do
    it 'should play if the game passes my symbol' do
      expect(@victor.play("X")).not_to be_nil
      expect(@ojhonny.play("X")).to be_nil
    end
  end
end