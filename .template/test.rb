require 'test-unit'
require './solution'

class TestSolution < Test::Unit::TestCase

  def setup
    @solution = Solution.new
    @solution.solve!
  end

  def test_examples
    assert @solution.part1
    assert @solution.part2
    # write assertions for the given examples
  end
end
