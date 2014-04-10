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

  # given a stirng, determine the largest substring within the string that
  # is a plaindrome. If the string itself is a palindrome, then it will be
  # the result. If there is no substring that is a palindrome, then the
  # first character of the string (as well as all subsequent characters) is
  # the longest palindrome and will be returned.
  def self.longest_palindrome(string)
    return string if string == ""
    n = string.length-1
    (0..n).each do |i|
      (0..i).each do |j|
        return string[j..(n-i+j)] if Palindrome.palindrome?(string[j..(n-i+j)])
      end
    end
  end

end
