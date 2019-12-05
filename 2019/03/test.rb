require 'test-unit'
require './solution'

class TestSolution < Test::Unit::TestCase

  def test_part_one_examples

    first = "R8,U5,L5,D3"
    second = "U7,R6,D4,L4"
    solution = Solution.new first, second
    solution.solve!

    assert_equal 6, solution.part1
    assert_equal 30, solution.part2

    first = "R75,D30,R83,U83,L12,D49,R71,U7,L72"
    second = "U62,R66,U55,R34,D71,R55,D58,R83"

    solution = Solution.new first, second
    solution.solve!

    assert_equal 159, solution.part1
    assert_equal 610, solution.part2

    first = "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51"
    second = "U98,R91,D20,R16,D67,R40,U7,R15,U6,R7"

    solution = Solution.new first, second
    solution.solve!

    assert_equal 135, solution.part1
    assert_equal 410, solution.part2
  end

end
