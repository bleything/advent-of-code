require 'test-unit'
require './solution'

class TestSolution < Test::Unit::TestCase

  def setup
    @solution = Solution.new
  end

  def test_examples
    assert_equal 2, @solution.solve(12)
    assert_equal 2, @solution.solve(14)
    assert_equal 654, @solution.solve(1969)
    assert_equal 33583, @solution.solve(100756)
  end
end
