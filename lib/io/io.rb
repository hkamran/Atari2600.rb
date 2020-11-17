require_relative './tia'

class Io

  attr_accessor :tia

  def initialize(bus)
    @bus = bus
  end

end