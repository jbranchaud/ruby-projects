require 'spec_helper'

describe CaesarCipher do

  describe 'offset_letter' do

    it "should return an offset alphabet character given the original and the offset" do
      letter_offset_hash = {
        0 =>  { "A" => "A", "B" => "B", "J" => "J", "R" => "R", "Z" => "Z" },
        1 =>  { "A" => "B", "B" => "C", "J" => "K", "R" => "S", "Z" => "A" },
        2 =>  { "A" => "C", "B" => "D", "J" => "L", "R" => "T", "Z" => "B" },
        5 =>  { "A" => "F", "B" => "G", "J" => "O", "R" => "W", "Z" => "E" },
        25 => { "A" => "Z", "B" => "A", "J" => "I", "R" => "Q", "Z" => "Y" }
      }
      letter_offset_hash.each do |offset,letter_hash|
        letter_hash.each do |letter,offset_letter|
          CaesarCipher.offset_letter(letter,offset).should eq(offset_letter)
        end
      end
    end

  end

end
