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

    @registers = {
        0x00 => Vsync.new(bus),
        0x01 => Vblank.new(bus),
        0x02 => Wsync.new(bus),
        0x03 => Rsync.new(bus),
        0x04 => Nusiz0.new(bus),
        0x05 => Nusiz1.new(bus),
        0x06 => Colup0.new(bus),
        0x07 => Colup1.new(bus),
        0x08 => ColupF.new(bus),
        0x09 => Colubk.new(bus),
        0x0A => Ctrlpf.new(bus),
        0x0B => Refp0.new(bus),
        0x0C => Refp1.new(bus),
        0x0D => Pf0.new(bus),
        0x0E => Pf1.new(bus),
        0x0F => Pf2.new(bus),
        0x10 => Resp0.new(bus),
        0x11 => Resp1.new(bus),
        0x12 => Resm0.new(bus),
        0x13 => Resm1.new(bus),
        0x14 => Resbl.new(bus),
        0x15 => Audc0.new(bus),
        0x16 => Audc1.new(bus),
        0x17 => Audf0.new(bus),
        0x18 => Audf1.new(bus),
        0x19 => Audv0.new(bus),
        0x1A => Audv0.new(bus),
        0x1B => Grp0.new(bus),
        0x1C => Gfp1.new(bus),
        0x1D => Enam0.new(bus),
        0x1E => Enam1.new(bus),
        0x1F => Enabl.new(bus),
        0x20 => Hmp0.new(bus),
        0x21 => Hmp1.new(bus),
        0x22 => Hmm0.new(bus),
        0x23 => Hmm1.new(bus),
        0x24 => Hmbl.new(bus),
        0x25 => Vdelp0.new(bus),
        0x26 => Vdelp1.new(bus),
        0x27 => Vdelbl.new(bus),
        0x28 => Resmp0.new(bus),
        0x29 => Resmp1.new(bus),
        0x2A => Hmove.new(bus),
        0x2B => Hmclr.new(bus),
        0x2C => Cxclr.new(bus),


        0x30 => Cxm0p.new(bus),
        0x31 => Cxm1p.new(bus),
        0x32 => Cxp0fb.new(bus),
        0x33 => Cxp1fb.new(bus),
        0x34 => Cxm0fb.new(bus),
        0x35 => Cxm1fb.new(bus),
        0x36 => Cxblpf.new(bus),
        0x37 => Cxppmm.new(bus),
        0x38 => Inpt0.new(bus),
        0x39 => Inpt1.new(bus),
        0x3A => Inpt2.new(bus),
        0x3B => Inpt3.new(bus),
        0x3C => Inpt4.new(bus),
        0x3D => Inpt5.new(bus)
    }
  end

  def tick
    update_horizontal_flags
    update_vertical_flags

  end

  def read_byte(addr)
    0
  end

  def write_byte(addr, value)
    register = @registers[addr]
    return if register == nil
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