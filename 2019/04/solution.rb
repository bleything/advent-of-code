#!/usr/bin/env ruby

class Solution
  attr_reader :part1, :part2

  def initialize(a = nil, b = nil)
    @range = a..b
    @part1 = 0
    @part2 = 0
  end

  def valid_part_one? input
    str = input.to_s

    str.squeeze.length < str.length and
      str.split(//).sort.join == str
  end

  def valid_part_two? input
    valid_part_one? input and
      input.to_s.split(//).group_by {|a| a }.values.map(&:count).any? 2
  end

  def solve!
    @range.each do |i|
      @part1 += 1 if valid_part_one? i
      @part2 += 1 if valid_part_two? i
    end
  end

end

if __FILE__ == $0
  input = File.read("input.txt")
  a, b = input.split("-")

  s = Solution.new(a, b)
  s.solve!

  puts "part one: #{s.part1}"
  puts "part two: #{s.part2}"
end
