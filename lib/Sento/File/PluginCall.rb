class PluginCall
    def initialize(plugin_name)
        @plugin_name = plugin_name
        @arguments = []
    end

    def add_argument(argument)
        @arguments.push(argument)
    end

    def get_arguments
        return @arguments
    end

    def get_name
        return @plugin_name
    end
end