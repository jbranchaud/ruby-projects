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
    puts "## Count Vowels ##"
    puts "1. count all the vowels in a given string."
    puts "2. count occurrences of each vowel in a given string."
    print "Choose an option [1/2] "
    option = gets.chomp.to_i
    
    if option == 1
      self.prompt_count_vowels
    elsif option == 2
      self.prompt_count_each_vowel
    else
      puts "Invalid option selected, exiting."
    end
  end

  # prompt for a string to run through count_vowels
  def self.prompt_count_vowels
    print "Enter a string, we will count its vowels: "
    string = gets.chomp

    puts self.count_vowels(string)
  end

  # prompt for a string to run through count_each_vowel
  def self.prompt_count_each_vowel
    print "Enter a string, we will produce a count of each vowel's occurrence: "
    string = gets.chomp

    puts self.count_each_vowel(string)
  end

end

# if file is run directly, prompt the user
if __FILE__==$0
  CountVowels.prompt_user
end
