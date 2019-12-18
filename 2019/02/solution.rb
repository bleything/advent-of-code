#!/usr/bin/env ruby

# allows you to load files from <year>/lib. delete if you don't need it
$: << File.expand_path(__FILE__ + "/../../lib")

require 'intcode'

class Solution
  attr_accessor :program
  attr_reader :part1, :part2

  def initialize(program = [99])
    @program = program
  end

  def solve!
    part1_program = @program.dup
    part1_program[1] = 12
    part1_program[2] = 2

    result = Intcode.new(part1_program).run!
    @part1 = result[0]

    part2_program = []

    catch :done do
      (0..99).each do |noun|
        (0..99).each do |verb|
          part2_program = @program.dup
          part2_program[1] = noun
          part2_program[2] = verb

          result = Intcode.new(part2_program).run!
          throw :done if result[0] == 19690720
        end
      end
    end

    @part2 = part2_program[1,2].join.to_i
  end

end

if __FILE__ == $0
  input = File.read("input.txt")

  s = Solution.new(input.split(/,/).map &:to_i)
  s.solve!

  puts "part one: #{s.part1}"
  puts "part two: #{s.part2}"
end
