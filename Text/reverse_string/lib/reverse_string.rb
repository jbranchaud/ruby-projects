# reverse_string.rb

module ReverseString

  # basic string reversal, nothing fancy
  def self.reverse_string(string)
    string.reverse
  end

  # prompt the user for a string to reverse
  def self.prompt_user
    print 'Enter a string to be reversed: '
    input_string = gets.chomp
    puts self.reverse_string(input_string)
  end

end

# this bit is run if the file is invoked directly
if __FILE__==$0
  ReverseString.prompt_user
end
