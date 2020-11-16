class Bus

  attr_accessor :cartridge, :ppu, :wram, :io, :cpu, :tia, :pia, :stack

  def initialize
    @stack = []
  end

  def read_byte(addr)
    if 0x0000 <= addr && addr <= 0x002C
      return @cartridge.read_byte(addr)
    elsif 0x0030 <= addr && addr <= 0x003D
      return @cartridge.read_byte(addr)
    end
  end

  def read_word(addr)
    lo = read_byte(addr)
    hi = read_byte((addr + 1) & 0xFFFF)

    (hi << 8 | lo) & 0xFFFF
  end

  def write_byte(addr, value)

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

  def get_memory()
    @memory
  end

end

