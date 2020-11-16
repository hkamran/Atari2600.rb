require  './lib/screen'
require  './lib/bus'
require  './lib/ppu'
require  './lib/cartridge'
require './lib/cpu/cpu'
require './lib/io/io'

class Console

  attr_accessor :bus, :io, :ppu, :cpu, :cartridge

  def initialize
    @bus = Bus.new
    @io = Io.new(@bus)
    @ppu = Ppu.new(@bus)
    @cpu = Cpu.new(@bus)

    @bus.cpu = @cpu
    @bus.ppu = @ppu
    @bus.io = @io

  end

  def tick
    @cpu.tick
  end

  def load(path)
    @cartridge = Cartridge.new(path)
    @bus.cartridge = @cartridge
    puts cartridge.to_s
  end

end

console = Console.new
console.load("./roms/Tetris DX (World) (SGB Enhanced).gbc")
console.tick

main = lambda {
}

Screen.new(&main)

