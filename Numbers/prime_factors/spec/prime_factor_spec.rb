require 'spec_helper'

describe PrimeFactors do

  it "should return true" do
    true
  end

  describe 'is_prime?' do
    
    it "should return true given a prime number" do
      PrimeFactors.is_prime?(2).should eq(true)
      PrimeFactors.is_prime?(3).should eq(true)
      PrimeFactors.is_prime?(5).should eq(true)
      PrimeFactors.is_prime?(11).should eq(true)
      PrimeFactors.is_prime?(17).should eq(true)
      PrimeFactors.is_prime?(131).should eq(true)
      PrimeFactors.is_prime?(997).should eq(true)
    end

  end

end
