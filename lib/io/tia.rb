require_relative './../bus'

module IoRegister

  attr_accessor :value

  def set(value)
    @value = value && 0xFF
  end

  def get
    @value
  end

end


class Vsync
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus
  end

end

class Vblank
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Wsync
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Rsync
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Nusiz0
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Nusiz1
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Colup0
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Colup1
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class ColupF
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Colubk
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Ctrlpf
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Refp0
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Refp1
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Pf0
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Pf1
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Pf2
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Resp0
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Resp1
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Resm0
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Resm1
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Resbl
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Audc0
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Audc1
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Audf0
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Audf1
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Audv0
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Audv1
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Grp0
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Gfp1
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Enam0
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Enam1
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Enabl
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Hmp0
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Hmp1
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Hmm0
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Hmm1
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Hmbl
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Vdep0
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Vdep1
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Vdepbl
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Resmp0
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Resmp1
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Hmove
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Hmclr
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Cxclr
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Vdelp0
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Vdelp1
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Vdelbl
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Cxm0p
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Cxm1p
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Cxp0fb
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Cxp1fb
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Cxm0fb
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Cxm1fb
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Cxblpf
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Cxppmm
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Inpt0
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Inpt1
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Inpt2
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Inpt3
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Inpt4
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Inpt5
  include IoRegister

  def initialize(bus)
    @value = 0
    @bus = bus

  end

end

class Tia

  def initialize(bus)
    @bus = bus
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

end