# frozen_string_literal: true

require_relative '../../lib/Sento.rb'
describe Plugger do

  it 'retreave a list of all plugins in a plugger' do
    plugger = described_class.new("root")
    plugin = Plugin.new("test")
    plugin.add_plugin(PathResolver.new("goo"),Plugin.new("goo"))
    plugger.add_plugin(PathResolver.new("test"),plugin)
    expect(plugger.list_plugins(0)).to eq(["test","  goo"])
end
  
end
