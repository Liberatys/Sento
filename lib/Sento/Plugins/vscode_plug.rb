require_relative "../Plugin.rb"

class VSCodePlugin < Plugin
  @@base_command = "code"
  #! code --list-extensions
  #! code --install-extension ms-vscode.cpptools
  #! code --uninstall-extension ms-vscode.csharp
  #! update == code --install-extension --force

  def install(arguments)
    progress_list = []
    arguments.each do |package|
      progress_list.push(act_on_package(package))
    end
    return progress_list
  end

  def act_on_package(package, update_flag = false)
    command_string = "#{@@base_command} --install-extension #{package} "
    if update_flag
      command_string += "--force"
    end
    result = system(command_string)
    if result == true
      return "Successfully installed #{package}"
    elsif result == false
      return "Instllation of #{package} failed"
    end
    return "Unknown command"
  end

  def update(arguments)
    progress_list = []
    arguments.each do |package|
      progress_list.push(act_on_package(package, true))
    end
    return progress_list
  end
end
