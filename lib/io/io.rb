require './lib/io/tia'

class Io

  attr_accessor :tia

  def initialize(bus)
    @bus = bus
    @tia = Tia.new(bus)
  end

end