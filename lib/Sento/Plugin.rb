# frozen_string_literal: true
require_relative "./Plugger.rb"

class Plugin < Plugger
  def install(_args)
    #TODO write a better message for this case
    raise "The system called the default install method in a plugin, you have either not set the plugin method, or you haven't implemented this method yet | #{self.name}"
  end
end
