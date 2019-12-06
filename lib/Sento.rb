require_relative "./Sento/Heart.rb"
require_relative "./Sento/Plugin.rb"
require_relative "./Sento/Plugger.rb"
require_relative "./Sento/Configurator.rb"
require_relative "./Sento/Logger.rb"
require_relative "./Sento/Abyss.rb"
require_relative "./Sento/PathResolver.rb"
require_relative "./Sento/File/Sento_File"
require_relative "./Sento/LogType"
require_relative "./Sento/Plugins/plugins.rb"

def run_sento(file_path, abyss)
  content = get_file_content(file_path)
  execute_plugins(content, abyss)
end

def execute_plugins(file_content, abyss)
  parser = FileConverter.new(file_content)
  sonol_object = parser.parse_to_sonol
  raise "Invalid file content | Error whilst parsing file" unless sonol_object.is_a?(Sonol)
  sonol_object.build_plugin_calls
  sonol_object.get_plugin_calls.each do |plugin_call|
    plugin = abyss.resolve_plugin_path(plugin_call.plugin_name)
    raise plugin unless plugin.is_a?(Plugger)

    progress_message = plugin.public_send(plugin_call.get_plugin_method, plugin_call.get_arguments)
    if progress_message == "Unknown command"
      next
    end
  end
end

def get_file_content(file_path)
  file_reader = Reader.new(file_path)
  raise "#{file_path} is not a valid file path" unless file_reader.validet_file_path

  content = file_reader.get_file_content
  content
end
