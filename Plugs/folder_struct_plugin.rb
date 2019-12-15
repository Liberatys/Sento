require_relative File.expand_path('../lib/Sento.rb')
require "fileutils"
#TODO expand on folder structure plugin
class FolderStructurePlugin < Plugin
  def create(arguments)
    progress_list = []
    arguments.each do |path|
      progress_list.push(create_path(path))
    end
    progress_list
  end

  def create_path(path)
    FileUtils.mkpath(path)
    "Created path #{path}"
  end

  def create_file(arguments)
    progress_list = []
    arguments.each do |argument|
      base_dir = File.dirname(argument)
      create_path(base_dir)
      FileUtils.touch(argument)
      progress_list.push("Create file #{argument}")
    end
    progress_list
  end
end
