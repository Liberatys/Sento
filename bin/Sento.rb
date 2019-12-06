require_relative "../lib/Sento.rb"

#TODO implement logger
#TODO move raise messages to the front, not in the framework engine
#TODO find a good method to 'inject' plugins into the system
#TODO implement more utilty functions for plugins

def build_abyss()
  abyss = Abyss.new(Heart.new())
  abyss.add_logger(Logger.new())
  plugger = Plugger.new("root")
  abyss.add_plugger(plugger)
  abyss.add_plugin("root.folder_struct", FolderStructurePlugin.new("folder_struct"))
  abyss
end

run_sento("../examples/test_valid_format.txt", build_abyss)
