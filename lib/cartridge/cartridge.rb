class Cartridge

  def initialize()
    @rom = []
  end

  def read_byte(address)
    @rom[address & 0xFFFF]
  end

  def load(filepath)
    @rom = File.open(filepath, "rb") { |f| f.read }.unpack('C*')
    @rom += @rom if @rom.count == 2048
  end

end
