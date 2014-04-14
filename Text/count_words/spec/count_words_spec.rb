require 'spec_helper'

describe CountWords do

  describe 'simple_word_count' do

    it "should return a simple word count for a given string" do
      test_string_hash = {
        "ruby" => 1,
        "hello, world!" => 2,
        "hyphenated-word" => 1,
        "It is a joy to write Ruby code." => 8,
        "I'd say this string isn't what it seems." => 8,
        "The K&R book is a good C resource." => 8,
        "What... what are you talking about?" => 6,
        "I am writing this program -- the word count program -- that can count words." => 15,
        "This string is going to be a lot longer than some of the strings we have seen so far. It is even going to have more than one sentence. It might even have a third sentence with some [...] content that has been excluded." => 44
      }
      test_string_hash.each do |string,count|
        CountWords.simple_word_count(string).should eq(count)
      end
    end

  end

  describe 'simple_word_summary' do

    it "should return a hash of each unique word and the number of occurrences of that word" do
      test_string_hash = {
        "ruby" =>
        { "ruby" => 1 },
        "hello, world!" =>
        { "hello," => 1,
          "world!" => 1
        },
        "hyphenated-word" =>
        { "hyphenated-word" => 1
        },
        "It is a joy to write Ruby code." =>
        { "It" => 1,
          "is" => 1,
          "a" => 1,
          "joy" => 1,
          "to" => 1,
          "write" => 1,
          "Ruby" => 1,
          "code." => 1
        },
        "I'd say this string isn't what it seems." =>
        { "I'd" => 1,
          "say" => 1,
          "this" => 1,
          "string" => 1,
          "isn't" => 1,
          "what" => 1,
          "it" => 1,
          "seems." => 1
        },
        "The K&R book is a good C resource." =>
        { "The" => 1,
          "K&R" => 1,
          "book" => 1,
          "is" => 1,
          "a" => 1,
          "good" => 1,
          "C" => 1,
          "resource" => 1
        },
        "What... what are you talking about?" =>
        { "What..." => 1,
          "what" => 1,
          "are" => 1,
          "you" => 1,
          "talking" => 1,
          "about?" => 1
        },
        "I am writing this program -- the word count program -- that can count words." =>
        { "I" => 1,
          "am" => 1,
          "writing" => 1,
          "this" => 1,
          "program" => 2,
          "--" => 2,
          "the" => 1,
          "word" => 1,
          "count" => 2,
          "that" => 1,
          "can" => 1,
          "words." => 1
        },
        "This string is going to be a lot longer than some of the strings we have seen so far. It is even going to have more than one sentence. It might even have a third sentence with some [...] content that has been excluded." =>
        {
          "It" => 2,
          "This" => 1,
          "[...]" => 1,
          "a" => 2,
          "be" => 1,
          "been" => 2,
          "content" => 1,
          "even" => 2,
          "excluded." => 1,
          "far." => 1,
          "going" => 2,
          "has" => 2,
          "hat" => 1,
          "have" => 3,
          "is" => 2,
          "longer" => 1,
          "lot" => 1,
          "might" => 1,
          "more" => 1,
          "of" => 1,
          "one" => 1,
          "seen" => 1,
          "sentence" => 1,
          "sentence." => 1,
          "so" => 1,
          "some" => 2,
          "string" => 1,
          "strings" => 1,
          "than" => 2,
          "that" => 1,
          "the" => 1,
          "third" => 1,
          "to" => 2,
          "we" => 1,
          "with" => 1
        }
      }
      test_string_hash.each do |string,oracle_hash|
        CountWords.simple_word_summary(string).should eq(oracle_hash)
      end
    end

  end

  describe 'word_count' do

    it "should return a word count for a given string" do
      test_string_hash = {
        "ruby" => 1,
        "hello, world!" => 2,
        "hyphenated-word" => 1,
        "It is a joy to write Ruby code." => 8,
        "I'd say this string isn't what it seems." => 8,
        "The K&R book is a good C resource." => 8,
        "What... what are you talking about?" => 6,
        "I am writing this program -- the word count program -- that can count words." => 13,
        "This string is going to be a lot longer than some of the strings we have seen so far. It is even going to have more than one sentence. It might even have a third sentence with some [...] content that has been excluded." => 43
      }
      test_string_hash.each do |string,count|
        CountWords.word_count(string).should eq(count)
      end
    end

  end

  describe 'word_summary' do

  end

end
