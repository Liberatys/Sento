require_relative "../lib/Sento.rb"

#TODO implement logger
#TODO move raise messages to the front, not in the framework engine
#TODO find a good method to 'inject' plugins into the system
#TODO implement more utilty functions for plugins

def build_abyss()
  abyss = Abyss.new(Heart.new())
  plugger = Plugger.new("root")
  abyss.add_plugger(plugger)
  abyss.add_plugin("root.choco", ChocoPlug.new("choco"))
  abyss.add_plugin("root.brew", BrewPlugin.new("brew"))
  abyss.add_plugin("root.vscode", VSCodePlugin.new("vscode"))
  abyss
end

run_sento("../examples/test_valid_format.txt", build_abyss)
