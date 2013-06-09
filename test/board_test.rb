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
end
