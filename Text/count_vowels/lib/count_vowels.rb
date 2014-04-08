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
    # prompt user for the type of count they want
    puts "What type of vowel count would you like to perform:"
    puts "1. count all the vowels in a given string."
    puts "2. count occurrences of each vowel in a given string."
    print "Choose an option [1/2] "
    count_type_option = gets.chomp.to_i
    # prompt user for input method (enter string vs. read file)
    puts "What type of input method would you like to use:"
    puts "1. I would like to type in a string."
    puts "2. I would like to give a file to read from."
    print "Choose an option [1/2] "
    input_type_option = gets.chomp.to_i

    input_string = ""
    if input_type_option == 1
      print "Enter the string you would like to use: "
      input_string = gets.chomp
    elsif input_type_option == 2
      print "Enter the name of the file you would like to use: "
      filename = gets.chomp
      input_string = File.read(filename)
    else
      puts "Invalid option selected, exiting."
    end
    
    if count_type_option == 1
      self.prompt_count_vowels(input_string)
    elsif count_type_option == 2
      self.prompt_count_each_vowel(input_string)
    else
      puts "Invalid option selected, exiting."
    end
  end

  # prompt for a string to run through count_vowels
  def self.prompt_count_vowels(input_string)
    puts "The total number of vowels for the given input is: #{self.count_vowels(input_string)}"
  end

  # prompt for a string to run through count_each_vowel
  def self.prompt_count_each_vowel(input_string)
    puts "The occurrences of each vowel for the given input are as follows:"
    self.put_vowel_hash(self.count_each_vowel(input_string))
  end

  # given a hash of vowel counts (strings to ints), print the hash in a
  # user-friendly way
  def self.put_vowel_hash(vowel_hash)
    vowel_hash.each do |vowel,count|
      puts "#{vowel}: #{count}"
    end
  end

end

# if file is run directly, prompt the user
if __FILE__==$0
  CountVowels.prompt_user
end
