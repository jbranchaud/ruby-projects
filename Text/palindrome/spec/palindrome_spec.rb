require 'spec_helper'

describe Palindrome do

  describe "palindrome?" do
    
    it "should return true when given a string that is the same forwards and backwards" do
      strings = ["","R","racecar","deified","amanaplanacanalpanama","AMANAPLANACANALPANAMA","1234567654321"]
      strings.each do |string|
        Palindrome.palindrome?(string).should == true
      end
    end

    it "should return false when given a string that isn't the same forwards and backwards" do
      strings = ["#bob","palindrome","google","AManAPlanACanalPanama","A Man A Plan A Canal Panama","YOLO"]
      strings.each do |string|
        Palindrome.palindrome?(string).should == false
      end
    end

  end

  describe "largest_palindrome" do

    it "should return the largest substring that is the same forwards and backwards" do
      strings = {"" => "",
                 "z" => "z",
                 "#bob" => "bob",
                 "palindrome" => "p",
                 "google" => "goog",
                 "AManAPlanACanalPanama" => "ana",
                 "A Man A Plan A Canal Panama" => "ana",
                 "YOLO" => "OLO"}
      strings.each do |string,result|
        Palindrome.largest_palindrome(string).should eq(result)
      end
    end

  end

end
