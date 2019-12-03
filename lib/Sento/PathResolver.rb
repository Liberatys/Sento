# frozen_string_literal: true

class PathResolver

    def initialize(path)
      @path = path
      @static_path = path
    end

  def get_current_path_head()
    head_path = ''
    @path.split("").each do |character|
      if character == '.'
        @path = @path[head_path.length + 1 .. @path.length - 1]
        return head_path
      else
        head_path += character
      end
    end
    @path = ""
    head_path
  end
  
  def get_current_path()
    return @path
  end

  def get_original_path
    return static_path
  end

end
