# Sento

## Usage

### Configuration Example

    [plug.brew]
    mysql

    [plug.vscode]
    ms-vscode.go

A plugin can also be called on different methods. The default method for all plugins is **install**.
To use a different method, that you have implement for one of your plugins use:

	[plug.my_plugin | method_name]

Now all calls to the plugin will go over **method_name**.

### Plugin-Loader Example
---
	PacmanPlugin | ../Plugs/pacman_plug.rb | root.pacman | pacman
	ChocoPlugin | ../Plugs/choco_plug.rb | root.choco | choco
	BrewPlugin | ../Plugs/brew_plug.rb | root.brew | brew
	FolderStructurePlugin | ../Plugs/folder_struct_plugin.rb | root.folder_struct | folder_struct
	VSCodePlugin | ../Plugs/vscode_plug.rb | root.vscode | vscode

If no plugger is provided for the plugin import such as "root", the system will pick "root" as the default.
**this means that:**

	PacmanPlugin | ../Plugs/pacman_plug.rb | root.pacman | pacman

**is the same as**

	PacmanPlugin | ../Plugs/pacman_plug.rb | pacman | pacman

### Disabling Calls
---
If you want to keep a plugin call in your config file but not execute it, you can simply disable the call with:

	![plug.my_plugin]


The same works with the plugins in the loader file:

	!PacmanPlugin | ../Plugs/pacman_plug.rb | root.pacman | pacman


### Running the configuration
---

After the installation of Sento in your system and the setup of a file with the accepted format for Sento.

You can execute all plugin calls with the following command:

	Sento -i formated_plugin_calls -o output_file_for_log -p plugin_file

If you want to get a list of all plugins on all pluggers you have inserted into the system, you can do that like:

	Sento -i formated_plugin_calls -p output_file_for_log -p plugin_file -v

the **-v** flag will call a method into the abyss and display a list of all plugins, by iterating over all entries in the abyss.

---

`At the moment ! is not a valid character in a plugin call and thus will not be read`

## What Sento can be used for

The first thing that comes to mind is the setup procedure for a new employee in a company.
Install Sento on his computer and run a fixed list of installations on your own plugins.

Another is the easy setup for home machines by aggregating lists of you applications
and have them installed with the platform-specific package manager. **Use the brew plugin on mac and the pacman plugin on arch.**

## Features

* Everything you can implement in ruby
* A framework for additional plugins
* Expandable system, where others can add their plugins
* **PLUGINS**

## Progress

* Functional plugin framework, that allows drop in plugins for your need
* External plugin loading
* Easy drop in logger methods
* **First working plugins**
  * Brew
  * VSCode
  * Choco
  * Folder Structure

## Versioning
This project is using semantic versioning.
Thus following the pattern of: **major.minor.patch**

**Version**: 0.1.0

## Plugin

### Your own Plugin

Information about plugins as well as information on creating your own plugins can be found [here](Plugins/Plugins.md).
<br />
As a source of inspiration, please see the plugin list below.

### List of Plugins
* [Brew](Plugins/Brew.md)
* [Choco](Plugins/Choco.md)
* [Vscode Extensions](Plugins/VSCode_Extensions.md)
* [Folder Structure](Plugins/Folder_Structure.md)
* [Pacman](Plugins/Pacman.md)

**Your plugin could be here.... just pull that request**

## Examples

* [General](./Examples/Examples.md)
* [Windows]()
* [MacOs]()
* [Complete]()
