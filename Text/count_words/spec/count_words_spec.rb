require 'spec_helper'

describe CountWords do

  describe 'simple_word_count' do
    test_string_hash = {
      "ruby" => 1,
      "hello, world!" => 2,
      "hyphenated-word" => 1,
      "It is a joy to write Ruby code." => 8,
      "I'd say this string isn't what it seems." => 8,
      "The K&R book is a good C resource." => 8,
      "What... what are you talking about?" => 6,
      "This string is going to be a lot longer than some of the strings we have seen so far. It is even going to have more than one sentence. It might even have a third sentence with some [...] content that has been excluded." => 44
    }
    test_string_hash.each do |string,count|
      CountWords.simple_word_count(string).should eq(count)
    end
  end

end
