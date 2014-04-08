# Count Vowels

module CountVowels

  # given a string, count the vowels that appear in the string and return
  # that count as an integer.
  def self.count_vowels(string)
    string.scan(/[aeiouAEIOU]/).size
  end

  # prompt the user for a string to do vowel count on
  def self.prompt_user
    print "Enter a string, we will count its vowels: "
    string = gets.chomp

    puts self.count_vowels(string)
  end

end

# if file is run directly, prompt the user
if __FILE__==$0
  CountVowels.prompt_user
end
