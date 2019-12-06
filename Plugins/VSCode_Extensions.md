# VSCode-Extension Plugin

## Functionality

The VSCode-Extensions plugin is able to install, update as well as uninstall packages that are available from the vscode extension list.

## Usage

Add the following to the Sento bin file.
    
    abyss.add_plugin("root.vscode", VSCodePlugin.new("vscode"))

In the .sonol file add

    [root.vscode]
    mkloubert.vscode-kanban
    aaron-bond.better-comments

you may install all extensions that are available from the vscode extension list.

## Information

[Code](../lib/Sento/Plugins/brew_plug.rb)

[Author | Liberatys](https://github.com/Liberatys)

**Publication-Date: 06.12.2019**

**Version: 1.0.0**