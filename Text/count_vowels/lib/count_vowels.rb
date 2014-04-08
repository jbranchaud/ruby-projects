# Count Vowels

module CountVowels

  # given a string, count the vowels that appear in the string and return
  # that count as an integer.
  def self.count_vowels(string)
    string.scan(/[aeiouAEIOU]/).size
  end

  # given a string, count the occurrences of each vowel (lower and upper
  # case) in the string and return the counts in a hash where the keys are
  # each of the vowels that appear and the values are the respective
  # counts.
  def self.count_each_vowel(string)
    vowel_hash = {}
    string.split("").each do |char|
      if char =~ /[aeiouAEIOU]/
        vowel_hash[char] = 1 + (vowel_hash[char] || 0)
      end
    end
    return vowel_hash
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
