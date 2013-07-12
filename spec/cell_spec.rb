require 'cell'

describe Cell do
let(:cell){Cell.new}

it "should be nil by default" do
	cell.state.should eq nil
end

it "should be able to be changed to capital O" do
	cell.fill("O")
	cell.state.should eq "O"
end

it "should be able to be changed to capital X" do
	cell.fill("X")
	cell.state.should eq "X"
end

it "should be able to say if it has already been filled in, no by default" do
	cell.should_not be_filled
end

it "should be able to say it if has been filled in" do
	cell.fill("X")
	cell.should be_filled
end

it "can't be filled if it has already been filled in" do
	cell.fill("X")
	expect{cell.fill("O")}.to raise_error("Cell already filled in.")
end

end