#!/usr/bin/env ruby

require 'set'

class Solution

  def initialize(first, second)
    @first_path = first.split(/,/)
    @second_path = second.split(/,/)

    @map = Hash.new {|h, k| h[k] = Set.new }
    @intersections = []
  end

  def traverse(name, path)
    x = 0
    y = 0

    path.each do |step|
      dir = step[0]
      dist = step[1..-1].to_i

      vector = case step[0]
               when "L"
                 axis = :x
                 x.downto x - dist
               when "R"
                 axis = :x
                 x.upto x + dist
               when "U"
                 axis = :y
                 y.upto y + dist
               when "D"
                 axis = :y
                 y.downto y - dist
               end

      vector.each do |coord|
        case axis
        when :x
          x = coord
        when :y
          y = coord
        end

        next if x == 0 and y == 0

        coords = "#{x},#{y}"
        @map[coords] << name

        if @map[coords].size > 1
          @intersections << coords
        end
      end
    end
  end

  def calc_distance(coords)
    x, y = coords.split(/,/).map(&:to_i)

    return (0 - x).abs + (0 - y).abs
  end

  def solve!

    traverse :first, @first_path
    traverse :second, @second_path

    return @intersections.map {|i| calc_distance i }.sort.first
  end

end

if __FILE__ == $0
  input = File.read("input.txt")
  first, second = input.lines

  s = Solution.new(first, second)
  puts s.solve!
end
