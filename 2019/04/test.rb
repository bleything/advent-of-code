require 'test-unit'
require './solution'

class TestSolution < Test::Unit::TestCase

  def setup
    @solution = Solution.new
  end

  def test_examples
    assert  @solution.valid?(111111)
    assert !@solution.valid?(223450)
    assert !@solution.valid?(123789)
  end
end
