require 'test/unit'
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'player')) # require './../lib/player'

class PlayerTest < Test::Unit::TestCase
  def setup
    @player = Player.new("X")
  end

  def test_player_to_s
    assert_equal "X", @player.to_s
  end
end
