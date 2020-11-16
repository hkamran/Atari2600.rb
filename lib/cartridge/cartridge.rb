class Cartridge

  def initialize(filepath)
    @rom = load(filepath)
  end

  def read_byte(address)
    @rom[address & 0xFFFF]
  end

end
