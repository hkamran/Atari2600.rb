
require_relative './addressing'
require_relative './operations'
require_relative './../bus'
require_relative './registers'

class Cpu

  attr_accessor :registers, :bus, :operations, :cycles

  def initialize(bus)
    @bus = bus
    @registers = Registers.new
    @operations = Operations.new(self, bus)
    @cycles = 0
  end

  def tick

    cycle = @cycles
    pc = @registers.pc
    opcode = @bus.read_byte(pc)
    operation = @operations.get(opcode)

    operation.execute(@cpu, @bus)

    @registers.pc += operation.get_size
    @cycles += operation.get_cycles

  end

end
