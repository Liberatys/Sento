require_relative "../Plugin.rb"
require "os"

class ChocoPlug < Plugin
  @@base_command = "choco"

  def install(arguments)
    if validate == false
      return "The cocho plugin is only available on Windows"
    end
    if system("choco feature disable -n allowGlobalConfirmation") == nil
      return "choco is not a known command"
    end
    progress_list = []
    arguments.each do |package|
      progress_list.push(install_package(package))
    end
    system("choco feature enable -n allowGlobalConfirmation")
    return progress_list
  end

  def install_package(package)
    #TODO: implement argument escape for this system call
    result = system("#{@@base_command} install #{package} --yes")
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
    return false unless OS.windows?
  end
end
