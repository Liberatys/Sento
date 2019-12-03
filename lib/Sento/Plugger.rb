class Plugger
    attr_accessor :name

    def initialize(name)
        @name = name
        @plugin_map = Hash.new
    end

    #? Add a plugin to a plugger 
    def add_plugin(resolver,plugin)
        if (plugin.is_a?(Plugger) == false)
            raise "One can only add pluggers to a plugger"
        end
        resolved_path = resolver.get_current_path_head()
        if resolver.get_current_path().length == 0
            if @plugin_map.key?(resolved_path)
                return false
            else                
                @plugin_map.store(resolved_path,plugin)
                return true
            end
        else
           plugger = @plugin_map[resolved_path] 
           return plugger.add_plugin(resolver,plugin)
        end
    end

    def resolve_plugin(resolver)
        current_path = resolver.get_current_path_head()
        plugin = @plugin_map[current_path]
        if plugin == nil
            return "No plugin with that name"
        end
        #TODO refactor this check guard
        #! if not set, the method will try to call resolve_plugin on an empty plugin/plugger
        if resolver.get_current_path().length == 0
            return plugin
        else
            plugin.resolve_plugin(resolver)
        end
    end

    def list_plugins(indent)
        
    end
end