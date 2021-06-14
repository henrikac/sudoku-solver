class Sudoku::Board
  # Default number of rows and columns.
  SIZE = 9
  # Empty field value.
  EMPTY_FIELD = 0

  # Creates a new sudoku board where all fields are set to 0.
  def initialize
    @board = Array(Array(Int32)).new(SIZE) { Array(Int32).new(SIZE) { EMPTY_FIELD } }
  end

  # Creates a new sudoku board
  def initialize(@board : Array(Array(Int32)))
    if @board.flatten.size != (SIZE * SIZE)
      raise Sudoku::InvalidBoardError.new("a sudoku board must be #{SIZE}x#{SIZE}")
    end
  end

  # Returns the element at the given *index*.
  def [](index : Int)
    @board[index]
  end

  # Returns the column at the given *index*.
  def get_column(index : Int) : Array(Int32)
    column = Array(Int32).new
    @board.each { |r| column << r[index] }
    return column
  end

  # Returns the 3x3 region that contains the given *coords*.
  def get_region(coords : Tuple(Int32, Int32)) : Array(Int32)
    x = (coords[0] // 3) * 3
    y = (coords[1] // 3) * 3
    x_counter = 0

    region = Array(Int32).new

    loop do
      y_counter = 0
      while y_counter < 3
        region << @board[x + x_counter][y + y_counter]
        y_counter += 1
      end
      x_counter += 1
      break if x_counter == 3
    end

    return region
  end

  # Returns `true` if `self` if empty, `false` otherwise.
  def empty?
    @board.each do |row|
      row.each do |field|
        return false if field != EMPTY_FIELD
      end
    end
    return true
  end

  # Returns an `Array` with all the rows in the sudoku board.
  def to_a
    @board
  end
end