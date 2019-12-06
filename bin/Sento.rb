require_relative "../lib/Sento.rb"

#TODO implement logger
#TODO move raise messages to the front, not in the framework engine
#TODO implement first plugin
#TODO find a good method to 'inject' plugins into the system

def build_abyss()
  abyss = Abyss.new(Heart.new())
  plugger = Plugger.new("root")
  abyss.add_plugger(plugger)
  abyss.add_plugin("root.brew", BrewPlugin.new("brew"))
  abyss
end

run_sento("../examples/test_001.txt", build_abyss)
