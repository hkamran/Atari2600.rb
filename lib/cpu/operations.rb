require_relative './addressing'
require_relative './cpu'
require_relative './../bus'

module Operation

  attr_accessor :mode, :size, :cycles, :cross_cycles

  def execute(cpu, bus)
    raise "Not implemented"
  end

  def to_s
    "Operation[name='#{@name}', code='#{@code}', mode='#{@mode.name}', size='#{@size}', cycles='#{@cycles}', cross_cycles='#{@cross_cycles}']"
  end

  def get_size
    @size
  end

  def get_cycles
    @cycles
  end

end

class ADC
  include Operation

  def initialize(mode, size, cycles, cross_cycles = 0)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles = cross_cycles
  end

  def execute(cpu, bus)
    a = cpu.registers.a
    b = @mode.get_operand
    c = cpu.registers.getC

    result = a + b + c

    cpu.registers.setV((~(a ^ b) & (a ^ result) & size) != 0 ? 1 : 0)
    cpu.registers.setC(result > 0xFF ? 1 : 0)
    cpu.registers.setN(result >> 1 & 1)
    cpu.registers.setZ((result & 0xFF).zero? ? 1 : 0)

    cpu.registers.a = result & 0xFF
  end

end

class AND
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles = cross_cycles
  end

  def execute(cpu, bus)
    operand = @mode.get_operand
    result = cpu.registers.a & operand

    cpu.registers.setN(result >> 1 & 1)
    cpu.registers.setZ((result & 0xFF).zero? ? 1 : 0)
  end

end

class ASL
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    is_accumulator = @mode.code == AddressingType.Accumulator
    result = is_accumulator ? cpu.registers.a : @mode.get_operand

    cpu.registers.setC((result >> 7) & 1)
    result = (result << 1) & 0xFF

    cpu.registers.setN((result >> 7) & 1)
    cpu.registers.setZ((result & 0xFF).zero? ? 1 : 0)

    raise "Not implemented"
  end

end

class BCC
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    if cpu.registers.getC == 0
      cpu.registers.pc = @mode.get_operand
    end
  end

end


class BCS
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    if cpu.registers.getC == 1
      cpu.registers.pc = @mode.get_operand
    end
  end

end

class BIT
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    result = @mode.get_operand

    cpu.registers.setN((result >> 7) & 1)
    cpu.registers.setV((result >> 6) & 1)

    result &= cpu.registers.a

    cpu.registers.setZ((result & 0xFF) == 0 ? 1 : 0)
  end

end

class BEQ
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    if cpu.registers.getZ == 1
      cpu.registers.pc = @mode.get_operand
    end
  end

end


class BMI
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    if cpu.registers.getN == 1
      cpu.registers.pc = @mode.get_operand
    end
  end

end


class BNE
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    if cpu.registers.getZ == 0
      cpu.registers.pc = @mode.get_operand
    end
  end

end

class BPL
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    if cpu.registers.getN == 0
      cpu.registers.pc = @mode.get_operand
    end
  end

end

class BRK
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    raise "Not implemented"
  end

end

class BVC
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    if cpu.registers.getV == 0
      cpu.registers.pc = @mode.get_operand
    end
  end

end

class BVS
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    if cpu.registers.getV == 1
      cpu.registers.pc = @mode.get_operand
    end
  end

end

class CLC
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    cpu.registers.setC(0)
  end

end

class CLD
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    cpu.registers.setD(0)
  end

end

class CLI
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    cpu.registers.setI(0)
  end

end

class CLV
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    cpu.registers.setV(0)
  end

end

class CMP
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    operand = @mode.get_operand
    result = cpu.registers.a - operand

    cpu.registers.setC((result >= 0 ? 1 : 0))
    cpu.registers.setN((result >> 7) & 1)
    cpu.registers.setZ((result & 0xFF) == 0 ? 1 : 0)
  end

end

class CPX
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    operand = @mode.get_operand
    result = cpu.registers.x - operand

    cpu.registers.setC((result >= 0 ? 1 : 0))
    cpu.registers.setN((result >> 7) & 1)
    cpu.registers.setZ((result & 0xFF) == 0 ? 1 : 0)
  end

end

class CPY
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    operand = @mode.get_operand
    result = cpu.registers.y - operand

    cpu.registers.setC((result >= 0 ? 1 : 0))
    cpu.registers.setN((result >> 7) & 1)
    cpu.registers.setZ((result & 0xFF) == 0 ? 1 : 0)
  end

end

class DEC
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    address = @mode.get_operand_address
    operand = @mode.get_operand
    result =  (operand - 1) & 0xFF

    cpu.registers.setN((result >> 7) & 1)
    cpu.registers.setZ((result & 0xFF) == 0 ? 1 : 0)

    bus.write_byte(address, result)
  end

end

class DEX
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    operand = cpu.registers.x
    result =  (operand - 1) & 0xFF

    cpu.registers.setN((result >> 7) & 1)
    cpu.registers.setZ((result & 0xFF) == 0 ? 1 : 0)

    cpu.registers.x = result
  end

end

class DEY
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    operand = cpu.registers.y
    result =  (operand - 1) & 0xFF

    cpu.registers.setN((result >> 7) & 1)
    cpu.registers.setZ((result & 0xFF) == 0 ? 1 : 0)

    cpu.registers.x = result
  end

end

class EOR
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    result = (@mode.get_operand ^ cpu.registers.a) & 0xFF

    cpu.registers.setN((result >> 7) & 1)
    cpu.registers.setZ((result & 0xFF) == 0 ? 1 : 0)

    cpu.registers.a = result
  end

end

class INC
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    addr = @mode.get_operand_address
    value = @mode.get_operand

    result = (value + 1) & 0xFF
    bus.write_byte(addr, value)

    cpu.registers.setN((result >> 7) & 1)
    cpu.registers.setZ((result & 0xFF) == 0 ? 1 : 0)
  end

end

class INX
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    value = (cpu.registers.x + 1) & 0xFF

    cpu.registers.setN((result >> 7) & 1)
    cpu.registers.setZ((result & 0xFF) == 0 ? 1 : 0)

    cpu.registers.x = value
  end

end

class INY
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    result = (cpu.registers.y + 1) & 0xFF

    cpu.registers.setN((result >> 7) & 1)
    cpu.registers.setZ((result & 0xFF) == 0 ? 1 : 0)

    cpu.registers.y = value
  end

end

class JMP
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    addr = @mode.get_operand_address
    cpu.registers.pc = addr
  end

end

class JSR
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    bus.push_byte(cpu.registers.pc & 0xFFFF)
    cpu.registers.pc = @mode.get_operand_address
  end

end

class LDA
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    result = @mode.get_operand

    cpu.registers.setN((result >> 7) & 1)
    cpu.registers.setZ((result & 0xFF) == 0 ? 1 : 0)

    cpu.registers.a = result
  end

end

class LDX
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    value = @mode.get_operand

    cpu.registers.setN((value >> 7) & 1)
    cpu.registers.setZ((value & 0xFF) == 0 ? 1 : 0)

    cpu.registers.x = value
  end

end

class LDY
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    value = @mode.get_operand

    cpu.registers.setN((value >> 7) & 1)
    cpu.registers.setZ((value & 0xFF) == 0 ? 1 : 0)

    cpu.registers.y = value
  end

end

class LSR
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    is_accumulator = @mode.code == AddressingType.Accumulator

    value = is_accumulator ? cpu.registers.a : @mode.get_operand
    cpu.registers.setC(value & 1)
    value = (value >> 1) & 0xFF

    if is_accumulator
      cpu.registers.a = value
    else
      addr = @mode.get_operand_address
      bus.write_byte(addr, value)
    end

    cpu.registers.setN((value >> 7) & 1)
    cpu.registers.setZ((value & 0xFF) == 0 ? 1 : 0)
  end

end

class NOP
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
  end

end

class ORA
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    operand = @mode.get_operand
    result = (operand | cpu.registers.a) & 0xFF

    cpu.registers.setN((value >> 7) & 1)
    cpu.registers.setZ((value & 0xFF) == 0 ? 1 : 0)

    cpu.registers.a = result
  end

end

class PHA
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    bus.push_byte(cpu.registers.a)
  end

end

class PHP
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    bus.push_byte(cpu.registers.p)
  end

end

class PLA
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    value = bus.pop_byte

    cpu.registers.a = value

    cpu.registers.setN((value >> 7) & 1)
    cpu.registers.setZ((value & 0xFF) == 0 ? 1 : 0)
  end

end

class PLP
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    value = bus.pop_byte
    cpu.registers.p = value
  end

end

class ROL
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    is_accumulator = @mode.code == AddressingType.Accumulator

    if is_accumulator
      value = cpu.registers.a
      carry = cpu.registers.getC

      cpu.registers.setC((value >> 7) & 1)
      value = ((value << 1) & 0xFF) + carry

      cpu.registers.a = value
    else
      value = @mode.get_operand
      carry = cpu.registers.getC

      cpu.registers.setC((value >> 7) & 1)
      value = ((value << 1) & 0xFF) + carry

      bus.write_byte(@mode.get_operand_address, value)
    end

    cpu.registers.setN((value >> 7) & 1)
    cpu.registers.setZ((value & 0xFF) == 0 ? 1 : 0)
  end

end

class ROR
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    is_accumulator = @mode.code == AddressingType.Accumulator

    if is_accumulator
      value = cpu.registers.a
      carry = cpu.registers.getC << 7

      cpu.registers.setC(value & 1)
      value = ((value >> 1) & 0xFF) | carry

      cpu.registers.a = value
    else
      value = @mode.get_operand
      carry = cpu.registers.getC << 7

      cpu.registers.setC(value & 1)
      value = ((value >> 1) & 0xFF) | carry

      bus.write_byte(@mode.get_operand_address, value)
    end

    cpu.registers.setN((value >> 7) & 1)
    cpu.registers.setZ((value & 0xFF) == 0 ? 1 : 0)
  end

end

class RTI
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    cpu.registers.p = (bus.pop_byte & 0xEF) | 0x20
    cpu.registers.pc = bus.pop_word
  end

end

class RTS
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    cpu.registers.pc = (bus.pop_word + 1) & 0xFFFF
  end

end

class SBC
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    opaddr = @mode.get_operand_address

    a = cpu.registers.a
    b = bus.read_byte(opaddr)
    c = cpu.registers.getC

    value = a - b - (1 - c)

    cpu.registers.setN((value >> 7) & 1)
    cpu.registers.setZ((value & 0xFF) == 0 ? 1 : 0)
    cpu.registers.setV((((a^b)&0x80)!=0 && ((a^value)&0x80)!=0)?1:0)
    cpu.registers.setC(value >= 0 ? 1 : 0)
    cpu.registers.a = value & 0xFF
  end

end

class SEC
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    cpu.registers.setC(1)

  end

end

class SED
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    cpu.registers.setD(1)
  end

end

class SEI
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    cpu.registers.setI(1)
  end

end

class STA
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    value = cpu.registers.a
    address = @mode.get_operand_address

    bus.write_byte(address, value)
  end

end

class STX
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    value = cpu.registers.x
    address = @mode.get_operand_address

    bus.write_byte(address, value)
  end

end

class STY
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    value = cpu.registers.y
    address = @mode.get_operand_address

    bus.write_byte(address, value)
  end

end

class TAX
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    value = cpu.registers.a

    cpu.registers.setN((value >> 7) & 1)
    cpu.registers.setZ((value & 0xFF) == 0 ? 1 : 0)

    cpu.registers.x = value
  end

end

class TAY
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    value = cpu.registers.a

    cpu.registers.setN((value >> 7) & 1)
    cpu.registers.setZ((value & 0xFF) == 0 ? 1 : 0)

    cpu.registers.y = value
  end

end

class TXA
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    value = cpu.registers.x

    cpu.registers.setN((value >> 7) & 1)
    cpu.registers.setZ((value & 0xFF) == 0 ? 1 : 0)

    cpu.registers.a = value
  end

end

class TXS
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    value = cpu.registers.x
    cpu.registers.sp = value & 0xFF
  end

end

class TSX
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    value = cpu.registers.sp

    cpu.registers.setN((value >> 7) & 1)
    cpu.registers.setZ((value & 0xFF) == 0 ? 1 : 0)

    cpu.registers.x = value
  end

end

class TYA
  include Operation

  def initialize(mode, size, cycles)
    @mode = mode
    @size = size
    @cycles = cycles
    @cross_cycles  = cross_cycles
  end

  def execute(cpu, bus)
    value = cpu.registers.y

    cpu.registers.setN((value >> 7) & 1)
    cpu.registers.setZ((value & 0xFF) == 0 ? 1 : 0)

    cpu.registers.a = value
  end

end

class Operations

  def initialize(cpu, bus)
    @operations = {
      0x69 => ADC.new(Immediate.new(cpu, bus), 2, 2),
      0x65 => ADC.new(Zero.new(cpu, bus), 2, 3),
      0x75 => ADC.new(ZeroX.new(cpu, bus), 2, 4),
      0x6D => ADC.new(Absolute.new(cpu, bus), 3, 4),
      0x7D => ADC.new(IndirectX.new(cpu, bus), 3, 4),
      0x79 => ADC.new(IndirectY.new(cpu, bus), 3, 4),
      0x61 => ADC.new(IndirectX.new(cpu, bus), 2, 6),
      0x71 => ADC.new(IndirectY.new(cpu, bus), 2, 5),

      0x29 => AND.new(Immediate.new(cpu, bus), 2, 2),
      0x25 => AND.new(Zero.new(cpu, bus), 2, 3),
      0x35 => AND.new(ZeroX.new(cpu, bus), 2, 4),
      0x2D => AND.new(Absolute.new(cpu, bus), 3, 4),
      0x3D => AND.new(AbsoluteX.new(cpu, bus), 3, 4),
      0x39 => AND.new(AbsoluteY.new(cpu, bus), 3, 4),
      0x21 => AND.new(IndirectX.new(cpu, bus), 2, 6),
      0x31 => AND.new(IndirectX.new(cpu, bus), 2, 5),

      0x0A => ASL.new(Accumulator.new(cpu, bus), 1, 2),
      0x06 => ASL.new(Zero.new(cpu, bus), 2, 5),
      0x16 => ASL.new(ZeroX.new(cpu, bus), 2, 6),
      0x0E => ASL.new(Absolute.new(cpu, bus), 3, 6),
      0x1E => ASL.new(AbsoluteX.new(cpu, bus), 3, 7),

      0x24 => BIT.new(Zero.new(cpu, bus), 2, 3),
      0x2C => BIT.new(Absolute.new(cpu, bus), 3, 4),

      0x10 => BPL.new(Relative.new(cpu, bus), 2, 2),
      0x30 => BMI.new(Relative.new(cpu, bus), 2, 2),
      0x50 => BVC.new(Relative.new(cpu, bus), 2, 2),
      0x70 => BVS.new(Relative.new(cpu, bus), 2, 2),
      0x90 => BCC.new(Relative.new(cpu, bus), 2, 2),
      0xB0 => BCS.new(Relative.new(cpu, bus), 2, 2),
      0xD0 => BNE.new(Relative.new(cpu, bus), 2, 2),
      0xF0 => BEQ.new(Relative.new(cpu, bus), 2, 2),

      0x00 => BRK.new(Implied.new(cpu, bus), 1, 7),

      0xC9 => CMP.new(Implied.new(cpu, bus), 2, 2),
      0xC5 => CMP.new(Zero.new(cpu, bus), 2, 3),
      0xD5 => CMP.new(ZeroX.new(cpu, bus), 2, 4),
      0xCD => CMP.new(Absolute.new(cpu, bus), 3, 4),
      0xDD => CMP.new(AbsoluteX.new(cpu, bus), 3, 4),
      0xD9 => CMP.new(AbsoluteY.new(cpu, bus), 3, 4),
      0xC1 => CMP.new(IndirectX.new(cpu, bus), 2, 6),
      0xD1 => CMP.new(IndirectY.new(cpu, bus), 2, 5),

      0xE0 => CPX.new(Immediate.new(cpu, bus), 2, 2),
      0xE4 => CPX.new(Zero.new(cpu, bus), 2, 3),
      0xEC => CPX.new(Absolute.new(cpu, bus), 3, 4),

      0xC0 => CPY.new(Immediate.new(cpu, bus), 2, 2),
      0xC4 => CPY.new(Zero.new(cpu, bus), 2, 3),
      0xCC => CPY.new(Absolute.new(cpu, bus), 3, 4),

      0xC6 => DEC.new(Zero.new(cpu, bus), 2, 5),
      0xD6 => DEC.new(ZeroX.new(cpu, bus), 2, 6),
      0xCE => DEC.new(Absolute.new(cpu, bus), 3, 6),
      0xDE => DEC.new(AbsoluteX.new(cpu, bus), 3, 4),

      0x49 => DEC.new(Immediate.new(cpu, bus), 2, 2),
      0x45 => DEC.new(Zero.new(cpu, bus), 2, 3),
      0x55 => DEC.new(ZeroX.new(cpu, bus), 2, 4),
      0x4D => DEC.new(Absolute.new(cpu, bus), 3, 4),
      0x5D => DEC.new(AbsoluteX.new(cpu, bus), 3, 4),
      0x59 => DEC.new(AbsoluteY.new(cpu, bus), 3, 4),
      0x41 => DEC.new(IndirectX.new(cpu, bus), 2, 6),
      0x51 => DEC.new(IndirectY.new(cpu, bus), 2, 5),

      0x18 => CLC.new(Implied.new(cpu, bus), 2, 1),
      0x38 => SEC.new(Implied.new(cpu, bus), 2, 1),
      0x58 => CLI.new(Implied.new(cpu, bus), 2, 1),
      0x78 => SEI.new(Implied.new(cpu, bus), 2, 1),
      0xB8 => CLV.new(Implied.new(cpu, bus), 2, 1),
      0xD8 => CLD.new(Implied.new(cpu, bus), 2, 1),
      0xF8 => SED.new(Implied.new(cpu, bus), 2, 1),

      0xE6 => INC.new(Zero.new(cpu, bus), 2, 5),
      0xF6 => INC.new(ZeroX.new(cpu, bus), 2, 6),
      0xEE => INC.new(Absolute.new(cpu, bus), 3, 6),
      0xFE => INC.new(AbsoluteX.new(cpu, bus), 3, 7),

      0x4C => JMP.new(Absolute.new(cpu, bus), 3, 3),
      0x6C => JMP.new(Indirect.new(cpu, bus), 3, 5),

      0x20 => JSR.new(Absolute.new(cpu, bus), 3, 6),

      0xA9 => LDA.new(Immediate.new(cpu, bus), 2, 2),
      0xA5 => LDA.new(Zero.new(cpu, bus), 2, 3),
      0xB5 => LDA.new(ZeroX.new(cpu, bus), 2, 4),
      0xAD => LDA.new(Absolute.new(cpu, bus), 3, 4),
      0xBD => LDA.new(AbsoluteX.new(cpu, bus), 3, 4),
      0xB9 => LDA.new(AbsoluteY.new(cpu, bus), 3, 4),
      0xA1 => LDA.new(IndirectX.new(cpu, bus), 2, 6),
      0xB1 => LDA.new(IndirectY.new(cpu, bus), 2, 5),

      0xA2 => LDX.new(Immediate.new(cpu, bus), 2, 2),
      0xA6 => LDX.new(Zero.new(cpu, bus), 2, 3),
      0xB6 => LDX.new(ZeroY.new(cpu, bus), 2, 4),
      0xAE => LDX.new(Absolute.new(cpu, bus), 3, 4),
      0xBE => LDX.new(AbsoluteY.new(cpu, bus), 3, 4),

      0xA0 => LDY.new(Immediate.new(cpu, bus), 2, 2),
      0xA4 => LDY.new(Zero.new(cpu, bus), 2, 3),
      0xB4 => LDY.new(ZeroX.new(cpu, bus), 2, 4),
      0xAC => LDY.new(Absolute.new(cpu, bus), 3, 4),
      0xBC => LDY.new(AbsoluteX.new(cpu, bus), 3, 4),

      0x4A => LSR.new(Accumulator.new(cpu, bus), 1, 2),
      0x46 => LSR.new(Zero.new(cpu, bus), 2, 5),
      0x56 => LSR.new(ZeroX.new(cpu, bus), 2, 6),
      0x4E => LSR.new(Absolute.new(cpu, bus), 3, 6),
      0x5E => LSR.new(AbsoluteX.new(cpu, bus), 3, 7),

      0xEA => LSR.new(Implied.new(cpu, bus), 1, 2),

      0x09 => ORA.new(Immediate.new(cpu, bus), 2, 2),
      0x05 => ORA.new(Zero.new(cpu, bus), 2, 3),
      0x15 => ORA.new(ZeroX.new(cpu, bus), 2, 4),
      0x0D => ORA.new(Absolute.new(cpu, bus), 3, 4),
      0x1D => ORA.new(AbsoluteX.new(cpu, bus), 3, 4),
      0x19 => ORA.new(AbsoluteY.new(cpu, bus), 3, 4),
      0x01 => ORA.new(IndirectX.new(cpu, bus), 2, 6),
      0x11 => ORA.new(IndirectY.new(cpu, bus), 2, 5),

      0xAA => TAX.new(Implied.new(cpu, bus), 1, 2),
      0x8A => TXA.new(Implied.new(cpu, bus), 1, 2),
      0xCA => DEX.new(Implied.new(cpu, bus), 1, 2),
      0xE8 => INX.new(Implied.new(cpu, bus), 1, 2),
      0xA8 => TAY.new(Implied.new(cpu, bus), 1, 2),
      0x98 => TYA.new(Implied.new(cpu, bus), 1, 2),
      0x88 => DEY.new(Implied.new(cpu, bus), 1, 2),
      0xC8 => INY.new(Implied.new(cpu, bus), 1, 2),

      0x2A => ROL.new(Accumulator.new(cpu, bus), 1, 2),
      0x26 => ROL.new(Zero.new(cpu, bus), 2, 5),
      0x36 => ROL.new(ZeroX.new(cpu, bus), 2, 6),
      0x2E => ROL.new(Absolute.new(cpu, bus), 3, 6),
      0x3E => ROL.new(AbsoluteX.new(cpu, bus), 3, 7),

      0x6A => ROR.new(Accumulator.new(cpu, bus), 1, 2),
      0x66 => ROR.new(Zero.new(cpu, bus), 2, 5),
      0x76 => ROR.new(ZeroX.new(cpu, bus), 2, 6),
      0x6E => ROR.new(Absolute.new(cpu, bus), 3, 6),
      0x7E => ROR.new(AbsoluteX.new(cpu, bus), 3, 7),

      0x40 => RTI.new(Implied.new(cpu, bus), 1, 6),
      0x60 => RTS.new(Implied.new(cpu, bus), 1, 6),

      0xE9 => SBC.new(Immediate.new(cpu, bus), 2, 2),
      0xE5 => SBC.new(Zero.new(cpu, bus), 2, 3),
      0xF5 => SBC.new(ZeroX.new(cpu, bus), 2, 4),
      0xED => SBC.new(Absolute.new(cpu, bus), 3, 4),
      0xFD => SBC.new(AbsoluteX.new(cpu, bus), 3, 4),
      0xF9 => SBC.new(AbsoluteY.new(cpu, bus), 3, 4),
      0xE1 => SBC.new(IndirectX.new(cpu, bus), 2, 6),
      0xF1 => SBC.new(IndirectY.new(cpu, bus), 2, 5),

      0x85 => STA.new(Zero.new(cpu, bus), 2, 3),
      0x95 => STA.new(ZeroX.new(cpu, bus), 2, 4),
      0x8D => STA.new(Absolute.new(cpu, bus), 3, 4),
      0x9D => STA.new(AbsoluteX.new(cpu, bus), 3, 5),
      0x99 => STA.new(AbsoluteY.new(cpu, bus), 3, 5),
      0x81 => STA.new(IndirectX.new(cpu, bus), 2, 6),
      0x91 => STA.new(IndirectY.new(cpu, bus), 2, 6),

      0x9A => TXS.new(Implied.new(cpu, bus), 1, 2),
      0xBA => TSX.new(Implied.new(cpu, bus), 1, 2),
      0x48 => PHA.new(Implied.new(cpu, bus), 1, 3),
      0x68 => PLA.new(Implied.new(cpu, bus), 1, 4),
      0x08 => PHP.new(Implied.new(cpu, bus), 1, 3),
      0x28 => PLP.new(Implied.new(cpu, bus), 1, 4),

      0x86 => STX.new(Zero.new(cpu, bus), 2, 3),
      0x96 => STX.new(ZeroY.new(cpu, bus), 2, 4),
      0x8E => STX.new(Absolute.new(cpu, bus), 3, 4),

      0x84 => STY.new(Zero.new(cpu, bus), 2, 3),
      0x94 => STY.new(ZeroX.new(cpu, bus), 2, 4),
      0x8C => STY.new(Absolute.new(cpu, bus), 3, 4)
    }
  end

  def get(opcode)
    operation = @operations[opcode]
    throw "Operation not found 0x#{opcode.to_s(16).upcase}" if operation.nil?
    operation
  end

end
