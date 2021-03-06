require_relative './cpu'
require_relative './../bus'

module AddressingType

  Accumulator = 1
  Implied = 2
  Immediate = 3
  Absolute = 4
  AbsoluteX = 5
  AbsoluteY = 6
  Zero = 7
  Zerox = 8
  Zeroy = 9
  Relative = 10
  Indirect = 11
  Indirectx = 12
  Indirecty = 13

end

class Addressing

  attr_accessor :name, :code

  def initialize(cpu, bus)
    @cpu = cpu
    @bus = bus
  end

  def get_operand
    raise "Not implemented"
  end

  def get_operand_address
    raise "Not implemented"
  end

end

class Accumulator < Addressing

  def initialize(cpu, bus)
    super
    @name = "Accumulator"
    @code = 1
  end

  def get_operand
    @cpu.registers.a
  end

  def get_operand_address
    raise "Not implemented"
  end

end

class Implied < Addressing

  def initialize(cpu, bus)
    super
    @name = "Implied"
    @code = 2
  end

  def get_operand
    @cpu.registers.pc
  end

  def get_operand_address
    raise "Not implemented"
  end

end

class Immediate < Addressing

  def initialize(cpu, bus)
    super
    @name = "Immediate"
    @code = 3
  end

  def get_operand
    addr = get_operand_address
    @bus.read_byte(addr)
  end

  def get_operand_address
    (@cpu.registers.pc + 1) & 0xFFFF
  end

end

class Absolute < Addressing

  def initialize(cpu, bus)
    super
    @name = "Absolute"
    @code = 4
  end

  def get_operand
    addr = get_operand_address
    @bus.read_byte(addr)
  end

  def get_operand_address
    addr = (@cpu.registers.pc + 1) & 0xFFFF
    @bus.read_word(addr)
  end

end

class AbsoluteX < Addressing

  def initialize(cpu, bus)
    super
    @name = "Absolute X"
    @code = 5
  end

  def get_operand
    addr = get_operand_address
    @bus.read_byte(addr)
  end

  def get_operand_address
    addr = (@cpu.registers.pc + 1) & 0xFFFF
    addr = (addr + @cpu.registers.x) & 0xFFFF
    @bus.read_word(addr)
  end

end

class AbsoluteY < Addressing

  def initialize(cpu, bus)
    super
    @name = "Absolute Y"
    @code = 6
  end

  def get_operand
    addr = get_operand_address
    @bus.read_byte(addr)
  end

  def get_operand_address
    addr = (@cpu.registers.pc + 1) & 0xFFFF
    addr = (addr + @cpu.registers.y) & 0xFFFF
    @bus.read_word(addr)
  end

end

class Zero < Addressing

  def initialize(cpu, bus)
    super
    @name = "Zero"
    @code = 7
  end

  def get_operand
    addr = get_operand_address
    @bus.read_byte(addr)
  end

  def get_operand_address
    addr = (@cpu.registers.pc + 1) & 0xFFFF
    @bus.read_byte(addr) & 0xFF
  end
end

class ZeroX < Addressing

  def initialize(cpu, bus)
    super
    @name = "Zero X"
    @code = 8
  end

  def get_operand
    addr = get_operand_address
    @bus.read_byte(addr)
  end

  def get_operand_address
    addr = @bus.read_byte((@cpu.registers.pc + 1) & 0xFFFF)
    (addr + @cpu.registers.x) & 0xFFFF
  end
end

class ZeroY < Addressing

  def initialize(cpu, bus)
    super
    @name = "Zero Y"
    @code = 9
  end

  def get_operand
    addr = get_operand_address
    @bus.read_byte(addr)
  end

  def get_operand_address
    addr = @bus.read_byte((@cpu.registers.pc + 1) & 0xFFFF)
    (addr + @cpu.registers.y) & 0xFFFF
  end
end

class Relative < Addressing

  def initialize(cpu, bus)
    super
    @name = "Relative"
    @code = 10
  end

  def get_operand
    addr = get_operand_address
    value = @bus.read_byte(addr)

    if value >= 0x80
      -0x100
    else
      value
    end
  end

  def get_operand_address
    (@cpu.registers.pc + 1) & 0xFFFF
  end

end

class Indirect < Addressing

  def initialize(cpu, bus)
    super
    @name = "Indirect"
    @code = 11
  end

  def get_operand
    addr = get_operand_address
    @bus.read_byte(addr)
  end

  def get_operand_address
    src = @bus.read_word((@cpu.registers.pc + 1) & 0xFFFF)
    lo = @bus.read_byte(src)
    hi = @bus.read_byte(src + 1)

    (hi << 8 || lo) & 0xFFFF
  end

end

class IndirectX < Addressing

  def initialize(cpu, bus)
    super
    @name = "Indirect X"
    @code = 12
  end

  def get_operand
    addr = get_operand_address
    @bus.read_word(addr)
  end

  def get_operand_address
    src = @bus.read_byte(@cpu.registers.pc + 1)
    src += @cpu.register.x
    src &= 0xFFFF
    src
  end

end


class IndirectY < Addressing

  def initialize(cpu, bus)
    super
    @name = "Indirect Y"
    @code = 13
  end

  def get_operand
    addr = get_operand_address
    (@bus.read_byte(addr)) & 0xFF
  end

  def get_operand_address
    src = @bus.read_word((@cpu.registers.pc + 1) & 0xFFFF)
    (src + @cpu.registers.y) & 0xFFFF
  end

end
