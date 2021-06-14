# sudoku-solver

Sudoku solver - inspired by [Tech With Tim](https://www.youtube.com/channel/UC4JX40jDee_tINbkjycV4Sg).

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     sudoku-solver:
       github: henrikac/sudoku-solver
   ```

2. Run `shards install`

## Usage

```crystal
require "sudoku-solver"

input = [
  [5, 3, 0, 0, 7, 0, 0, 0, 0],
  [6, 0, 0, 1, 9, 5, 0, 0, 0],
  [0, 9, 8, 0, 0, 0, 0, 6, 0],
  [8, 0, 0, 0, 6, 0, 0, 0, 3],
  [4, 0, 0, 8, 0, 3, 0, 0, 1],
  [7, 0, 0, 0, 2, 0, 0, 0, 6],
  [0, 6, 0, 0, 0, 0, 2, 8, 0],
  [0, 0, 0, 4, 1, 9, 0, 0, 5],
  [0, 0, 0, 0, 8, 0, 0, 7, 9]
]
board = Sudoku::Board.new(input)

if Sudoku::Solver.solve(board) # solves in place
  puts "solved!"
else
  puts "not solved!"
end
```

#### Exceptions
+ A `Sudoku::EmptyBoardError` is raised if the user tries to solve an empty sudoku board.
+ A `Sudoku::InvalidBoardError` is raised if a user tries to create a sudoku board with the wrong dimensions (must be 9x9).

## Contributing

1. Fork it (<https://github.com/henrikac/sudoku-solver/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Henrik Christensen](https://github.com/henrikac) - creator and maintainer
