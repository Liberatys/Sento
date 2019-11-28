
#! Abyss handles the wrapping arround the heart. 
#! this ensured, that the developer as well as "User" don't have to interact with the get/set interface of the heart.
#! They only get the interface of the abyss, that is used to perform the main operations.
class Abyss
    def initialize(heart)
        @heart = heart
    end

    def add_logger(logger)
        @heart.add_logger(logger)
    end

    def add_configurator(configurator)
        @heart.add_configurator(configurator)
    end

    def add_plugin(plugin)
        @heart.add_plugin(plugin)
    end
end