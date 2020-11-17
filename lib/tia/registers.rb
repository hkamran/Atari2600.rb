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

end

class Vblank < IoRegister

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
