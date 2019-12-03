class Plugger
    attr_accessor :name
    @plugin_map = {}

    #? Add a plugin to a plugger 
    def add_plugin(resolver,plugin)
        resolved_path = resolver.get_current_path_head()
        if resolver.get_current_path() == ""
            if @plugin_map.key?(resolved_path)
                return false
            else
                @plugin_map[resolved_path] = plugin
                return true
            end
        else
           plugger = @plugin_map[resolved_path] 
           plugger.add_plugin(resolver,plugin)
        end
    end

    def resolve_plugin(resolver)
        plugin = @plugin_map[resolver.get_current_path_head()]
        if plugin == nil
            return "No plugin with that name"
        end
        plugin.resolve_plugin(resolver)
    end

    def list_plugins(indent)
        
    end
end