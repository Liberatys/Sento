# frozen_string_literal: true

require_relative './LoadCall.rb'
class PluginLoader
  def initialize(file_reader)
    @file_reader = file_reader
  end

  def load_plugins
    file_content = @file_reader.get_file_content
    file_lines = file_content.split('\n')
    loads = []
    file_lines.each do |line|
      spliting = line.split('|')
      plugin_class_name = spliting[0].strip
      plugin_path = spliting[1].strip
      plugin_route = spliting[2].strip
      plugin_name = spliting[3].strip
      next if validate_file_path(plugin_path) == false

      load_file(plugin_path)
      plugin = Object.const_get(plugin_class_name).new(plugin_name)
      if plugin.is_a?(Plugin) == false
        raise "Was not able to load #{plugin_name}"
      end

      loads.push(LoadCall.new(plugin, plugin_route))
    end
    loads
  end

  def validate_file_path(path)
    return false unless File.file?(path) == true

    true
  end

  # ! currently very insecure, please write a wrapper for loading the files
  def load_file(file_path)
    path = File.expand_path(file_path)
    load path
  end
end
