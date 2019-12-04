#!/usr/bin/env ruby

class Solution

  def solve(input)
    input / 3 - 2
  end

  def solve_part_two(input)
    result = solve(input)

    if result < 1
      return 0
    else
      return result + solve_part_two(result)
    end

    return result
  end

end

if __FILE__ == $0
  s = Solution.new
  part1 = 0
  part2 = 0

  File.readlines("input.txt").each do |line|
    l = line.to_i

    part1 += s.solve(l)
    part2 += s.solve_part_two(l)
  end

  puts "Part One: #{part1}"
  puts "Part Two: #{part2}"

end
