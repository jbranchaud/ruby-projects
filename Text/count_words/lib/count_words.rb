require "count_words/version"

module CountWords

  # given a string, this method computes a simple word count by splitting on
  # spaces
  def self.simple_word_count(string)
    string.split.length
  end

  # given a string, this method computes a simple word summary that contains
  # each unique word mapped to the number of occurrences of that word in the
  # string. Returns a hash containing this association.
  def self.simple_word_summary(string)
    summary_hash = {}
    string.split.each do |word|
      summary_hash[word] = (summary_hash[word] || 0) + 1
    end
    summary_hash
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
