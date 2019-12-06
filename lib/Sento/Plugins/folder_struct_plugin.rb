require_relative "../Plugin.rb"
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
end
