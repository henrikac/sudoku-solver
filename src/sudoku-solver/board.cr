class Sudoku::Board
  # Default number of rows and columns.
  SIZE = 9
  # Empty field value.
  EMPTY = 0

  # Creates a new sudoku board where all fields are set to 0.
  def initialize
    @board = Array(Array(Int32)).new(SIZE) { Array(Int32).new(SIZE) { EMPTY } }
  end

  # Creates a new sudoku board
  def initialize(@board : Array(Array(Int32))); end

  # Returns the element at the given *index*.
  def [](index : Int)
    @board[index]
  end

  # Sets the given *value* at the given *index*.
  def []=(index : Int, value : Int32)
    @board[index] = value
  end

  # Returns `true` if `self` if empty, `false` otherwise.
  def empty?
    @board.each do |row|
      row.each do |field|
        return false if field != EMPTY
      end
    end
    return true
  end

  # Returns an `Array` with all the rows in the sudoku board.
  def to_a
    @board
  end
end