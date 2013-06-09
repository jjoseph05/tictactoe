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
    false
  end

  # returns "X", "O" or false
  def winner
    false
  end
end
