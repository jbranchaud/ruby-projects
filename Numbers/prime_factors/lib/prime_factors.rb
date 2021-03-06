# Prime Factors

module PrimeFactors

  # compute a full list of prime factors of a given integer, n
  # while n is greater than 1,
  #   get the least divisor of n
  #   add it to the list of least factors
  #   set n to be n divided by the least factor
  # return least factors
  def self.compute(n)
    least_factors = []
    while n > 1 do
      factor = self.least_divisor(n)
      least_factors.push(factor)
      n = n / factor
    end
    return least_factors
  end

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

  # prompt the user for an integer to compute the prime factors for
  def self.prompt_user
    print "Compute the prime factors for: "
    n = gets.chomp
    puts self.compute(n.to_i).to_s
  end

end

if __FILE__==$0
  PrimeFactors.prompt_user
end
