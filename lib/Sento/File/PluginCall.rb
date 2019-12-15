  # frozen_string_literal: true

class PluginCall
  attr_reader :plugin_name

  @@default_plugin_method = 'install'

  def initialize(plugin_name)
    @plugin_name = plugin_name
    @arguments = []
    @plugin_method = @@default_plugin_method
  end

  def add_argument(argument)
    @arguments.push(argument)
  end

  def get_plugin_method
    @plugin_method
  end

  def get_arguments
    @arguments
  end

  def set_plugin_run_method(method_name)
    @plugin_method = method_name
  end

  def set_plugin_content(content)
    content_lines = content.lines
    content_lines.each do |line|
      line.strip!
      add_argument(line) if line.empty? == false
    end
  end

  def get_name
    @plugin_name
  end
end
