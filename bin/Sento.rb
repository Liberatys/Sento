require_relative "../lib/Sento.rb"

#! current todo
# TODO move raise messages to the front, not in the framework engine
# TODO implement more utilty functions for plugins
#! task-list
# TODO find a good method to 'inject' plugins into the system

def build_abyss()
  abyss = Abyss.new(Heart.new())
  abyss.add_logger(Logger.new())
  abyss.add_logger(FileLogger.new("./testing.txt"))
  plugger = Plugger.new("root")
  abyss.add_plugger(plugger)
  abyss.add_plugin("root.folder_struct", FolderStructurePlugin.new("folder_struct"))
  abyss
end

run_sento("../examples/test_valid_format.txt", build_abyss)
