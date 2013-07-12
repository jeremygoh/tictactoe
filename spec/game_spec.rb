require 'game'

describe Game do
let(:game){Game.new}

it "should initialize with an empty array of players" do
	game.players.should eq []
end

it "should initialize with a board" do
	game.board.should_not be_nil
end

it "should initialize with an array of possible marks, i.e. O and X" do
	game.marks.should eq ["X", "O"]
end

it "should initialize with an empty array for turns which should be accessible" do
	game.turn.should eq []
end

it "should initialize with a checker" do
	game.checker.should_not be_nil
end

it "should allow a player to be added, taking in a name as an argument, creating a new player instance which is added to @players
and which randomly selects a mark, and which is then deleted from marks" do
	game.add_player(:name)
	game.players.size.should eq 1
	game.marks.size.should eq 1
end

it "should allow a player to be added and add them to the turn array" do
	game.add_player(:name)
	game.turn.size.should eq 1
end

it "should not allow more than two players to be added" do
	game.add_player(:name)
	game.add_player(:name)
	expect{game.add_player(:name)}.to raise_error("Can't have more than two players!")
end

it "should be able to determine whose turn it is, this should alternate" do
	game.add_player(:name1)
	game.add_player(:name2)
	game.whose_turn.should eq :name1
	game.whose_turn.should eq :name2
	game.whose_turn.should eq :name1
	game.whose_turn.should eq :name2
 end





# it "should add a board when setting up which is then accessible" do
# 	game = Game.new
# 	game.board.should eq nil
# 	game.setup(:player1, :player2)
# 	game.board.should_not eq nil
# end

# it "should have players after setting up which are then accessible" do
# 	game = Game.new
# 	game.players.should eq nil
# 	game.setup(:player1, :player2)
# 	game.players.should_not eq nil
# end

# it "should have an array called mark which contains X and O" do

# end


end