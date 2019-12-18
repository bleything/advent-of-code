#!/usr/bin/env ruby

# allows you to load files from <year>/lib. delete if you don't need it
$: << File.expand_path(__FILE__ + "/../../lib")

class Solution
  attr_reader :part1, :part2

  def initialize(*args)
    # feel free to change the params if you want
  end

  def solve!
    # do the meat of the solution here, assign results to @part1 and @part2
  end

end

if __FILE__ == $0
  input = File.read("input.txt")

  # do any munging you might need to do with the input

  s = Solution.new(input)
  s.solve!

  puts "part one: #{s.part1}"
  puts "part two: #{s.part2}"
end
