# frozen_string_literal: true

class Plugin < Plugger
  def initializes; end

  def resolve_plugin_path(resolver)  
    @plugin_map[resolver.get_current_path_head()].send("resolve_plugin_path",resolver.get_current_path())
  end
end
