class Luhn
  attr_reader :digits

  def initialize(digits)
    @digits = digits.to_s.chars.map(&:to_i)
  end

  def addends
    digits.reverse.map.with_index do |digit, index|
      if index.even?
        digit
      else
        (digit * 2) > 10 ? digit = (digit * 2) - 9 : digit *= 2
      end
    end.reverse
  end

  def checksum
    addends.reduce(:+)
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(digits)
    luhn = Luhn.new(digits * 10)
    check_digit = 0
    if !luhn.valid?
      check_digit = 10 - (luhn.checksum % 10)
    end
    luhn.digits.join.to_i + check_digit
  end
end
