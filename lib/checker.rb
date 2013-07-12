class Checker

	def initialize(board)
		@board = board
		@winner
		@rows = [[0,1,2], [3,4,5], [6,7,8]]
		@columns = [[0,3,6], [1,4,7], [2,5,8]]
		@diagonals = [[0,4,8], [2,4,6]]
		@lines = @rows + @columns+ @diagonals
	end

	def lines
		@lines
	end

	def winner
		@winner
	end

	def board
		@board
	end

	def rows
		@rows
	end

	def columns
		@columns
	end

	def diagonals
		@diagonals
	end

	def winning_line?
		flag = false
		@lines.each do |line|
			if line_filled?(line) && line_values(line).uniq.size == 1
				flag=true
				@winner = line_values(line).uniq
				break
			end
		end
		flag
	end

	def line_values(line)
		actual_line=[]
		line.each do |cell|
			actual_line << @board.check_cell(cell)
		end
		actual_line
	end

	def line_filled?(line)
		line.all?{|cell| @board.cell_filled?(cell)}
	end

end