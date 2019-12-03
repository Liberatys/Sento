class Sonol
    def initialize(plugin_map)
        @plugin_map = plugin_map
    end

    def get_plugin_paths
        return @plugin_map.get_plugin_names
    end
end