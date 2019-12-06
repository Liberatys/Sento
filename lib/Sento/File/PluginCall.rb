class PluginCall
    def initialize(plugin_name)
        @plugin_name = plugin_name
        @arguments = []
        @plugin_method = "install"
    end

    def add_argument(argument)
        @arguments.push(argument)
    end

    def get_plugin_method
        @plugin_method
    end

    def get_arguments
        return @arguments
    end
    
    def set_plugin_run_method(method_name)
        @plugin_method = method_name
    end

    def set_plugin_content(content)
        content_lines = content.split("\n")
            content_lines.each do |line|
                line.strip!
                if line.empty? == false
                    self.add_argument(line)
                end
            end
    end
    
    def get_name
        return @plugin_name
    end
end