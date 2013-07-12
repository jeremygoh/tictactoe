require 'checker'

describe Checker do
let(:checker){Checker.new(:board)}

it "should be initialised with a nil variable of winner" do
	checker.winner.should be_nil
end

it "should be initialized with a board which should be accessible" do
	checker1 = Checker.new(:board)
	checker1.board.should_not be_nil
end

it "should be initialized with a set of rows as an array" do
	checker.rows.should eq [[0,1,2], [3,4,5],[6,7,8]]
end

it "should be initialized with a set of columns as an array" do
	checker.columns.should eq [[0,3,6], [1,4,7], [2,5,8]]
end

it "should be initialized with diagnoals as an array" do
	checker.diagonals.should eq [[0,4,8], [2,4,6]]
end	

it "should have an instance variable called lines which is the sum of rows, columns and diags" do
	checker.lines.should eq [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
end


it "should check for the values of a line" do
	board = double :board
	checker1 = Checker.new(board)
	board.should_receive(:check_cell).exactly(3).times
	checker1.line_values([1,2,3]).size.should eq 3
end

it "should check a line to see if it hass been filled" do
	board = double :board
	checker1 = Checker.new(board)
	board.should_receive(:cell_filled?)		##.all? only uses method once?!
	checker1.line_filled?([1,2,3])
end

it "should check for lines for a winning line, i.e. one where a line is filled in and uniq values is 1
and store the winning mark in @winner" do
	board = double :board
	checker1 = Checker.new(board)
	board.should_receive(:cell_filled?).exactly(8).times
	checker1.winning_line?
end	

end