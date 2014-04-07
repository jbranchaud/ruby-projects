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

  end

end
