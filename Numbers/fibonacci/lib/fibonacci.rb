# compute the fibonacci sequence to the nth value and up to the value n.

module Fibonacci
  
  # given a positive integer, n, this method will generate a string that is
  # a fibonacci sequence based at 0 up to the nth value. It will be comma
  # separated. For example, given 3, the returned value will be "0,1,1,2".
  def self.compute_to_nth(n)
    #sequence_array = Array.new
    #(0..n).each do |x|
    #  sequence_array.push(self.compute_nth(x))
    #end
    #sequence_array.join(',')
    self.compute_sequence_to_nth(n, Array.new).join(',')
  end

  # given a number n and an array, compute the sequence of fibonacci numbers
  # based on what is already partially computed in the array.
  def self.compute_sequence_to_nth(n, sequence)
    return sequence if (n+1) == 0
    return self.compute_sequence_to_nth(n-1, sequence.push(0)) if sequence.length == 0
    return self.compute_sequence_to_nth(n-1, sequence.push(1)) if sequence.length == 1
    return self.compute_sequence_to_nth(n-1, sequence.push(sequence[-1] + sequence[-2]))
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
