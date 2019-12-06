# Brew Plugin

## Functionality

The brew plugin is able to install, update as well as uninstall packages that are available from the brew repository list.

## Usage

Add the following to the Sento bin file.
    
    abyss.add_plugin("root.brew", BrewPlugin.new("brew"))


In the .sonol file add

    [root.brew]
    mysql
    nvim
    vim

replace mysql, nvim and vim with the packages of your choice

## Information

[Code](../lib/Sento/Plugins/brew_plug.rb)

[Author | Liberatys](https://github.com/Liberatys)

**Publication-Date: 06.12.2019**

**Version: 1.0.0**