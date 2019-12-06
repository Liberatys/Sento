require_relative './Sento/Heart.rb'
require_relative './Sento/Plugin.rb'
require_relative './Sento/Plugger.rb'
require_relative './Sento/Configurator.rb'
require_relative './Sento/Logger.rb'
require_relative './Sento/Abyss.rb'
require_relative './Sento/PathResolver.rb'
require_relative "./Sento/File/Sento_File"
require_relative "./Sento/LogType"

def run_sento(file_path)
    file_reader = Reader.new(file_path)
    if file_reader.validet_file_path()
        content = file_reader.get_file_content
        parser = FileConverter.new(content)
        sonol_object = parser.parse_to_sonol()
        abyss = build_abyss
        sonol_object.build_plugin_calls()
        sonol_object.get_plugin_calls.each do |plugin_call|
            plugin = abyss.resolve_plugin_path(plugin_call.plugin_name)
            if plugin.is_a?(Plugger)
                plugin.public_send(plugin_call.get_plugin_method(),plugin_call.get_arguments())
            else
                raise plugin
            end
        end
    else
        raise "Not a valid file path"
        return
    end
end


def build_abyss()
    abyss = Abyss.new(Heart.new())
    plugger = Plugger.new("root")
    abyss.add_plugger(plugger)
    abyss.add_plugin("root.root",Plugin.new("root"))
    return abyss
end

