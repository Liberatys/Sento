# Sento

## Idea
The idea of the application is to have a configuration tool, that ready a formated file and executes certain actions on a plugin in the backend. 

Example:

    [plug.brew]
    mysql

This format would be parsed als following:

    Call Plugin [brew] and run the install fuction with the argument (mysql).
    The Plugin [brew] is stored and managed by the plugger [plug].
    This plugin will then go into the backend and execute the needed functions in order to install mysql from brew.

Each plugin may also have other plugins connected to it. Those sup-plugins can then be access over the seperation with dots.

    [plug.vscode.extensions]

Will call the functions from the plugin extensions in the plugin vscode, where vscode is managed by the plugger [plug].

## What can Sento be used for ? 

The first thing that comes into mind the setup procedure for a new employee in the company. 
Install Sento on his computer and run a precompiled list of installations on your own plugins.

In the beginning, the tool was only ment for MacOs. But now some hours into the project, I have given up that.
Sento can be used on any platform, that supports ruby and has people writing plugins for.

## Features

 * Install from brew
 * Configure shell and environement
 * Install programming languages
 * Install and setup databases
 * Install extensions for visual studio code
 * Easy to self implement plugin system in order to adjust the application to your needs.

## Progress

    * Functional plugin framework, that allows drop in plugins for your need

## Versioning
This project is using semantic versioning. 
Thus following the pattern of: **major.minor.patch**

**Version**: 0.1.0




