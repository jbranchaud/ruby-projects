require 'pathname' # deals with pathnames in a consistent way
require 'optparse' # parsing the command line arguments

# Caesar Cipher

module CaesarCipher

  def self.encode_letter(letter,offset)
    # if it isn't an alphabet character, return it as is
    return letter if letter =~ /[^a-zA-Z]/

    # scrub the offset, mod it by 26 to make sure we are working with
    # something between 0 and 25. Modding works because with caesar cipher,
    # it would just wrap anyway and end up with the same result.
    normal_offset = offset % 26

    # ensure that we are working with an uppercase letter
    upper_letter = letter.upcase

    # A is 65, Z is 90
    # Subtract 65 (our base) from the #ord of letter, add the offset, mod by
    # 26 to make sure we are operating between 0 and 25, then add 65 back
    # into the equation, then convert to a UTF-8 character.
    ((( upper_letter.ord - 65 + normal_offset ) % 26 ) + 65 ).chr("UTF-8")
  end

  # encode a given string using the given offset value, return the resulting
  # encoded string.
  def self.encode(string,offset)
    string.split("").map do |character|
      self.encode_letter(character,offset)
    end.join
  end

  # encode the given file with the given offset value, the encoded file
  # content should be written to the given output file. If no output file is
  # given, then write it to a new file with '.enc' appended to the end of the
  # input file's name (e.g. 'input.txt' -> 'input.txt.enc').
  def self.encode_file(offset,input_filename,output_filename="")
    # if no output filename is given, then create one
    if output_filename == ""
      output_filename = input_filename + ".enc"
    end

    File.open(output_filename, 'w') do |output_file|
      File.readlines(input_filename).each do |input_line|
        output_file.write( self.encode( input_line, offset ) )
      end
    end
  end

  # decode a given letter using the given offset value, return the resulting
  # decoded letter.
  def self.decode_letter(letter,offset)
    # if it isn't an alphabet character, return it as is
    return letter if letter =~ /[^a-zA-Z]/

    # ensure that we are working with an uppercase letter
    upper_letter = letter.upcase

    # A is 65, Z is 90
    # Subtract 65 (our base) from the #ord of letter, subtract the offset, mod
    # by 26 to make sure we are operating between 0 and 25, then add 65 back
    # into the equation, then convert to a UTF-8 character
    ((( upper_letter.ord - 65 - offset ) % 26 ) + 65 ).chr("UTF-8")
  end

  # decode a given string using the given offset value, return the resulting
  # decoded string.
  def self.decode(string,offset)
    string.split("").map do |character|
      self.decode_letter(character,offset)
    end.join
  end

  # decode the given file with the given offset value, the decoded file content
  # should be written to the given output file. If no output file is given,
  # then write it to a new file with '.dec' appended to the end of the end of
  # the input file's name (e.g. 'input.txt' -> 'input.txt.dec').
  def self.decode_file(offset,input_filename,output_filename="")
    # if no output file is given, then create one
    if output_filename == ""
      output_filename = input_filename + '.dec'
    end

    File.open(output_filename, 'w') do |output_file|
      File.readlines(input_filename).each do |input_line|
        output_file.write( self.decode( input_line, offset ) )
      end
    end
  end

end

# if file is run directly, grab command line argument and invoke either the
# encode or decode functionality
if __FILE__==$0

  # parse argument options
  options = {}
  options[:encode] = true
  options[:output] = ""
  OptionParser.new do |opts|
    opts.banner = "Usage: caesar_cipher.rb [-e|-d] [-o output] num filename"

    # check for the encode option (defaults on though)
    opts.on("-e", "--encode", "Encode the given file with the given offset value.") do |e|
      options[:encode] = true
    end

    # check for the decode option
    opts.on("-d", "--decode", "Decode the given file with the given offset value.") do |d|
      options[:encode] = false
    end

    # grab the output filename if one is specified
    opts.on("-o FILENAME", "--output FILENAME", "The name of the file to output the encoded/decoded message to.") do |o|
      if o
        p "Output Filename: #{o}"
        options[:output] = Pathname.new(o).realdirpath.to_s
      end
    end

  end.parse!

  if ARGV.length < 2
    abort("Both an offset number and input filename need to be specified. Exiting.")
  end

  options[:offset] = ARGV[0].to_i
  options[:input] = Pathname.new(ARGV[1]).realdirpath.to_s
  p options

  if options[:encode]
    CaesarCipher.encode_file(options[:offset],options[:input],options[:output])
  else
    CaesarCipher.decode_file(options[:offset],options[:input],options[:output])
  end

end
