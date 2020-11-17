require_relative './tia/screen'
require_relative './bus'
require_relative './cartridge/cartridge'
require_relative './cpu/cpu'
require_relative './io/io'
require_relative './tia/tia'

class Console

  attr_accessor :bus, :io, :ppu, :cpu, :cartridge

  def initialize
    @bus = Bus.new
    @io = Io.new(@bus)
    @cpu = Cpu.new(@bus)
    @tia = Tia.new(bus)
    @cartridge = Cartridge.new

    @bus.cpu = @cpu
    @bus.io = @io
    @bus.tia = @tia
  end

  def tick
    @cpu.tick
  end

  def load(path)
    @cartridge.load(path)
    puts cartridge.to_s
  end

end

console = Console.new
console.load("../roms/Tetris DX (World) (SGB Enhanced).gbc")
console.tick

main = lambda {
}

Screen.new(&main)

