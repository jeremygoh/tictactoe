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


end