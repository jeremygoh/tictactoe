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

end
