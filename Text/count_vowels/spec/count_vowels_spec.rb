require 'spec_helper'

describe CountVowels do

  describe 'count_vowels' do

    it "should return the number of vowels in a given string" do
      string_hash = {
        "a" =>  1,
        "b" =>  0,
        "abcdefg" =>  2,
        "hello, world" =>  3,
        "this is a long sentence with lots of words and letters in it." =>  16,
        ".,/'()" =>  0
      }
      string_hash.each do |string,count|
        CountVowels.count_vowels(string).should eq(count)
      end
    end

  end

end
