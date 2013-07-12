class Game

def initialize
	@players=[]
	@board = Board.new
	@marks = ["X", "O"]
	@turn = []
	@checker = Checker.new
end

def checker
	@checker
end

def turn
	@turn
end

def board
	@board
end

def players
	@players
end

def marks
	@marks
end

def add_player(name)
	if @players.size==2
		raise "Can't have more than two players!"
	else
		random_mark = @marks.sample
		@players << Player.new(name, @board, random_mark)		##how to write a test to get to this step?
		@marks.delete(random_mark)
		@turn << @players.last.name
	end
end

def whose_turn
	player_turn = @turn.shift
	@turn << player_turn
	player_turn
end






end