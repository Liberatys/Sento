# Sento

## Idea
The idea of the application is to have a configuration tool, that reads a formated file and executes certain actions on a plugin in the backend.

Example:

    [plug.brew]
    mysql

This format would be parsed als following:

    Call Plugin [brew] and run the install function with the argument (mysql).
    The Plugin [brew] is stored and managed by the plugger [plug].
    This plugin will then go into the backend and execute the needed functions in order to install mysql from brew.

Each plugin may also have other plugins connected to it. Those sup-plugins can then be access over the seperation with dots.

    [plug.vscode.extensions]

Will call the functions from the plugin extensions in the plugin vscode, where vscode is managed by the plugger [plug].

## What Sento can be used for

The first thing that comes to mind the setup procedure for a new employee in the company.
Install Sento on his computer and run a precompiled list of installations on your own plugins.

In the beginning, the tool was only ment for MacOs. But now some hours into the project, I have given up that.
Sento can be used on any platform, that supports ruby and has people writing plugins for.

## Features

* Everything you can implement in ruby
* A framework for additional plugins
* Expandable system, where others can add their plugins
* **PLUGINS**

## Progress

* Functional plugin framework, that allows drop in plugins for your need
* **First working plugins**
  * Brew
  * VSCode
  * Choco
  * Folder Structure

## Versioning
This project is using semantic versioning.
Thus following the pattern of: **major.minor.patch**

**Version**: 0.1.0



## List of Plugins
* [Brew | Liberatys](Plugins/Brew.md)
* [Choco | Liberatys](Plugins/Choco.md)
* [Vscode Extensions | Liberatys](Plugins/VSCode_Extensions.md)
* [Folder Structure | Liberatys](Plugins/Folder_Structure.md)


**Your plugin could be here.... just pull that request**


## Examples
[General](./Examples/Examples.md)
[Windows]()
[MacOs]()
[Complete]()
