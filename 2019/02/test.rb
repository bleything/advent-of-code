require 'test-unit'
require './solution'

class TestSolution < Test::Unit::TestCase

  def setup
    @solution = Solution.new
  end

  def test_examples
    assert_equal [2, 0, 0, 0, 99], Intcode.new([1, 0, 0, 0, 99]).run!
    assert_equal [2, 3, 0, 6, 99], Intcode.new([2, 3, 0, 3, 99]).run!
    assert_equal [2, 4, 4, 5, 99, 9801], Intcode.new([2, 4, 4, 5, 99, 0]).run!
    assert_equal [30, 1, 1, 4, 2, 5, 6, 0, 99], Intcode.new([1, 1, 1, 4, 99, 5, 6, 0, 99]).run!
  end

  def test_solution
    input = File.read("input.txt")
    s = Solution.new(input.split(/,/).map(&:to_i))
    s.solve!

    assert_equal 9706670, s.part1
    assert_equal 2552, s.part2
  end

end
