# BigDecimal#to_s without trailing zero
class BigDecimal
  def to_digits
    _, significant_digits, _, exponent = split
    if zero?
      '0'
    elsif exponent >= significant_digits.size
      to_i.to_s
    else
      to_s('F')
    end
  end
end
