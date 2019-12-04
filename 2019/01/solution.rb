#!/usr/bin/env ruby

class Solution

  def solve(input)
    input / 3 - 2
  end

end

if __FILE__ == $0
  s = Solution.new
  sum = 0

  File.readlines("input.txt").each do |line|
    sum += s.solve(line.to_i)
  end

  puts sum

end
