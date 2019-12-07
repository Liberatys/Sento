require_relative "../Logger"

class FileLogger < Logger
  def initialize(file_path)
    @file_path = File.expand_path(file_path)
  end

  #! only the log function has to be overwritten, then the pipe can be called for this logger
  def log(message)
    File.open(@file_path, "a") do |f|
      f.write(message)
      f.write("\n")
    end
  end
end
