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

  describe 'count_each_vowel' do

    it "should return a hash of vowels to their respective counts" do
      string1 = "a"
      hash1 = {
        "a" => 1
      }
      hash1b = {
        "a" => 1
      }
      string2 = "hello, world!"
      hash2 = {
        "e" => 1,
        "o" => 2
      }
      string3 = "Keep your guard up and watch out for the epic HAXORZ!"
      hash3 = {
        "a" => 3,
        "e" => 4,
        "i" => 1,
        "o" => 3,
        "u" => 4,
        "A" => 1,
        "O" => 1
      }
      # compare each the result of running each string through
      # count_each_vowel with the oracle hashes from above.
      CountVowels.count_each_vowel(string1).should eq(hash1)
      CountVowels.count_each_vowel(string2).should eq(hash2)
      CountVowels.count_each_vowel(string3).should eq(hash3)
    end

  end

end
