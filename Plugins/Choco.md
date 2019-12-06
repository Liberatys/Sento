# Choco Plugin


## Functionality

The choco plugin is able to install, update as well as uninstall packages that are available from the choco repository list.

## Usage

Add the following to the Sento bin file.
    
    abyss.add_plugin("root.choco", ChocoPlugin.new("choco"))


In the .sonol file add

    [root.choco]
    mysql
    vim

replace mysql, nvim and vim with the packages of your choice

## Information

[Code](../lib/Sento/Plugins/choco_plug.rb)

[Author | Liberatys](https://github.com/Liberatys)

**Publication-Date: 06.12.2019**

**Version: 1.0.0**