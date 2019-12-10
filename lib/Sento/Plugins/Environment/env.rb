# frozen_string_literal: true

class Environ
  def load_file_content(path)
    path = File.expand_path(path)
    reader = Readear.new(path)
    File.open(path, 'w') {} if reader.validet_file_path == false
    reader.get_file_content
  end

  def write_file(content); end
end
