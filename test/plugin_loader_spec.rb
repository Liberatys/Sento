# frozen_string_literal: true

require_relative '../lib/Sento.rb'
describe PluginLoader do
  it 'loads plugins based on configuration file' do
	  file_content = <<-CONTENT
    StubPlugin|./stubs/stub_plug.rb|root.stub|stub
   CONTENT
   loader = described_class.new(Reader.new("-"))
   load_calls = loader.load_plugins(file_content)
   expect(load_calls[0].get_plugin.is_a?(StubPlugin)).to eq(true)
   expect(load_calls.length).to eq(1)
  end

  it 'loads only valid files' do
    file_content = <<-CONTENT
    StubPlugin|./stubs/except/stub_plug.rb|root.stub|stub
   CONTENT
   loader = described_class.new(Reader.new("-"))
   load_calls = loader.load_plugins(file_content)
   expect(load_calls.length).to eq(0)
  end
end
