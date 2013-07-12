require 'board'

describe Board do
let(:board){Board.new}

it "should contain nine cells by default" do
	board.cells.size.should eq 9
end

it "can fill a cell" do
	cell = double :cell
	cell.should_receive(:fill).with("O")
	board.cells << cell  #so this has index 9
	board.fill_cell(9, "O")
end

it "can check the state of a cell" do
	cell = double :cell
	cell.should_receive(:state)
	board.cells << cell
	board.check_cell(9)
end

it "can check if a cell has been filled" do
	cell = double :cell
	cell.should_receive(:filled?)
	board.cells << cell
	board.cell_filled?(9)
end
end
