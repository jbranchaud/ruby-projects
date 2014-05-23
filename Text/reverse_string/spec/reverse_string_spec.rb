require 'spec_helper'

describe ReverseString do
  
  describe 'reverse_string' do

    it 'should reverse the given string' do
      string_reversing_hash = {
        "hello" => "olleh",
        "abc" => "cba",
        "" => "",
        "Z" => "Z",
        "and even a longer string" => "gnirts regnol a neve dna"
      }
      string_reversing_hash.each do |original_string,reverse_string|
        ReverseString.reverse_string(original_string).should eq(reverse_string)
      end
    end

  end
end
