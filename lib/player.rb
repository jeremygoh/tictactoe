class Player

def initialize(name, board, mark)
	@name = name
	@board = board
	@mark = mark
end

def board
	@board
end

def name
	@name
end

def mark
	@mark
end

def fill(cell_index)
	@board.fill_cell(cell_index, @mark)
end

end