require_relative 'test_helper'
require_relative 'starship'
require 'minitest/autorun'

class TestMollusk < MiniTest::Unit::TestCase
  def test_star_wars_returns_only_x_wing
    star_wars = Starship.star_wars
    assert_equal 1,        star_wars.count
    assert_equal 'X-Wing', star_wars.first[:name]
  end
end
