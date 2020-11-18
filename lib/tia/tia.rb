require_relative './registers'

module ScreenRegions
  HBLANK_START = 0
  HBLANK_END = 68

  HRENDER_START = 69
  HRENDER_END = 228

  VSYNC_START = 0
  VSYNC_END = 3

  VBLANK_START = 4
  VBLANK_END = 40

  VRENDER_START = 68
  VRENDER_END = 232

  VOVER_START = 233
  VOVER_END = 262
end

class Frame

  def initialize
    @values = {}

    for i in 0..VOVER_END
      @values[i] = {}
      for j in 0..HRENDER_END
        @values[i][j] = 0
      end
    end
  end

  def set(x, y, value)
    @values[y][x] = value
  end

end

class Tia

  def initialize(bus)
    @bus = bus

    @vcounter = 0
    @hcounter = 0
    @is_hblank = false
    @is_hsync = false
    @is_vblank = false
    @is_vsync = false
    @is_vover = false
    @frame = Frame.new

    @registers = TiaRegisters.new(bus)
  end

  def tick
    update_horizontal_flags
    update_vertical_flags

    vsync_is_on = @registers.vsync.is_on
    vblank_is_on = @registers.vblank.is_on

    hsync_is_on = @is_hsync
    hblank_is_on = @is_hblank




  end

  def read_byte(addr)
    0
  end

  def write_byte(addr, value)
    register = @registers.get(addr)
    return if register.nil?

    register.value = value
  end

  # @private

  def update_horizontal_flags
    case @hcounter
    when ScreenRegions.HBLANK_START
      @is_hblank = true
      @is_hsync = false
    when ScreenRegions.HBLANK_END
      @is_hblank = false
    when ScreenRegions.HRENDER_END
      @is_hsync = true
    else
      # nothing
    end
  end

  def update_vertical_flags
    case @vcounter
    when ScreenRegions.VSYNC_START
      @is_vsync = true
      @is_vover = false
      @is_vblank = false
    when ScreenRegions.VSYNC_END
      @is_vsync = false
    when ScreenRegions.VBLANK_START
      @is_hblank = true
    when ScreenRegions.VBLANK_END
      @is_hblank = false
    when ScreenRegions.VOVER_START
      @is_vover = true
    else
      # nothing
    end
  end

end