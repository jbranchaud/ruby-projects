require 'pathname' # deals with pathnames in a consistent way
require 'optparse' # parsing the command line arguments
require 'zip' # utility for zipping files

module ZipFiles

  # zip the files in the current directory using the rubyzip gem
  def self.zip_current_directory_files
    folder = "./"
    input_filenames = ['README.md']
    zipfile_name = "./ZipFiles.zip"

    Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
      input_filenames.each do |filename|
        zipfile.add(filename, folder + filename)
      end
    end
  end

  # list each file (no directories) in the given directory
  def self.list_files_in_directory(directory=".")
    directory_pathname = Pathname.new(directory)
    Dir["#{directory_pathname.realpath}/*"].find_all { |file| File.file?(file) }
  end

  # list each directory (no files) in the given directory
  def self.list_directories_in_directory(directory=".")
    directory_pathname = Pathname.new(directory)
    Dir["#{directory_pathname.realpath}/*"].find_all { |directory| File.directory?(directory) }
  end

  # list everything in a directory including hidden files/directories
  def self.list_everything_in_directory(directory=".")
    directory_pathname = Pathname.new(directory)
    Dir.glob("#{directory_pathname}/*", File::FNM_DOTMATCH).find_all{ |file| file } - %w[./. ./..]
  end

end

if __FILE__==$0

  # parse argument options
  options = {}
  OptionParser.new do |opts|
    opts.banner = "Usage: zip_files.rb [options]"

    opts.on("-o [ZIP_PATH]", "--output [ZIP_PATH]", "Path of the output zip file, this is optional, so if not specified, a zip file with the name 'zipped.zip' will be saved to the current directory.") do |o|
      options[:output] = o
    end

  end.parse!

  if ARGV.length < 1
    abort("A list of files and/or directories must be specified for zipping. Exiting.")
  end

  options[:file_list] = ARGV
  p options

  #p "Files: #{ZipFiles.list_files_in_directory("./")}"
  #p "Directories: #{ZipFiles.list_directories_in_directory("./")}"
  #p ZipFiles.list_everything_in_directory
  #puts "About to zip the current directory files"
  #ZipFiles.zip_current_directory_files
  #puts "Done zipping the current directory files"
end
