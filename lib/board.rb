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
  	row_array[column] = mark
  end

end
