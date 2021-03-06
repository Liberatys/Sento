# frozen_string_literal: true

# ! Abyss handles the wrapping arround the heart.
# ! this ensured, that the developer as well as "User" don't have to interact with the get/set interface of the heart.
# ! They only get the interface of the abyss, that is used to perform the main operations.
class Abyss
  def initialize(heart)
    if heart.is_a?(Heart)
      @heart = heart
    else
      raise 'Abyss only takes Heart as a parameter in creation'
    end
  end

  def add_logger(logger)
    @heart.add_logger(logger)
  end

  def add_configurator(configurator)
    @heart.add_configurator(configurator)
  end

  def add_plugin(path, plugin)
    @heart.add_plugin(path, plugin)
  end

  def add_plugger(plugger)
    @heart.add_plugger(plugger)
  end

  def resolve_plugin_path(path)
    @heart.resolve_plugin_path(path)
  end

  def log_message(entity, message, type)
    @heart.log_message(entity, message, type)
  end

  def print_plugins
    @heart.print_plugins
  end
end
