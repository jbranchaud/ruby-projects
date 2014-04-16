# Count Words

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

  # given a string, this method computes a more advanced word summary than
  # that produced by self.simple_word_summary. It produces a summary that
  # contains each unique word mapped to the number of occurrences of that
  # word in the string. Returns a hash containing this association.
  def self.word_summary(string)
    summary_hash = {}
  end

  # given a string and a regex, start trimming characters off the front of
  # the string until one is reached that doesn't match the given regex. This
  # method is destructive for the string.
  def self.trim_from_front!(string, regex)
    while string != '' && string[0] =~ regex
      string.slice!(0)
    end
  end

  # given a string and a regex, start trimming characters off the back of
  # the string until one is reached that doesn't match the given regex. This
  # method is destructive for the string.
  def self.trim_from_back!(string, regex)
    while string != '' && string[-1] =~ regex
      string.slice!(-1)
    end
  end

end
