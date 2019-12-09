# frozen_string_literal: true

require_relative './Sento/Heart'
require_relative './Sento/Plugin'
require_relative './Sento/Plugger'
require_relative './Sento/Configurator'
require_relative './Sento/Logger'
require_relative './Sento/Abyss'
require_relative './Sento/PathResolver'
require_relative './Sento/File/Sento_File'
require_relative './Sento/LogType'
require_relative './Sento/Plugins/plugins'
require_relative './Sento/Loggers/loggers'
require 'date'
require 'rainbow'

def run_sento(file_path, abyss)
  content = get_file_content(file_path)
  execute_plugins(content, abyss)
end

def collect_plugin_calls(file_content)
  parser = FileConverter.new(file_content)
  sonol_object = parser.parse_to_sonol
  unless sonol_object.is_a?(Sonol)
    raise 'Invalid file content | Error whilst parsing file'
  end

  sonol_object.build_plugin_calls
  sonol_object.get_plugin_calls
end

def execute_plugins(_file_content, abyss)
  plugin_calls = collect_plugin_calls(_file_content)
  plugin_calls.each do |plugin_call|
    plugin = abyss.resolve_plugin_path(plugin_call.plugin_name)
    raise plugin unless plugin.is_a?(Plugger)

    progress_message = plugin.public_send(plugin_call.get_plugin_method, plugin_call.get_arguments)
    if progress_message == 'Unknown command'
      abyss.log_message(plugin.name, 'Unknown command', LogType::WARNING)
      next
    end
    abyss.log_message(plugin.name, progress_message, LogType::INFORMATION)
  end
end

def get_file_content(file_path)
  file_reader = Reader.new(file_path)
  unless file_reader.validet_file_path
    raise "#{file_path} is not a valid file path"
  end

  content = file_reader.get_file_content
  content
end
