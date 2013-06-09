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
end
