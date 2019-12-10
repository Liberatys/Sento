# frozen_string_literal: true
require_relative '../lib/Sento.rb'

# TODO: change name for reader method validate file path

def setup_abyss
  abyss = Abyss.new(Heart.new)
  abyss.add_logger(Logger.new)
  abyss.add_logger(FileLogger.new('testing.txt'))
  # ! add plugger
  plugger = Plugger.new('root')
  abyss.add_plugger(plugger)
  abyss
end

def build_abyss
  abyss = setup_abyss
  abyss.add_plugin('root.folder_structure', FolderStructurePlugin.new('folder_structure'))
  # ! load plugins
  # ! abyss = load_by_file
  abyss
end

def load_by_file(_file_string, abyss)
  file_reader = Reader.new('loader.txt')
  file_reader.validet_file_path
  loader = PluginLoader.new(file_reader)
  loaded_plugins = loader.load_plugins

  loaded_plugins.each do |plug|
    abyss.add_plugin(plug.get_plugin_path, plug.get_plugin)
  end

  abyss
end

def read_command_line_arguments
  input_args = ARGV
  if input_args.empty?
    raise 'Insufficient commandline arguments | No filepath specified'
  end

  file_path, *arguments = ARGV
  raise "Invalid filepath #{file_path}" unless File.file?(file_path)

  File.expand_path(file_path)
end

run_sento(read_command_line_arguments, build_abyss)
