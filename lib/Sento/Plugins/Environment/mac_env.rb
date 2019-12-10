# frozen_string_literal: true

require_relative './env.rb'

class MacENV < Environ
  def initialize(_path)
    @base_config = '~/.bash_profile'
    @base_config = _path if _path.empty? == false
  end

  def load_file; end
end
