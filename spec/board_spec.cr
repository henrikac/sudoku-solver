require "./spec_helper"

FIELDS = [
  [7, 0, 0, 0, 0, 0, 0, 8, 0],
  [2, 0, 3, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 5, 0, 0, 0, 4],
  [0, 0, 0, 0, 0, 0, 0, 6, 0],
  [0, 0, 8, 0, 4, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 0, 0],
  [0, 9, 0, 0, 0, 2, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 1, 0, 0],
  [0, 0, 0, 5, 0, 0, 0, 9, 0],
]

describe Sudoku::Board do
  describe "initialize" do
    it "should initialize a new sudoku board" do
      expected = [
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
      ]
      actual = Sudoku::Board.new.to_a

      actual.size.should eq expected.size
      actual.each_with_index do |row, i|
        row.each_with_index do |item, j|
          expected[i][j].should eq 0
        end
      end
    end

    it "should initialize a new sudoku board with the specified field values" do
      expected = FIELDS
      actual = Sudoku::Board.new(FIELDS).to_a

      actual.size.should eq expected.size
      actual.each_with_index do |row, i|
        row.each_with_index do |item, j|
          expected[i][j].should eq item 
        end
      end
    end
  end

  describe "empty?" do
    it "should return true if sudoku board is empty" do
      board = Sudoku::Board.new

      board.empty?.should be_true
    end

    it "should return false if sudoku board is not empty" do
      board = Sudoku::Board.new(FIELDS)

      board.empty?.should be_false
    end
  end

  describe "[](index)" do
    it "should return the row at the specified index" do
      board = Sudoku::Board.new(FIELDS)

      expected = [0, 0, 8, 0, 4, 0, 0, 0, 0]
      actual = board[4]

      actual.each_with_index do |item, i|
        item.should eq expected[i]
      end
    end
  end

  describe "[]=(index, value)" do
    it "should set the given value at the given index" do
      board = Sudoku::Board.new(FIELDS)

      expected = 2
      
      board[4][0] = 2

      board[4][0].should eq expected
    end
  end

  describe "get_column" do
    it "should return the column at the given index" do
      index = 7
      board = Sudoku::Board.new(FIELDS)

      expected = [8, 0, 0, 6, 0, 0, 0, 0, 9] 
      actual = board.get_column(index)
      
      actual.each_with_index do |item, i|
        item.should eq expected[i]
      end
    end
  end

  describe "get_region" do
    it "should return the region that contains the given coords" do
      tests = [
        {coords: {0, 5}, expected: [0, 0, 0, 0, 0, 0, 0, 5, 0]},
        {coords: {4, 5}, expected: [0, 0, 0, 0, 4, 0, 1, 0, 0]},
        {coords: {7, 8}, expected: [0, 0, 0, 1, 0, 0, 0, 9, 0]},
        {coords: {1, 0}, expected: [7, 0, 0, 2, 0, 3, 0, 0, 0]}
      ]
      board = Sudoku::Board.new(FIELDS)

      tests.each do |test|
        expected = test[:expected]
        actual = board.get_region(test[:coords])

        actual.each_with_index do |item, i|
          item.should eq expected[i]
        end
      end
    end
  end
end