require_relative '../lib/Sento.rb'
describe PathResolver do
    it 'returns current path head' do
        resolver = described_class.new("plugin.plugger.test")
        expect(resolver.get_current_path_head()).to eq("plugin")
    end

    it 'returns path after truncating the current head' do
        resolver = described_class.new("plugin.plugger.test")
        expect(resolver.get_current_path_head()).to eq("plugin")
        expect(resolver.get_current_path()).to eq("plugger.test")
    end
end