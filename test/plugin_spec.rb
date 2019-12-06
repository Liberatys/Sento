# frozen_string_literal: true

require_relative "../lib/Sento.rb"
describe Plugger do
  it "can resolve plugin path" do
    plugger = described_class.new("main")
    plugin = Plugin.new("test")
    expect(plugger.add_plugin(PathResolver.new("test"), plugin)).to eq(true)
    expect(plugger.resolve_plugin(PathResolver.new("test"))).to eq(plugin)
  end

  it "can insert plugin based on path" do
    plugger = described_class.new("main")
    foo_test = Plugin.new("foo")
    expect(plugger.add_plugin(PathResolver.new("test"), Plugin.new("test"))).to eq(true)
    expect(plugger.add_plugin(PathResolver.new("main"), Plugin.new("main"))).to eq(true)
    expect(plugger.add_plugin(PathResolver.new("main.foo"), foo_test)).to eq(true)
    #! this just checks if the plugin has been inserted at the correct position
    expect(plugger.resolve_plugin(PathResolver.new("main.foo"))).to eq(foo_test)
  end
end
