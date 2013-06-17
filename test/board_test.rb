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
    0.upto(2) do |row|
      0.upto(2) do |col|
        assert !@board.full?
        @board.make_move("X", row, col)
      end
    end

    assert @board.full?
  end

  def test_winner_col
    assert !@board.winner

    @board.make_move("X", 0, 0)
    assert !@board.winner

    @board.make_move("X", 1, 0)
    assert !@board.winner

    @board.make_move("X", 2, 0)
    assert_equal "X", @board.winner
  end

  def test_winner_row
    assert !@board.winner

    @board.make_move("X", 0, 0)
    assert !@board.winner

    @board.make_move("X", 0, 1)
    assert !@board.winner

    @board.make_move("X", 0, 2)
    assert_equal "X", @board.winner
  end

  def test_winner_diag_left
    assert !@board.winner

    @board.make_move("X", 0, 0)
    assert !@board.winner

    @board.make_move("X", 1, 1)
    assert !@board.winner

    @board.make_move("X", 2, 2)
    assert_equal "X", @board.winner
  end

  def test_no_winner_diag_left
    assert !@board.winner

    @board.make_move("X", 0, 0)
    assert !@board.winner

    @board.make_move("O", 1, 1)
    assert !@board.winner

    @board.make_move("X", 2, 2)
    assert !@board.winner
  end

  def test_winner_diag_right
    assert !@board.winner

    @board.make_move("X", 0, 2)
    assert !@board.winner

    @board.make_move("X", 1, 1)
    assert !@board.winner

    @board.make_move("X", 2, 0)
    assert_equal "X", @board.winner
  end

  def test_no_winner_diag_right
    assert !@board.winner

    @board.make_move("X", 0, 2)
    assert !@board.winner

    @board.make_move("O", 1, 1)
    assert !@board.winner

    @board.make_move("X", 2, 0)
    assert !@board.winner
  end
end
