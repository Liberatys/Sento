class Heart
    def initialize
        @plugins = []
        @configurators = []
        @loggers = []
    end

    def add_plugin(plugin)
        @plugins.push(plugin)
    end

    def get_plugins
        return @plugins
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
    
end