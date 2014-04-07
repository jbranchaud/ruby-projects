require 'spec_helper'

describe PrimeFactors do

  it "should return true" do
    true
  end

  describe 'compute' do

    it "should return the full list of prime factors for a given integer" do
      prime_factors_hash = {
        2 => [2],
        3 => [3],
        4 => [2,2],
        5 => [5],
        9 => [3,3],
        17 => [17],
        42 => [2,3,7],
        90 => [2,3,3,5],
        899 => [29,31],
        960 => [2,2,2,2,2,2,3,5]
      }
      prime_factors_hash.each do |n,prime_factors|
        PrimeFactors.compute(n).sort.should eq(prime_factors)
      end
    end

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

  describe 'least_divisor' do

    it "should return the least divisor of an integer" do
      divisor_hash = {4 => 2, 6 => 2, 9 => 3, 5 => 5, 42 => 2}
      divisor_hash.each do |x,y|
        PrimeFactors.least_divisor(x).should eq(y)
      end
    end

    it "should return error text for an integer less than 2" do
      bad_ints = [0,1,-1,-17,-144]
      bad_ints.each do |int|
        PrimeFactors.least_divisor(int).should eq("error")
      end
    end

  end

end
