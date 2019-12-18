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

  def test_solution
    a, b = File.read("input.txt").split("-")

    s = Solution.new(a, b)
    s.solve!

    assert_equal 1660, s.part1
    assert_equal 1135, s.part2
  end

end
