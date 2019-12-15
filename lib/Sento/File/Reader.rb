# frozen_string_literal: true

class Reader
  def initialize(file_path)
    @file_path = file_path
    @abs_path = ''
  end

  def validate_file_path
    @abs_path = File.expand_path(@file_path)
    is_valid = File.file?(@abs_path)
    return true if is_valid

    false
  end

  def get_file_content
    data = File.read(@abs_path)
    data
  end
end
