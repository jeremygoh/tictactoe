require 'player'

describe Player do

it "should initialize with a name" do
	Player.new(:name, :board, :mark)
end

it "should have an accessible name" do
	player = Player.new("bob", :board, :mark)
	player.name.should eq "bob"
end

it "should initialize with a board and this should be accessible" do
	player =Player.new(:name, :board, :mark)
	player.board.should eq :board
end

it "should initialize with a mark and this should be accessible" do

end

it "should be able to fill in its board with its mark" do
	board = double :board
	board.should_receive(:fill_cell).with(0, "X")
	player = Player.new(:name, board, "X")
	player.fill(0)
end



end