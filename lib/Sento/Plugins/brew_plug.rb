require_relative "../Plugin.rb"
require "os"

class BrewPlugin < Plugin
  @@base_command = "brew"

  def install(arguments)
    if validate == false
      return "The brew plugin is only available on MacOs | OsX"
    end
    progress_list = []
    arguments.each do |package|
      progress_list.push(install_plugin(package))
    end
    return progress_list
  end

  def install_plugin(package)
    result = system("#{@@base_command} install ", package, exception: true)
    if result == true
      return "Successfully installed #{package}"
    elsif result == false
      return "Instllation of #{package} failed"
    end
    return "Unknown command"
  end

  def update(arguments)
  end

  #! brew is a tool for mac and therefore should not work on any other platform
  def validate
    return false unless OS.mac?
  end
end
