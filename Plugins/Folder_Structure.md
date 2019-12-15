# Folder Structure Plugin

## Functionality

The Folder Structure plugin allows a fast and easy creation of deep folder structures by just passing paths to the plugin.
The plugin will then create the entire given path. 

## Usage

Add the following to your plugin loader
    
    FolderStructurePlugin | path_to_plugin | root.folder_struct | folder_struct


In the .sonol file add

    [root.folder_struct | create]
    ../../test/grep/test

you may replace the path with any path you'd like to be created

## Information

[Code](../lib/Sento/Plugins/folder_struct_plugin.rb)

[Author | Liberatys](https://github.com/Liberatys)

**Publication-Date: 06.12.2019**

**Version: 1.0.0**