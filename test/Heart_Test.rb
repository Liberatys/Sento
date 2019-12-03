require_relative "../lib/Sento.rb"
describe Heart do
    
    it 'has an adapter for pluggers' do
        heart = described_class.new()
        expect(heart.add_plugger(Plugger.new("dom"))).to eq(true)
        expect(heart.add_plugin("dom.root",Plugin.new("root"))).to eq(true)
        expect(heart.get_plugin_count()).to eq(2)
    end

    it 'has an adapter for configurators' do
        heart = described_class.new()
        heart.add_configurator(Configurator.new)
        expect(heart.get_configurators().length).to eq(1)
    end

    it 'has an adapter for loggers' do
        heart = described_class.new()
        heart.add_logger(Logger.new)
        expect(heart.get_loggers().length).to eq(1)
    end

end