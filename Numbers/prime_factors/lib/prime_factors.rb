require "prime_factors/version"

module PrimeFactors

  # determine if a given integer, n, is a prime number
  # if n <= 1, then return false
  # if n % m == 0 for any integer m, where 2 <= m < n, return false
  # otherwise return true
  def self.is_prime?(n)
    return false if n <= 1
    (2...n).each do |m|
      return false if n % m == 0
    end
    return true
  end

  # determine the least divisor (excluding 1) of a given integer, n
  # if n <= 1, then return "error"
  # otherwise if n % m = 0 for an integer m, where 2 <= m <= n, return m
  # this requires that we start m at 2 and increment
  def self.least_divisor(n)
    return "error" if n <= 1
    (2..n).each do |m|
      return m if n % m == 0
    end
  end

end
