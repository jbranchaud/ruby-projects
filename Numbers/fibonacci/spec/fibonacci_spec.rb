require 'spec_helper'

describe Fibonacci do
  it 'should have a version number' do
    Fibonacci::VERSION.should_not be_nil
  end

  it 'should compute simple fibonacci sequences' do
    Fibonacci.compute_to_nth(0).should eq("0")
    Fibonacci.compute_to_nth(1).should eq("0,1")
    Fibonacci.compute_to_nth(2).should eq("0,1,1")
    Fibonacci.compute_to_nth(3).should eq("0,1,1,2")
  end

  it 'should compute larger fibonacci sequences' do
    Fibonacci.compute_to_nth(6).should eq("0,1,1,2,3,5,8")
    Fibonacci.compute_to_nth(12).should eq("0,1,1,2,3,5,8,13,21,34,55,89,144")
    Fibonacci.compute_to_nth(28).should eq("0,1,1,2,3,5,8,13,21,34,55,89,144,233,377,610,987,1597,2584,4181,6765,10946,17711,28657,46368,75025,121393,196418,317811")
  end
end
