# reverse_string.rb

module ReverseString

  def self.reverse_string(string)
    string.reverse
  end

  def self.prompt_user
    print 'Enter a string to be reversed: '
    input_string = gets.chomp
    puts self.reverse_string(input_string)
  end

end

if __FILE__==$0
  ReverseString.prompt_user
end
