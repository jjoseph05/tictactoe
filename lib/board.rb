class Board
  attr_reader :grid

	def initialize
		@grid = [
				['-' , '-' , '-'],
				['-' , '-' , '-'],
				['-' , '-' , '-']
		 ]
	end

  def to_s
  	str = ''

  	@grid.each do |row|

  		row.each do |cell|
  			str << cell
  		end
  		str << "\n"

  	end

  	str
  end


  def make_move(mark, row, column)
  	row_array = @grid[row]
  	if row_array[column] == '-'
	  	row_array[column] = mark
	  else
	  	raise "Cell (#{row}, #{column}) is already occupied"
	  end
  end

  def full?
    @grid.each do |row|
    	row.each do |cell|
    		if cell == '-'
    			return false
    		end
    	end
    end

    return true
  end

  # returns "X", "O" or false
  def winner
    @grid.each do |row|
    	value = check_row(row)
    	if value
    		return value
    	end
    end

    0.upto(2) do |col|
    	value = check_col(col)
    	if value
    		return value
    	end
    end

    value = check_diag_left
    return value if value

    value = check_diag_right
    return value if value

    false
  end

  private

  def check_row(row)
  	last_cell = nil
  	row.each do |cell|
  		if cell == '-'
  			return false
  		elsif last_cell != nil && last_cell != cell
  			return false
  		end

  		last_cell = cell
  	end

  	return last_cell
  end

  def check_col(col)
  	last_cell = nil
  	0.upto(2) do |row|
  		cell = @grid[row][col]
 			if cell == '-'
  			return false
  		elsif last_cell != nil && last_cell != cell
  			return false
  		end

  		last_cell = cell 
  	end

  	last_cell
  end

  def check_diag_left # \
    if @grid[0][0] == '-' || @grid[1][1] == '-' || @grid[2][2] =='-'
      return false
    end

   return @grid[0][0] || @grid[1][1] || @grid[2][2]
  end

  def check_diag_right # /
    if @grid[0][2] == '-' || @grid[1][1] == '-' || @grid[2][0] =='-'
      return false
    end

   return @grid[0][2] || @grid[1][1] || @grid[2][0]
  end


end
  # def put_line
  #   puts '#'*80
  # end

# board = Board.new
# puts board
# puts
# board.make_move('X',0,0)
# board.make_move('X',1,1)
# board.make_move('X',2,2)
# puts board
# puts board.check_diag


