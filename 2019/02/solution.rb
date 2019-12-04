#!/usr/bin/env ruby

class Computer
  attr_reader :state

  OPCODES = {
    1  => Proc.new {|a,b| a + b},
    2  => Proc.new {|a,b| a * b},
    99 => Proc.new { @running = false }
  }

  def initialize(program)
    @state = program
    @ptr = 0
    @running = true
  end

  def run!
    while @running
      step @state[@ptr]
    end

    return @state
  end

  def step(opcode)
    if opcode == 99
      @running = false
      return
    end

    a_addr = @state[@ptr + 1]
    b_addr = @state[@ptr + 2]
    r_addr = @state[@ptr + 3]

    # p @state
    # puts "p%02i o%02i a%02i b%02i"  % [@ptr, opcode, a_addr, b_addr]

    a = @state[a_addr]
    b = @state[b_addr]

    case opcode
    when 1
           @state[r_addr] = a + b
    when 2
           @state[r_addr] = a * b
    end

    @ptr += 4
  end
end

class Solution

  def solve(program)
    Computer.new(program).run!
  end

end

if __FILE__ == $0
  s = Solution.new

  input = File.read("input.txt").split(/,/).map(&:to_i)

  part_one = input.dup
  part_one[1] = 12
  part_one[2] = 2

  puts "part one: #{s.solve(part_one)[0]}"

  part_two = []

  catch :done do
    (0..99).each do |noun|
      (0..99).each do |verb|
        part_two = input.dup
        part_two[1] = noun
        part_two[2] = verb

        result = s.solve(part_two)[0]
        throw :done if result == 19690720
      end
    end
  end

  puts "part two: #{part_two[1]}#{part_two[2]}"
end
