require 'test/unit'
require_relative '../building'

class BuildingsTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @point_a = Point.new(3456433.163000,5430249.143000,126.410000)
    @point_b = Point.new(3456428.155000,5430250.332000,126.410000)

    @point_list = Array.new
    @point_list.push(@point_a)
    @point_list.push(@point_b)
    @point_list.push(@point_a)

    @polygon_a = Polygon.new(@point_list)

  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  def test_correct_list
    assert_equal(@polygon_a.polygon_points, @point_list, "Yeah")
  end

  def test_closed
    assert @polygon_a.is_closed?
  end



end