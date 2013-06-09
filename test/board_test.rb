require 'test/unit'
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'board')) # require './../lib/board'

class BoardTest < Test::Unit::TestCase
  def setup
    @board = Board.new
  end

  def test_board_to_s
    str = @board.to_s
    expected = <<-BOARD
---
---
---
    BOARD

    assert_equal expected, str
  end

  def test_make_move
    @board.make_move("X", 0, 0)
    assert_equal [
      ['X', '-', '-'],
      ['-', '-', '-'],
      ['-', '-', '-']
    ], @board.grid

    @board.make_move("O", 1, 1)
    assert_equal [
      ['X', '-', '-'],
      ['-', 'O', '-'],
      ['-', '-', '-']
    ], @board.grid

    begin
      @board.make_move("X", 1, 1)
      assert false, "no exception raised"
    rescue => e
      assert_equal 'Cell (1, 1) is already occupied', e.message
    end
  end

  def test_full?
    mark = "X"
    0.upto(2) do |row|
      0.upto(2) do |col|

        assert !@board.full?
        @board.make_move(mark, row, col)

        if mark == "X"
          mark = "O"
        else
          mark == "X"
        end
      end
    end

    assert @board.full?
  end

  def test_winner
    assert !@board.winner

    @board.make_move("X", 0, 0)
    assert !@board.winner

    @board.make_move("O", 1, 1)
    assert !@board.winner

    @board.make_move("X", 1, 0)
    assert !@board.winner

    @board.make_move("O", 0, 1)
    assert !@board.winner

    @board.make_move("X", 2, 0)
    assert_equal "X", @board.winner
  end
end
