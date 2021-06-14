require "./sudoku-solver/**"

# TODO: Write documentation for `Sudoku::Solver`
module Sudoku::Solver

  def self.solve(board : Sudoku::Board) : Bool
    coords_empty_field = find_empty_field(board)
    return true if coords_empty_field.nil?

    row, col = coords_empty_field
    guess = 1

    loop do
      if valid_try(board, coords_empty_field, guess)
        board[row][col] = guess

        return true if solve(board)

        board[row][col] = 0
      end

      guess += 1
      break if guess == 10
    end

    return false
  end

  private def self.valid_try(board : Sudoku::Board, coords : Tuple(Int32, Int32), num : Int32) : Bool
    row = board[coords[0]]
    col = board.get_column(coords[1])

    return false if row.includes?(num)
    return false if col.includes?(num)

    region = board.get_region(coords)

    return false if region.includes?(num)

    return true
  end

  private def self.find_empty_field(board : Sudoku::Board) : Nil | Tuple(Int32, Int32)
    board.to_a.each_with_index do |row, i|
      row.each_with_index do |field, j|
        return {i, j} if board[i][j] == Sudoku::Board::EMPTY_FIELD
      end
    end
    return nil
  end
end
