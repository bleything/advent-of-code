require 'test-unit'
require './solution'

class TestSolution < Test::Unit::TestCase

  def test_examples

    first = "R75,D30,R83,U83,L12,D49,R71,U7,L72"
    second = "U62,R66,U55,R34,D71,R55,D58,R83"

    solution = Solution.new first, second
    assert_equal 159, solution.solve!


    first = "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51"
    second = "U98,R91,D20,R16,D67,R40,U7,R15,U6,R7"

    solution = Solution.new first, second
    assert_equal 135, solution.solve!
  end
end
