# Caesar Cipher

module CaesarCipher

  def self.encode_letter(letter,offset)
    # if it isn't an alphabet character, return it as is
    return letter if letter =~ /[^a-zA-Z]/

    # scrub the offset, mod it by 26 to make sure we are working with
    # something between 0 and 25. Modding works because with caesar cipher,
    # it would just wrap anyway and end up with the same result.
    normal_offset = offset % 26

    # ensure that we are working with an uppercase letter
    upper_letter = letter.upcase

    # A is 65, Z is 90
    # Subtract 65 (our base) from the #ord of letter, add the offset, mod by
    # 26 to make sure we are operating between 0 and 25, then add 65 back
    # into the equation, then convert to a UTF-8 character.
    ((( upper_letter.ord - 65 + normal_offset ) % 26 ) + 65 ).chr("UTF-8")
  end

  # encode a given string using the given offset value, return the resulting
  # encoded string.
  def self.encode(string,offset)
    string.split("").map do |character|
      self.encode_letter(character,offset)
    end.join
  end

  # decode a given letter using the given offset value, return the resulting
  # decoded letter.
  def self.decode_letter(letter,offset)
    # if it isn't an alphabet character, return it as is
    return letter if letter =~ /[^a-zA-Z]/

    # ensure that we are working with an uppercase letter
    upper_letter = letter.upcase

    # A is 65, Z is 90
    # Subtract 65 (our base) from the #ord of letter, subtract the offset, mod
    # by 26 to make sure we are operating between 0 and 25, then add 65 back
    # into the equation, then convert to a UTF-8 character
    ((( upper_letter.ord - 65 - offset ) % 26 ) + 65 ).chr("UTF-8")
  end

  # decode a given string using the given offset value, return the resulting
  # decoded string.
  def self.decode(string,offset)
    string.split("").map do |character|
      self.decode_letter(character,offset)
    end.join
  end

end
