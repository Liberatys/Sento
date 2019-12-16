# frozen_string_literal: true

class FileConverter
  def initialize(file_content)
    @file_content = file_content
    @plugin_map = PluginMap.new
    @sonol_object = nil
  end
  #TODO rewrite file parsing
  # ! sonol is the self-developed file format for this project
  # ! at first toml was looked at, but the configuration doesn't allow easy list
  def parse_to_sonol
    current_iteration_string = ''
    skip_call = false
    @file_content.split('').each_with_index do |character, index|
      if character == '['
        # first line before first bracket contains only spaces, therefore its not
        # a valid input for content.
        # If the string only consists of spaces, don't add it to the plugin_map
        if skip_call == false
          if current_iteration_string.strip.empty? == false
            @plugin_map.add_brackets_value(current_iteration_string)
          end
        else
          skip_call = false
        end
        #! check if index is not 0
        if index > 0
        #! check if plugin_call should be ignored
          if @file_content[index - 1] == '!'
            skip_call = true
          end
        end
        if skip_call == false
          @plugin_map.add_start(index)
        end
        current_iteration_string = ''
      elsif character == ']'
        #! entire plugin call and name are removed from the call map
        if skip_call == false
          @plugin_map.add_end(index)
          unless current_iteration_string.empty? == false
            raise 'Empty plugin name'
          end
          @plugin_map.add_plugin_name(current_iteration_string)
        end
        current_iteration_string = ''
      else
        if character != '!'
          current_iteration_string += character
        else
          last_character = ''
          if index > 0
            last_character = @file_content[index]
          end
          if last_character == '['
            current_iteration_string += character
          end
        end
      end
    end
    @plugin_map.add_brackets_value(current_iteration_string)
    return false if @plugin_map.is_valid_brackets_count == false
    # ! wrap plugin_map with a sonol wrapper, that will function as a proxy for the parsed file content
    @sonol_object = Sonol.new(@plugin_map)
    @sonol_object
  end

  def get_last_sonol_object
    @sonol_object
  end
end
