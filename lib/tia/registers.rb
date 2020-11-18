class IoRegister

  attr_accessor :value

  def initialize(bus)
    @value = 0
    @bus = bus
  end

  def set(value)
    @value = value && 0xFF
  end

  def get
    @value
  end

end

class Vsync < IoRegister

  def is_on()
    (@value & 0x2) != 0
  end

end

class Vblank < IoRegister

  def is_on()
    (@value & 0x2) != 0
  end

end

class Wsync < IoRegister

end

class Rsync < IoRegister

end

class Nusiz0 < IoRegister

end

class Nusiz1 < IoRegister

end

class Colup0 < IoRegister

end

class Colup1 < IoRegister

end

class ColupF < IoRegister

end

class Colubk < IoRegister

end

class Ctrlpf < IoRegister

end

class Refp0 < IoRegister

end

class Refp1 < IoRegister

end

class Pf0 < IoRegister

end

class Pf1 < IoRegister

end

class Pf2 < IoRegister

end

class Resp0 < IoRegister

end

class Resp1 < IoRegister

end

class Resm0 < IoRegister

end

class Resm1 < IoRegister
end

class Resbl < IoRegister

end

class Audc0 < IoRegister

end

class Audc1 < IoRegister

end

class Audf0 < IoRegister

end

class Audf1 < IoRegister

end

class Audv0 < IoRegister

end

class Audv1 < IoRegister

end

class Grp0 < IoRegister

end

class Gfp1 < IoRegister

end

class Enam0 < IoRegister

end

class Enam1 < IoRegister

end

class Enabl < IoRegister

end

class Hmp0 < IoRegister

end

class Hmp1 < IoRegister

end

class Hmm0 < IoRegister

end

class Hmm1 < IoRegister

end

class Hmbl < IoRegister

end

class Vdep0 < IoRegister

end

class Vdep1 < IoRegister

end

class Vdepbl < IoRegister

end

class Resmp0 < IoRegister

end

class Resmp1 < IoRegister

end

class Hmove < IoRegister

end

class Hmclr < IoRegister

end

class Cxclr < IoRegister

end

class Vdelp0 < IoRegister

end

class Vdelp1 < IoRegister

end

class Vdelbl < IoRegister

end

class Cxm0p < IoRegister

end

class Cxm1p < IoRegister

end

class Cxp0fb < IoRegister

end

class Cxp1fb < IoRegister

end

class Cxm0fb < IoRegister

end

class Cxm1fb < IoRegister

end

class Cxblpf < IoRegister

end

class Cxppmm < IoRegister

end

class Inpt0 < IoRegister

end

class Inpt1 < IoRegister

end

class Inpt2 < IoRegister

end

class Inpt3 < IoRegister

end

class Inpt4 < IoRegister

end

class Inpt5 < IoRegister

end

class TiaRegisters

  attr_accessor :vsync, :vblank, :wsync, :rsync, :nusiz0, :nusiz1, :colup0, :colup1, :colupf, :colubk, :ctrlpf, :refp0, :refp1, :pf0, :pf1, :pf2, :resp0, :resp1, :resm0, :resm1, :resbl, :audc0, :audc1, :audf0, :audf1, :audv0, :audv0, :grp0, :gfp1, :enam0, :enam1, :enabl, :hmp0, :hmp1, :hmm0, :hmm1, :hmbl, :vdelp0, :vdelp1, :vdelbl, :resmp0, :resmp1, :hmove, :hmclr, :cxclr, :cxm0p, :cxm1p, :cxp0fb, :cxp1fb, :cxm0fb, :cxm1fb, :cxblpf, :cxppmm, :inpt0, :inpt1, :inpt2, :inpt3, :inpt4, :inpt5

  def initialize(bus)
    @vsync = Vsync.new(bus)
    @vblank = Vblank.new(bus)
    @wsync = Wsync.new(bus)
    @rsync = Rsync.new(bus)
    @nusiz0 = Nusiz0.new(bus)
    @nusiz1 = Nusiz1.new(bus)
    @colup0 = Colup0.new(bus)
    @colup1 = Colup1.new(bus)
    @colupF = ColupF.new(bus)
    @colubk = Colubk.new(bus)
    @ctrlpf = Ctrlpf.new(bus)
    @refp0 = Refp0.new(bus)
    @refp1 = Refp1.new(bus)
    @pf0 = Pf0.new(bus)
    @pf1 = Pf1.new(bus)
    @pf2 = Pf2.new(bus)
    @resp0 = Resp0.new(bus)
    @resp1 = Resp1.new(bus)
    @resm0 = Resm0.new(bus)
    @resm1 = Resm1.new(bus)
    @resbl = Resbl.new(bus)
    @audc0 = Audc0.new(bus)
    @audc1 = Audc1.new(bus)
    @audf0 = Audf0.new(bus)
    @audf1 = Audf1.new(bus)
    @audv0 = Audv0.new(bus)
    @audv0= Audv0.new(bus)
    @grp0 = Grp0.new(bus)
    @gfp1 = Gfp1.new(bus)
    @enam0 = Enam0.new(bus)
    @enam1 = Enam1.new(bus)
    @enabl = Enabl.new(bus)
    @hmp0 = Hmp0.new(bus)
    @hmp1 = Hmp1.new(bus)
    @hmm0 = Hmm0.new(bus)
    @hmm1 = Hmm1.new(bus)
    @hmbl = Hmbl.new(bus)
    @vdelp0 = Vdelp0.new(bus)
    @vdelp1 = Vdelp1.new(bus)
    @vdelbl = Vdelbl.new(bus)
    @resmp0 = Resmp0.new(bus)
    @resmp1 = Resmp1.new(bus)
    @hmove = Hmove.new(bus)
    @hmclr = Hmclr.new(bus)
    @cxclr = Cxclr.new(bus)

    @cxm0p = Cxm0p.new(bus)
    @cxm1p = Cxm1p.new(bus)
    @cxp0fb = Cxp0fb.new(bus)
    @cxp1fb = Cxp1fb.new(bus)
    @cxm0fb = Cxm0fb.new(bus)
    @cxm1fb = Cxm1fb.new(bus)
    @cxblpf = Cxblpf.new(bus)
    @cxppmm = Cxppmm.new(bus)
    @inpt0 = Inpt0.new(bus)
    @inpt1 = Inpt1.new(bus)
    @inpt2 = Inpt2.new(bus)
    @inpt3 = Inpt3.new(bus)
    @inpt4 = Inpt4.new(bus)
    @inpt5 = Inpt5.new(bus)

    @map = {
        0x00 => @vsync,
        0x01 => @vblank,
        0x02 => @wsync,
        0x03 => @rsync,
        0x04 => @nusiz0,
        0x05 => @nusiz1,
        0x06 => @colup0,
        0x07 => @colup1,
        0x08 => @colupf,
        0x09 => @colubk,
        0x0a => @ctrlpf,
        0x0b => @refp0,
        0x0c => @refp1,
        0x0d => @pf0,
        0x0e => @pf1,
        0x0f => @pf2,
        0x10 => @resp0,
        0x11 => @resp1,
        0x12 => @resm0,
        0x13 => @resm1,
        0x14 => @resbl,
        0x15 => @audc0,
        0x16 => @audc1,
        0x17 => @audf0,
        0x18 => @audf1,
        0x19 => @audv0,
        0x1a => @audv0,
        0x1b => @grp0,
        0x1c => @gfp1,
        0x1d => @enam0,
        0x1e => @enam1,
        0x1f => @enabl,
        0x20 => @hmp0,
        0x21 => @hmp1,
        0x22 => @hmm0,
        0x23 => @hmm1,
        0x24 => @hmbl,
        0x25 => @vdelp0,
        0x26 => @vdelp1,
        0x27 => @vdelbl,
        0x28 => @resmp0,
        0x29 => @resmp1,
        0x2a => @hmove,
        0x2b => @hmclr,
        0x2c => @cxclr,


        0x30 => @cxm0p,
        0x31 => @cxm1p,
        0x32 => @cxp0fb,
        0x33 => @cxp1fb,
        0x34 => @cxm0fb,
        0x35 => @cxm1fb,
        0x36 => @cxblpf,
        0x37 => @cxppmm,
        0x38 => @inpt0,
        0x39 => @inpt1,
        0x3a => @inpt2,
        0x3b => @inpt3,
        0x3c => @inpt4,
        0x3d => @inpt5
    }
  end

  def get(code)
    map[code]
  end

end