#!/usr/bin/env ruby

class Solution
  attr_reader :part1, :part2

  def initialize(input = "")
    @lines = input.lines.map(&:strip).map(&:to_i)
    @part1 = 0
    @part2 = 0
  end

  def solve!
    @lines.each do |value|
      @part1 += part_one value
      @part2 += part_two value
    end
  end

  def part_one(input)
    input / 3 - 2
  end

  def part_two(input)
    result = part_one(input)

    if result < 1
      return 0
    else
      return result + part_two(result)
    end

    return result
  end

end

if __FILE__ == $0
  input = File.read("input.txt")
  s = Solution.new(input)
  s.solve!

  puts "Part One: #{s.part1}"
  puts "Part Two: #{s.part2}"
end
