# frozen_string_literal: true

require_relative './Plugger.rb'
require_relative './Platform.rb'
class Plugin < Plugger
  def install(_args)
    # TODO: write a better message for this case
    raise "The system called the default install method in a plugin, you have either not set the plugin method, or you haven't implemented this method yet | #{name}"
  end

  def supported_platform?(platforms)
    os = convert_platform_to_enum
    platforms.each do |platform|
      return true if platform == os
    end
    false
  end

  def convert_platform_to_enum
    if OS.mac?
      Platform::MACOS
    elsif OS.windows?
      Platform::WINDOWS
    elsif OS.linux
      Platform::UNIX
    end
  end
end
