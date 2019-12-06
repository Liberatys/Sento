class Sonol

    def initialize(plugin_map)
        @plugin_map = plugin_map
        @plugin_calls = []
    end

    def get_plugin_paths
        return @plugin_map.get_plugin_names
    end

    def get_plugin_calls
        @plugin_calls
    end

    def build_plugin_calls
        if @plugin_map.is_valid_brackets_count == false
            return false
        end
        content = @plugin_map.get_brackets_content
        plugin_names = @plugin_map.get_plugin_names
        #TODO refactor this part of the code
        for x in 0..plugin_names.length - 1
            plugin_call = nil
            plug_name = plugin_names[x]
            split_plugin_naming = plug_name.split("|")
            if split_plugin_naming.length > 1
                plugin_call = PluginCall.new(split_plugin_naming[0].strip!)
                plugin_call.set_plugin_run_method(split_plugin_naming[1].strip!)
            else
                plugin_call = PluginCall.new(plug_name)
            end
            plugin_call.set_plugin_content(content[x])
            @plugin_calls.push(plugin_call)
        end
    end

end