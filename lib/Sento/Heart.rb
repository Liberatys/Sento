# frozen_string_literal: true

class Heart
  def initialize
    @plugin_count = 0
    @plugger = {}
    @configurators = []
    @loggers = []
  end

  def add_plugin(path, plugin)
    if @plugin_count <= 0
      raise 'Heart | before adding a plugin, first add a root plugger'
    end

    @plugin_count += 1
    resolver = PathResolver.new(path,true)
    head = resolver.get_current_path_head
    plug = @plugger[head]
    raise "Heart | found no plugger with the name #{head}" if plug.nil?

    plug.add_plugin(resolver, plugin)
  end

  def add_plugger(plugger)
    @plugin_count += 1
    @plugger[plugger.name] = plugger
    true
  end

  def add_configurator(configurator)
    @configurators.push(configurator)
  end

  def get_configurators
    @configurators
  end

  def add_logger(logger)
    return false unless logger.is_a?(Logger)

    @loggers.push(logger)
  end

  def get_loggers
    @loggers
  end

  def get_plugin_count
    @plugin_count
  end

  def log_message(entity, message, type)
    @loggers.each do |logger|
      logger.pipe(entity, message, type)
    end
  end

  def print_plugins
    @plugger.each do |key, value|
      next unless value.nil? == false

      puts "-> Plugins for #{key}:"
      puts value.list_plugins(0)
      puts ''
    end
  end

  def resolve_plugin_path(path)
    if path.empty?
      raise "Heart | resolve_plugin_path must be given a valid path #{path} is invalid"
    end
    return @plugger['root'] if path == '-'

    resolver = PathResolver.new(path)
    resolved_path = resolver.get_current_path_head
    plug = @plugger[resolved_path]
    return "No plugger with the head path #{resolved_path}" if plug.nil?

    plug.resolve_plugin(resolver)
  end
end
