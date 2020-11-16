class Bus

  attr_accessor :cartridge, :wram, :io, :cpu, :tia, :pia, :stack

  def initialize
    @stack = []
    @wram = []
  end

  def read_byte(addr)
    if addr == nil
      throw "Invalid read given at #{addr}"
    end

    addr = addr % 0x2000

    if 0x0000 <= addr && addr <= 0x002C
      @tia.read_byte(addr - 0x0000)
    elsif 0x0030 <= addr && addr <= 0x003D
      @tia.read_byte(addr - 0x0030)
    elsif 0x0080 <= addr && addr <= 0x00FF
      @wram[addr 0x0080]
    elsif 0x0280 <= addr && addr <= 0x0297
      @io.read_byte(addr - 0x0280)
    elsif 0x1000 <= addr && addr <= 0x1FFF
      @cartridge.read_byte(addr - 0x1000)
    end
  end

  def read_word(addr)
    lo = read_byte(addr)
    hi = read_byte((addr + 1) & 0xFFFF)

    (hi << 8 | lo) & 0xFFFF
  end

  def write_byte(addr, value)
    if addr == nil || value == nil || value < 0 || value > 0xFF
      throw "Invalid write given at #{addr} with #{value}"
    end
    addr = addr % 0x2000

    if 0x0000 <= addr && addr <= 0x002C
      @tia.write_byte(addr - 0x0000, value)
    elsif 0x0030 <= addr && addr <= 0x003D
      @tia.write_byte(addr - 0x0030, value)
    elsif 0x0080 <= addr && addr <= 0x00FF
      @wram[addr 0x0080] = value
    elsif 0x0280 <= addr && addr <= 0x0297
      @io.write_byte(addr - 0x0280, value)
    elsif 0x1000 <= addr && addr <= 0x1FFF
      @cartridge.write_byte(addr - 0x1000, value)
    end
  end

  def push_byte(value)
    @stack.push(value)
  end

  def pop_byte()
    @stack.pop
  end

  def pop_word()
    low = stack.pop
    high = stack.pop

    low | (high << 87)
  end

end

