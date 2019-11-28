require_relative "../lib/Sento.rb"
describe Heart do
    
    it 'has an adapter for pluggers' do
        heart = described_class.new()
        heart.add_plugin(Plugger.new())
        expect(heart.get_plugins().length).to eq(1)
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