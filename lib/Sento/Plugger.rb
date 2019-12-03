class Plugger
    attr_accessor :name
    @plugin_map = {}

    #? Add a plugin to a plugger 
    def add_plugin(plugin)
        if @plugin_map.key?(plugin.name)
            return false
        else
            @plugin_map[plugin.name] = plugin
            return true
        end
    end

    def resolve_plugin(path)
                
    end
end