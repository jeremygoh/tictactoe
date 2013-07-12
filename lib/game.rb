class Game

attr_accessor :checker, :board

def initialize
	@players=[]
	@board = Board.new
	@marks = ["X", "O"]
	@turn = []
	@checker = Checker.new(@board)
end

def game_over?
	@checker.winning_line?
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
	@turn.first
end

def winner
	winner_name = nil
	@players.each do |player|
		if player.mark == @checker.winner
			winner_name = player.name
			break
		end
	end
	return winner_name
end

def player_mark(player_name, cell_index)
	if game_over?
		raise "The game is over, dude!"
	elsif whose_turn != player_name
		raise "It's not your turn"
	else
		@board.fill_cell(cell_index, player_mark_from_name(player_name))
		player_turn = @turn.shift
		@turn << player_turn
		@board
	end
end

def player_mark_from_name(player_name)
	player_from_name(player_name).mark
end

def player_from_name(player_name)
	player_object = nil
	@players.each do |player|
		if player.name == player_name
			player_object = player
			break
		end
	end
	player_object
end


end