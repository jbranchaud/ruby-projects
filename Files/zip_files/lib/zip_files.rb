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

end

if __FILE__==$0
  p ZipFiles.list_files_in_directory("./")
  puts "About to zip the current directory files"
  ZipFiles.zip_current_directory_files
  puts "Done zipping the current directory files"
end
