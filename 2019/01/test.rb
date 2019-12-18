require 'test-unit'
require './solution'

class TestSolution < Test::Unit::TestCase

  def setup
    @solution = Solution.new
  end

  def test_part_one_examples
    assert_equal 2, @solution.part_one(12)
    assert_equal 2, @solution.part_one(14)
    assert_equal 654, @solution.part_one(1969)
    assert_equal 33583, @solution.part_one(100756)
  end

  def test_part_two_examples
    assert_equal 2, @solution.part_two(14)
    assert_equal 966, @solution.part_two(1969)
    assert_equal 50346, @solution.part_two(100756)
  end
end
