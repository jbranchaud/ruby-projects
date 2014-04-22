require 'spec_helper'

describe CaesarCipher do

  describe 'encode_letter' do

    it "should encode the given alphabet character based on the offset" do
      letter_offset_hash = {
        0 =>  { "A" => "A", "B" => "B", "J" => "J", "R" => "R", "Z" => "Z" },
        1 =>  { "A" => "B", "B" => "C", "J" => "K", "R" => "S", "Z" => "A" },
        2 =>  { "A" => "C", "B" => "D", "J" => "L", "R" => "T", "Z" => "B" },
        5 =>  { "A" => "F", "B" => "G", "J" => "O", "R" => "W", "Z" => "E" },
        25 => { "A" => "Z", "B" => "A", "J" => "I", "R" => "Q", "Z" => "Y" }
      }
      letter_offset_hash.each do |offset,letter_hash|
        letter_hash.each do |letter,offset_letter|
          CaesarCipher.encode_letter(letter,offset).should eq(offset_letter)
        end
      end
    end

  end

  describe 'encode' do

    it "should encode the given string using the given offset" do
      encoding_hash = {
        0 =>  { "RUBY" => "RUBY", "HELLO, WORLD!" => "HELLO, WORLD!", "I am a 1337 coder!" => "I AM A 1337 CODER!" },
        1 =>  { "RUBY" => "SVCZ", "HELLO, WORLD!" => "IFMMP, XPSME!", "I am a 1337 coder!" => "J BN B 1337 DPEFS!" },
        2 =>  { "RUBY" => "TWDA", "HELLO, WORLD!" => "JGNNQ, YQTNF!", "I am a 1337 coder!" => "K CO C 1337 EQFGT!" },
        13 => { "RUBY" => "EHOL", "HELLO, WORLD!" => "URYYB, JBEYQ!", "I am a 1337 coder!" => "V NZ N 1337 PBQRE!" },
      }
      encoding_hash.each do |offset,encoding|
        encoding.each do |pre_string,post_string|
          CaesarCipher.encode(pre_string,offset).should eq(post_string)
        end
      end
    end

  end

end
