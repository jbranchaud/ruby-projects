require 'zip'

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
    Dir["#{directory}/*"].each do |file|
      puts "- #{file}" if File.file?(file)
    end
  end

end

if __FILE__==$0
  ZipFiles.list_files_in_directory("./")
  puts "About to zip the current directory files"
  ZipFiles.zip_current_directory_files
  puts "Done zipping the current directory files"
end
