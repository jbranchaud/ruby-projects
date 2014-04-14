require "count_words/version"

module CountWords

  # given a string, this method computes a simple word count by splitting on
  # spaces
  def self.simple_word_count(string)
    string.split.length
  end

end
