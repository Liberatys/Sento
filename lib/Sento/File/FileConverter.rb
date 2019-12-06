# frozen_string_literal: true

class FileConverter
  def initialize(file_content)
    @file_content = file_content
    @plugin_map = PluginMap.new
    @sonol_object = nil
  end

  # ! sonol is the self-developed file format for this project
  # ! at first toml was looked at, but the configuration doesn't allow easy list
  def parse_to_sonol
    current_iteration_string = ""
    @file_content.split("").each_with_index do |character, index|
      if character == "["
        # first line before first bracket contains only spaces, therefore its not
        # a valid input for content.
        # If the string only consists of spaces, don't add it to the plugin_map
        if current_iteration_string.strip.empty? == false
          @plugin_map.add_brackets_value(current_iteration_string)
        end
        @plugin_map.add_start(index)
        current_iteration_string = ""
      elsif character == "]"
        @plugin_map.add_end(index)
        raise "Empty plugin name" unless current_iteration_string.empty? == false

        @plugin_map.add_plugin_name(current_iteration_string)
        current_iteration_string = ""
      else
        current_iteration_string += character
      end
    end
    @plugin_map.add_brackets_value(current_iteration_string)
    # ! wrap plugin_map with a sonol wrapper, that will function as a proxy for the parsed file content
    return false if @plugin_map.is_valid_brackets_count == false

    @sonol_object = Sonol.new(@plugin_map)
    @sonol_object
  end

  def get_last_sonol_object
    @sonol_object
  end
end
