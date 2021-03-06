class Plugger
  attr_accessor :name

  def initialize(name)
    @name = name
    @plugin_map = Hash.new
  end

  #? Add a plugin to a plugger
  def add_plugin(resolver, plugin)
    if (plugin.is_a?(Plugger) == false)
      raise "One can only add pluggers to a plugger"
    end
    resolved_path = resolver.get_current_path_head()
    if resolver.get_current_path().length == 0
      if @plugin_map.key?(resolved_path)
        return false
      else
        @plugin_map.store(resolved_path, plugin)
        return true
      end
    else
      plugger = @plugin_map[resolved_path]
      return plugger.add_plugin(resolver, plugin)
    end
  end

  def resolve_plugin(resolver)
    current_path = resolver.get_current_path_head()
    plugin = @plugin_map[current_path]
    if plugin == nil
      return "No plugin with that name"
    end
    #! if not set, the method will try to call resolve_plugin on an empty plugin/plugger
    return plugin unless resolver.get_current_path().empty? == false
    plugin.resolve_plugin(resolver)
  end

  #! think of the listing as a folder structure, where all chidren plugins are indeted
  def list_plugins(indent)
    listing = []
    @plugin_map.each do |key, value|
      indentation = " " * indent
      listing.push(indentation + value.name)
      listing.concat value.list_plugins(indent + 2)
    end
    return listing
  end
end
