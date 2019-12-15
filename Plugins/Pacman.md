# PacmanPlugin

## Functionality

The pacman plugin is a wrapper for the pacman package manager that can be used in sento to install, update and delete packages.

## Usage

Add the following to your plugin loader

    PacmanPlugin | path_to_plugin | root.pacman | pacman


In the .sonol file add

    [root.pacman]
    mysql
    nvim
    vim

replace mysql, nvim and vim with the packages of your choice

## Information

[Code](../lib/Sento/Plugins/pacman_plug.rb)

[Author | Liberatys](https://github.com/Liberatys)

**Publication-Date: 14.12.2019**

**Version: 1.0.0**
