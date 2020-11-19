require_relative './tia/screen'
require_relative './bus'
require_relative './cartridge/cartridge'
require_relative './cpu/cpu'
require_relative './io/io'
require_relative './tia/tia'

class Console

  attr_accessor :bus, :io, :ppu, :cpu, :cartridge, :screen

  def initialize
    @bus = Bus.new
    @io = Io.new(@bus)
    @cpu = Cpu.new(@bus)
    @tia = Tia.new(bus)
    @cartridge = Cartridge.new

    @bus.cpu = @cpu
    @bus.io = @io
    @bus.tia = @tia

    @screen = Screen.new(&lambda {
      @screen.set_pixel(0, 0, 10)
    })
  end

  def tick
    @cpu.tick
  end

  def load(path)
    @cartridge.load(path)
    puts "Cartridge loaded '#{path}'"
  end

  def run()
    @screen.show
  end

end

console = Console.new
console.load("../roms/Tetris DX (World) (SGB Enhanced).gbc")
console.run



