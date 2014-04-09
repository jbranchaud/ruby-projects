# Palindrome

module Palindrome

  # given a string, determine if it is a palindrome by verifying that it
  # reads the same forwards and backwards.
  def self.palindrome?(string)
    #string == string.reverse
    m = 0
    n = string.length - 1
    while m < n do
      return false if string[m] != string[n]
      m += 1
      n -= 1
    end
    return true
  end

end
