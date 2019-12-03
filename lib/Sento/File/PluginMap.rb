class PluginMap

    def initialize
        @start = []
        @end = []
        @brackets_content = []
        @plugin_names = ""
    end
    
    def add_start(index)
        @start.push(index)
    end

    def add_end(index)
        @end.push(index)
    end

    def add_plugin_name(name)
        @plugin_names.push(name)
    end

    def add_brackets_value(content)
        @brackets_content.push(content)
    end

    def is_valid_brackets_count
        if @start.length == 0 or @end.length == 0
            return false
        end
        if @start.length != @end.length
            return false
        end
        return true
    end
end