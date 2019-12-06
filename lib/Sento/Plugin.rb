# frozen_string_literal: true
require_relative "./Plugger.rb"

class Plugin < Plugger
  def initializes; end

  def install(args)
    raise "The system called the default install method in a plugin, you have either not set the plugin method, or you haven't implemented this method yet"
  end
end
