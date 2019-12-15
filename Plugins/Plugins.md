# Plugins


A plugin is the smallest entity in the sento infrastructure, that allows you to write code for the system that then can be called from a
configuration file.

## Loading

Sento is using a minimal version of a plugin loader. You can load plugins by creating a file just like

	PacmanPlugin | ../Plugs/pacman_plug.rb | root.pacman | pacman
	ChocoPlugin | ../Plugs/choco_plug.rb | root.choco | choco
	BrewPlugin | ../Plugs/brew_plug.rb | root.brew | brew
	FolderStructurePlugin | ../Plugs/folder_struct_plugin.rb | root.folder_struct | folder_struct
	VSCodePlugin | ../Plugs/vscode_plug.rb | root.vscode | vscode

this file format can than be passed to the application with the -p flag


## Pathing

In the Sento project, all plugins are in the Plugs folder. If you want to use Sento outside of the project folder, you will have to adjust
../Plugs/.. to the correct file path


## Writing your own plugins

You can find a template for plugins in the Examples/Plugin/ folder.
The only thing that has to be adjusted is the path to **lib/Sento.rb**,
because it contains the Plugin definition that is used for using abstract plugins in the system.
