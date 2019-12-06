class Reader
  def initialize(file_path)
    @file_path = file_path
    @abs_path = ""
  end

  def validet_file_path
    @abs_path = File.expand_path(@file_path)
    is_valid = File.file?(@abs_path)
    if is_valid
      return true
    else
      #! if the file can't be found, the application should throw an error and not just a false return
      return false
    end
  end

  def get_file_content
    data = File.read(@abs_path)
    return data
  end
end
