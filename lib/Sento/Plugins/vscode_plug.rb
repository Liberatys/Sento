require_relative "../Plugin.rb"

class VSCodePlugin < Plugin

  #! code --list-extensions
  #! code --install-extension ms-vscode.cpptools
  #! code --uninstall-extension ms-vscode.csharp
  #! update == code --install-extension --force

  def install(arguments)
  end
end
