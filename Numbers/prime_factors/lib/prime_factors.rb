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

end
