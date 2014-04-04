require 'spec_helper'

describe Fibonacci do
  it 'should have a version number' do
    Fibonacci::VERSION.should_not be_nil
  end

  it 'should do something useful' do
    false.should eq(true)
  end
end
