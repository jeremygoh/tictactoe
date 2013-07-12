class Board

def initialize
	@cells= []
	9.times{|i| @cells << Cell.new}
end

def cells
	@cells
end

def fill_cell(cell_index, mark)
	cell = cells[cell_index]
	cell.fill(mark)
end

def check_cell(cell_index)
	cells[cell_index].state
end

def cell_filled?(cell_index)
	cells[cell_index].filled?
end


end