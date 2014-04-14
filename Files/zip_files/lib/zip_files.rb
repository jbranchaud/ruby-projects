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

  # the main zip method: given the parsed command line options, find and zip
  # the files
  def self.zip(options)
    # default to zipping the current directory if no file arguments are
    # given
    if options[:file_list].length == 0
      self._zip_current_directory(options[:output],false,false)
    else
      # otherwise, we attempt to zip the given files and directories
      self._zip_file_list(options[:output],false,false,options[:file_list])
    end
  end

  # zip up the current directory. If the recursive argument is true, zip
  # recursively. If the include_hidden argument is true, zip the hidden
  # files as well.
  def self._zip_current_directory(output,recursive,include_hidden)
    current_directory = "./"
    input_filenames = []
    if include_hidden
      puts "including hidden files in the zip isn't supported yet."
    end
    if recursive
      puts "zipping recursively through the directories isn't supported yet."
    end
    input_filenames += self.list_files_in_directory(current_directory)
    Zip::File.open(output, Zip::File::CREATE) do |zipfile|
      input_filenames.each do |filename|
        file_pathname = Pathname.new(filename)
        zipfile.add(file_pathname.basename.to_s, file_pathname.realpath.to_s)
      end
    end
  end

  # zip up the given list of files. If the recursive argument is true, zip
  # recursively. If the include_hidden argument is true, zip the hidden
  # files as well. Ouput is the name of the resulting zip file.
  def self._zip_file_list(output,recursive,include_hidden,file_list)
    if include_hidden
      puts "including hidden files in the zip isn't supported yet."
    end
    if recursive
      puts "zipping recursively through the directories isn't supported yet."
    end
    Zip::File.open(output, Zip::File::CREATE) do |zipfile|
      file_list.each do |filename|
        file_pathname = Pathname.new(filename)
        zipfile.add(file_pathname.basename.to_s, file_pathname.realpath.to_s)
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

  # given an array of file and directory names as strings, this method will
  # convert them to Pathname objects and return the resulting array.
  def self.paths_to_pathnames(file_paths)
    file_paths.map { |file_path| Pathname.new(file_path) }
  end

end

if __FILE__==$0

  # parse argument options
  options = {}
  options[:output] = "zipped.zip"
  OptionParser.new do |opts|
    opts.banner = "Usage: zip_files.rb [options]"

    opts.on("-o [ZIP_PATH]", "--output [ZIP_PATH]", "Path of the output zip file, this is optional, so if not specified, a zip file with the name 'zipped.zip' will be saved to the current directory.") do |o|
      options[:output] = o
    end

  end.parse!

  #if ARGV.length < 1
  #  abort("A list of files and/or directories must be specified for zipping. Exiting.")
  #end
  
  options[:output] = Pathname.new(options[:output]).realdirpath.to_s
  options[:file_list] = ARGV
  p options

  ZipFiles.zip(options)

  #p "Files: #{ZipFiles.list_files_in_directory("./")}"
  #p "Directories: #{ZipFiles.list_directories_in_directory("./")}"
  #p ZipFiles.list_everything_in_directory
  #puts "About to zip the current directory files"
  #ZipFiles.zip_current_directory_files
  #puts "Done zipping the current directory files"
end
