
require './lib/cpu/addressing'
require './lib/cpu/operations'
require './lib/bus'

class Registers
  attr_accessor :a, :x, :y, :pc, :sp, :p

  def initialize
    @a = 0
    @x = 0
    @y = 0
    @pc = 0
    @s = 0
    @p = 0
  end

  def setC(flag)
    @p &= 0xFE
    @p |= flag ? 1 << 0 : 0
  end

  def getC
    (@p >> 0) & 1
  end

  def setZ(flag)
    @p &= 0xFD
    @p |= flag ? 1 << 1 : 0
  end

  def getZ
    (@p >> 1) & 1
  end

  def setI(flag)
    @p &= 0xFB
    @p |= flag ? 1 << 2 : 0
  end

  def getI
    (@p >> 2) & 1
  end

  def setD(flag)
    @p &= 0xF7
    @p |= flag ? 1 << 3 : 0
  end

  def getD
    (@p >> 3) & 1
  end

  def setB(flag)
    @p &= 0xEF
    @p |= flag ? 1 << 4 : 0
  end

  def getB
    (@p >> 4) & 1
  end

  def setV(flag)
    @p &= 0xBF
    @p |= flag ? 1 << 6 : 0
  end

  def getV
    (@p >> 6) & 1
  end

  def setN(flag)
    @p &= 0x7F
    @p |= flag ? 1 << 7 : 0
  end

  def getN
    (@p >> 7) & 1
  end

end




# typed: true
class Cpu

  attr_accessor :registers, :bus, :operations

  def initialize(bus)
    @bus = bus
    @registers = Registers.new
    @operations = Operations.new
  end

  def tick

    pc = @registers.pc
    opcode = @bus.read_byte(pc)
    operation = @operations.get(opcode)

    operation.execute(@cpu, @bus)

    size = operation.get_size
    cycles = operation.get_cycles

  end

end