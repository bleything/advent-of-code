require 'test-unit'
require './solution'

class TestSolution < Test::Unit::TestCase

  def setup
    @solution = Solution.new
  end

  def test_examples
    assert_equal [2, 0, 0, 0, 99], @solution.solve([1, 0, 0, 0, 99])
    assert_equal [2, 3, 0, 6, 99], @solution.solve([2, 3, 0, 3, 99])
    assert_equal [2, 4, 4, 5, 99, 9801], @solution.solve([2, 4, 4, 5, 99, 0])
    assert_equal [30, 1, 1, 4, 2, 5, 6, 0, 99], @solution.solve([1, 1, 1, 4, 99, 5, 6, 0, 99])
  end
end
