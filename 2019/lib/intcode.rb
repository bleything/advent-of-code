class Intcode
  attr_reader :state

  def initialize(program, debug = false)
    @state = program
    @ptr = 0
    @running = true

    @debug = debug
  end

  def debug(msg)
    puts "DEBUG: #{msg}" if @debug
  end

  def run!
    while @running
      step @state[@ptr]
    end

    return @state
  end

  def step(opcode)
    operations = {
      1  => lambda {|a, b, dest| @state[dest] = @state[a] + @state[b] },
      2  => lambda {|a, b, dest| @state[dest] = @state[a] * @state[b] },
      99 => lambda { @running = false }
    }

    op = operations[opcode]

    params = []
    op.arity.times {|idx| params << @state[@ptr + idx + 1] }

    debug "opcode #{opcode}"
    debug "params #{params}" if params.any?

    op.call *params

    # advance the program counter by 1 (for the opcode) plus however many params
    # there were
    @ptr += (1 + op.arity)
  end

end
