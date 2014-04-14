require "count_words/version"

module CountWords

  # given a string, this method computes a simple word count by splitting on
  # spaces
  def self.simple_word_count(string)
    string.split.length
  end

  # given a string, this method computes a more advanced word count by
  # considering punctuation and non-word entities.
  def self.word_count(string)
    # start by splitting on whitespace
    words = string.split(/\s/)
    words.reject! do |word|
      word =~ /^\W+$/
    end
    words.length
  end

end
