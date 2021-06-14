module Sudoku
  # Generic error.
  class Error < Exception
  end

  # Exception raised when sudoku cannot be empty.
  class EmptyBoardError < Error
  end

  # Exception raised when invalid board is encountered.
  class InvalidBoardError < Error
  end
end