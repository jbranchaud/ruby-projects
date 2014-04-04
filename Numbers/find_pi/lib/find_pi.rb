# Find PI to the Nth Digit

module FindPi
  
  # computes Pi to the given number of decimal places, returning the
  # resulting value as a string.
  def self.find(decimal_places)
    if decimal_places == 0
      "3"
    elsif decimal_places < 0 || decimal_places > 45
      "error"
    else
      self.compute_machin_like(decimal_places)
    end
  end

  # compute Machin-Like formula
  # (http://en.wikipedia.org/wiki/Machin-like_formula) to the given number
  # of decimal places and return as a string
  def self.compute_machin_like(decimal_places)
    # compute Machin-Like formula and trim to appropriate decimal places
    "%.#{decimal_places}f" % (4.0 * (22.0 * Math.atan(24478.0/873121.0) + 17.0 * Math.atan(685601.0/69049993.0)))
  end

  # compute Machin formula
  # (http://en.wikipedia.org/wiki/Machin-like_formula)
  # to the given number of decimal places and return as a string
  def self.compute_machin(decimal_places)
    # compute Machin formula and trim to appropriate decimal places
    "%.#{decimal_places}f" % (16.0 * Math.atan(1.0/5.0) - 4.0 * Math.atan(1.0/239.0))
  end

end
