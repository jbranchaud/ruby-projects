require 'spec_helper'

describe PrimeFactors do

  it "should return true" do
    true
  end

  describe 'is_prime?' do
    
    it "should return true given a prime number" do
      primes = [2,3,5,11,17,131,997]
      primes.each do |prime|
        PrimeFactors.is_prime?(prime).should eq(true)
      end
    end

    it "should return false given a non-prime number" do
      non_primes = [4,6,12,99,132,1000]
      non_primes.each do |non_prime|
        PrimeFactors.is_prime?(non_prime).should eq(false)
      end
    end

    it "should return false given an integer less than 2" do
      bad_ints = [0,1,-1,-11]
      bad_ints.each do |int|
        PrimeFactors.is_prime?(int).should eq(false)
      end
    end

  end

end
