class FileConverter

    def initialize(file_content)
        @file_content = file_content
        @plugin_map = PluginMap.new
        @sonol_object = nil
    end

    #! sonol is the self-developed file format for this project
    #! at first toml was looked at, but the configuration doesn't allow easy list
    #TODO improve on the parser
    def parse_to_sonol()
        current_iteration_string = ""
        record_values = false
        @file_content.split("").each_with_index  do |character, index|
            if character == '['
                record_values = false
                @plugin_map.add_brackets_value(current_iteration_string)
                @plugin_map.add_start(index)
                current_iteration_string = ""
            elsif character == ']'
                @plugin_map.add_end(index)
                record_values = true
            elsif record_values == true
                current_iteration_string += character
            end
        end
        #! wrap plugin_map with a sonol wrapper, that will function as a proxy for the parsed file content
        if @plugin_map.is_valid_brackets_count == false
            return false
        end
        @sonol_object = Sonol.new(@plugin_map)
        return @sonol_object
    end

    def get_last_sonol_object
        return @sonol_object
    end

    def extract_all_plugin_calls(toml_object)
        plugins = []
        business.each do |key, value|
            plugins.push(key)
        end
        return plugins
    end

end