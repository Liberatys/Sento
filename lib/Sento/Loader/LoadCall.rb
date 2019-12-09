# frozen_string_literal: true

class LoadCall
  def initialize(plugin, plugin_path)
    @plugin = plugin
    @plugin_path = plugin_path
  end

  def get_plugin
    @plugin
  end

  def get_plugin_path
    @plugin_path
  end
end
