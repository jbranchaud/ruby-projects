# Palindrome

module Palindrome

  # given a string, determine if it is a palindrome by verifying that it
  # reads the same forwards and backwards.
  def self.palindrome?(string)
    #string == string.reverse
    m = 0
    n = string.length - 1
    while m < n do
      return false if string[m] != string[n]
      m += 1
      n -= 1
    end
    return true
  end

  # given a stirng, determine the largest substring within the string that
  # is a plaindrome. If the string itself is a palindrome, then it will be
  # the result. If there is no substring that is a palindrome, then the
  # first character of the string (as well as all subsequent characters) is
  # the longest palindrome and will be returned.
  def self.longest_palindrome(string)
    return string if string == ""
    n = string.length-1
    (0..n).each do |i|
      (0..i).each do |j|
        return string[j..(n-i+j)] if Palindrome.palindrome?(string[j..(n-i+j)])
      end
    end
  end

  # given a string, find all substring palindromes of that string and return
  # them as an array of strings. This includes the string itself if it is a
  # palindrome.
  def self.find_all_substring_palindromes(string)
    return [string] if string == ""
    palindromes = []
    n = string.length - 1
    (0..n).each do |i|
      (0..i).each do |j|
        palindromes << string[j..(n-i+j)] if Palindrome.palindrome?(string[j..(n-i+j)])
      end
    end
    return palindromes
  end

  # get the input string either from the user or from a file provided by the
  # user
  # if input_option == 1, get the input from the user
  # if input_option == 2, get a filename and grab its first line
  def self.get_input_string(input_option)
    if input_option == 1
      print "Please type the text you would like to check for palindrome: "
      return gets.chomp
    elsif input_option == 2
      print "Please enter the path of the file you would like to use: "
      filename = gets.chomp
      return File.open(filename, &:readline)
    else
      return ""
    end
  end

  # prompt the user to input a string or a file to run the palindrome check
  # on.
  def self.prompt_user
    puts "## Palindrome ##"
    puts "1. Enter text by hand and check if it is a palindrome."
    puts "2. Enter a filename to check the first line for a palindrome."
    print "Choose an option (1/2): "
    input_option = gets.chomp.to_i
    
    input_string = self.get_input_string(input_option)

    puts "Now checking the palindromicity of:"
    puts input_string

    is_palindrome = self.palindrome?(input_string)
    if !is_palindrome
      puts "The input is not a palindrome, though the largest substring palindrome is:"
      puts self.longest_palindrome(input_string)
    else
      puts "The input is a palindrome."
    end
    puts "The following is a list of all substring palindromes for the input:"
    puts self.find_all_substring_palindromes(input_string).join(", ")
  end

end

# call this code if the file is invoked directly
if __FILE__==$0
  Palindrome.prompt_user
end
