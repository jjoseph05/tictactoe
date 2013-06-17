require 'test/unit'
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'game')) # require './../lib/game'

class GameTest < Test::Unit::TestCase
  def setup
    @game = Game.new
  end

  def test_total_players
    assert_equal 2, @game.players.length
  end

  def test_current_player_starts_with_X
    assert_equal "X", @game.current_player.to_s
  end

  def test_play_updates_grid
    expected = <<-BOARD
X--
---
---
    BOARD

    @game.play(0, 0)
    assert_equal expected, @game.board.to_s

    expected = <<-BOARD
X--
---
--O
    BOARD

    @game.play(2, 2)
    assert_equal expected, @game.board.to_s
  end

  def test_play_alternates_current_player
    @game.play(0, 0)
    assert_equal "O", @game.current_player.to_s

    @game.play(2, 2)
    assert_equal "X", @game.current_player.to_s
  end
end
