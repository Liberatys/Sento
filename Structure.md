# Structure

Because functionality is limited in this first version this file not give you a lot of info. Will add more info here in a later version.



## Hearth

The middle piece of the application. All plugs plugin into this central hub for the application.
Aranages the operations that are needed in order to execute the application.
Also handles the different plugins and logger.

## Plugger

The plugger is the root plug that attaches to the heart. It functions as a hub for the other plugins.

## Logger

A logger is an entity that does some job of logging information to the terminal, a file or any other medium.
Default is a command line logger as well as a file logger.
If you want your own logger, just write it and plug it into the abyss/heart.

## Plugin

The main piece of code that lets the application do what it has to do. A slim implementation of a single functionality for a single application or part of that application.
Can be plugged into the heart or a plugger directly. Also functions as a plugger and can therefore be used to attach more plugins to the main application.
Has multiple functions for utile usage.

## Abyss

Is a slim interface for abstracted operations on the heart.

## File

Collection of classes and modules that handle reading, validating, parsing and formating files for the application.

### FileConverter

Converts a normal .txt or .sonol file into a format that can be used to easily create a system of plugins from it

### PluginCall

Holds information about the plugin-name, plugin-body and its position.

### PluginMap

Structure to hold PluginCalls and map them to the plugin names in order to later insert them into the heart infrastructure.
