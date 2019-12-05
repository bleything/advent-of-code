require 'test-unit'
require './solution'

class TestSolution < Test::Unit::TestCase

  def setup
    @solution = Solution.new
  end

  def test_examples
    assert  @solution.valid_part_one?(111111)
    assert !@solution.valid_part_one?(223450)
    assert !@solution.valid_part_one?(123789)

    assert  @solution.valid_part_two?(112233)
    assert !@solution.valid_part_two?(123444)
    assert  @solution.valid_part_two?(111122)
  end
end
