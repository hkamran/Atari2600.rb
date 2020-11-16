# frozen_string_literal: true
module CartridgeType
  NONE = "NONE".freeze
  MBC1 = "MBC1".freeze
  MBC2 = "MBC2".freeze
  MBC3 = "MBC3".freeze
  MBC4 = "MBC4".freeze
  MBC5 = "MBC5".freeze
end

class Cartridge

  def initialize(filepath)
    @rom = load(filepath)

    @title = @rom[0x134...0x143].pack('C*').force_encoding('utf-8')
    @manufacturer_code = @rom[0x13F...0x142].pack('C*').force_encoding('utf-8')
    @license = @rom[0x144...0x145]
    @type = get_mapping
    @banks = [0, 4, 8, 16, 32, 64, 128, 256][@rom[0x148]]
    @rom_size = [32, 64, 128, 256, 512, 1000, 2000, 4000][@rom[0x148]] * 1000
    @ram_size = [0000, 2000, 8000, 32000][@rom[0x149]]
    @checksum = @rom[0x14D]

    @ram = []
    for i in [0...@ram_size]
      @ram[i] = 0
    end
  end

  def read_byte(address)
    @rom[address & 0xFFFF]
  end

  def load(path)
    file = File.open(path)
    file.read.bytes
  end

  def get_title
    @title
  end

  private

  def get_mapping()
    type = @rom[0x147]
    if type == 0x00
      return CartridgeType::NONE
    elsif type == 0x01
      return CartridgeType::MBC1
    elsif type == 0x02
      return CartridgeType::MBC1
    elsif type == 0x03
      return CartridgeType::MBC1
    elsif type == 0x05
      return CartridgeType::MBC2
    elsif type == 0x06
      return CartridgeType::MBC2
    else
      raise "Unsupported cartridge type"
    end
  end

  public def to_s
    "Cartridge[title='#{@title.strip}', type='#{@type}', rom_size='#{@rom_size}', ram_size='#{@ram_size}']"
  end

end
