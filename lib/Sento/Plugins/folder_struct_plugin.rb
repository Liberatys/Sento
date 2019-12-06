require_relative "../Plugin.rb"
require "fileutils"
#TODO expand on folder structure plugin
class FolderStructurePlugin < Plugin
  def create(arguments)
    arguments.each do |path|
      create_path(path)
    end
  end

  def create_path(path)
    FileUtils.mkpath(path)
  end
end
