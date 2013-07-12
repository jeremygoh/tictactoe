class Cell

def initialize
	@state=nil
end

def state
	@state
end

def fill(mark)
	if filled?
		raise 
	else	
		@state=mark
	end
end

def filled?
	@state.nil? ? false: true
end

end