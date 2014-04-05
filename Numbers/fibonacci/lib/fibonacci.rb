require "fibonacci/version"

module Fibonacci
  
  # given a positive integer, n, this method will generate a string that is
  # a fibonacci sequence based at 0 up to the nth value. It will be comma
  # separated. For example, given 3, the returned value will be "0,1,1,2".
  def self.compute_to_nth(n)
    sequence_array = Array.new
    (0..n).each do |x|
      sequence_array.push(self.compute_nth(x))
    end
    sequence_array.join(',')
  end

  # given a positive integer, n, this method will compute the Nth value in
  # the fibonacci sequence such that the 0th is 0, the 1st is 1, and so
  # forth. The resulting integer value will be returned.
  def self.compute_nth(n)
    return "error" if n < 0
    return 0 if n == 0
    return 1 if n == 1
    return self.compute_nth(n-1) + self.compute_nth(n-2)
  end

end
