# Count Vowels

module CountVowels

  # given a string, count the vowels that appear in the string and return
  # that count as an integer.
  def self.count_vowels(string)
    string.scan(/[aeiouAEIOU]/).size
  end

end
