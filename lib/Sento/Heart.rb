class Heart
    def initialize
        @plugger = {}
        @configurators = []
        @loggers = []
    end

    def add_plugin(path, plugin)
        resolver = PathResolver.new(path)
        plug = @plugger[resolver.get_current_path_head()]
        plug.add_plugin(resolver,plugin)
    end

    def add_plugger(plugger)
        @plugger[plugger.name] = plugger
    end

    def add_configurator(configurator)
        @configurators.push(configurator)
    end

    def get_configurators
        return @configurators
    end

    def add_logger(logger)
        @loggers.push(logger)
    end

    def get_loggers
        return @loggers
    end

    def resolve_plugin_path(path)
        resolver = PathResolver.new(path)
        plug =  @plugger[resolver.get_current_path_head()]
        if plug == nil
            return "No plugin with that name"
        end
        plug.resolve_plugin(resolver)
    end
    
end