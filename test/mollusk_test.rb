require_relative 'test_helper'
require 'minitest/autorun'

class TestMollusk < MiniTest::Test
  def test_single_filter
    star_trek_ships = Starship.star_trek.map { |s| s[:class] }
    assert_equal ['Constitution'], star_trek_ships
  end

  def test_chained_filter
    star_wars_fighters = Starship.star_wars.fighters.map { |s| s[:class] }.sort
    assert_equal ['Tie Fighter', 'X-Wing'], star_wars_fighters
  end
end
