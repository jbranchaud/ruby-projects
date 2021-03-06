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

    it "should gracefully handle lowercase letters" do
      CaesarCipher.encode_letter("a",0).should eq("A")
      CaesarCipher.encode_letter("a",1).should eq("B")
      CaesarCipher.encode_letter("a",2).should eq("C")
      CaesarCipher.encode_letter("f",5).should eq("K")
    end

    it "should return non-alphabet characters as they are" do
      non_alphabet_characters = [" ","!",".",",","(",")"] + ("0".."9").to_a
      non_alphabet_characters.each do |char|
        CaesarCipher.encode_letter(char,5).should eq(char)
      end
    end

  end

  describe 'encode' do

    it "should encode the given string using the given offset" do
      encoding_hash = {
        0 =>  { "RUBY" => "RUBY", "HELLO, WORLD!" => "HELLO, WORLD!", "I am a 1337 coder!" => "I AM A 1337 CODER!" },
        1 =>  { "RUBY" => "SVCZ", "HELLO, WORLD!" => "IFMMP, XPSME!", "I am a 1337 coder!" => "J BN B 1337 DPEFS!" },
        2 =>  { "RUBY" => "TWDA", "HELLO, WORLD!" => "JGNNQ, YQTNF!", "I am a 1337 coder!" => "K CO C 1337 EQFGT!" },
        13 => { "RUBY" => "EHOL", "HELLO, WORLD!" => "URYYB, JBEYQ!", "I am a 1337 coder!" => "V NZ N 1337 PBQRE!" }
      }
      encoding_hash.each do |offset,encoding|
        encoding.each do |pre_string,post_string|
          CaesarCipher.encode(pre_string,offset).should eq(post_string)
        end
      end
    end

  end

  describe 'decode_letter' do

    it "should decode the given alphabet character based on the offset" do
      decode_letter_hash = {
        0 =>  { "A" => "A", "B" => "B", "J" => "J", "R" => "R", "Z" => "Z" },
        1 =>  { "A" => "Z", "B" => "A", "J" => "I", "R" => "Q", "Z" => "Y" },
        2 =>  { "A" => "Y", "B" => "Z", "J" => "H", "R" => "P", "Z" => "X" },
        5 =>  { "A" => "V", "B" => "W", "J" => "E", "R" => "M", "Z" => "U" },
        25 => { "A" => "B", "B" => "C", "J" => "K", "R" => "S", "Z" => "A" },
        26 => { "A" => "A", "B" => "B", "J" => "J", "R" => "R", "Z" => "Z" },
      }
      decode_letter_hash.each do |offset,letter_hash|
        letter_hash.each do |letter,decoded_letter|
          CaesarCipher.decode_letter(letter,offset).should eq(decoded_letter)
        end
      end
    end

    it "should gracefully handle lowercase letters" do
      CaesarCipher.decode_letter("a",0).should eq("A")
      CaesarCipher.decode_letter("a",1).should eq("Z")
      CaesarCipher.decode_letter("a",2).should eq("Y")
      CaesarCipher.decode_letter("f",5).should eq("A")
    end

    it "should return non-alphabet characters as they are" do
      non_alphabet_characters = [" ","!",".",",","(",")"] + ("0".."9").to_a
      non_alphabet_characters.each do |char|
        CaesarCipher.decode_letter(char,3).should eq(char)
      end
    end

  end

  describe 'decode' do

    it "should decode the given string using the given offset" do
      decoding_hash = {
        0 =>  { "RUBY" => "RUBY", "HELLO, WORLD!" => "HELLO, WORLD!", "I AM A 1337 CODER!" => "I AM A 1337 CODER!" },
        1 =>  { "SVCZ" => "RUBY", "IFMMP, XPSME!" => "HELLO, WORLD!", "J BN B 1337 DPEFS!" => "I AM A 1337 CODER!" },
        2 =>  { "TWDA" => "RUBY", "JGNNQ, YQTNF!" => "HELLO, WORLD!", "K CO C 1337 EQFGT!" => "I AM A 1337 CODER!" },
        13 => { "EHOL" => "RUBY", "URYYB, JBEYQ!" => "HELLO, WORLD!", "V NZ N 1337 PBQRE!" => "I AM A 1337 CODER!" }
      }
      decoding_hash.each do |offset,decoding|
        decoding.each do |pre_string,post_string|
          CaesarCipher.decode(pre_string,offset).should eq(post_string)
        end
      end
    end

  end

end
