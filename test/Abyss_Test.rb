require_relative "../lib/Sento.rb"
describe Abyss do
    it 'has an adapter for pluggers' do
        heart = Heart.new()
        abyss = described_class.new(heart)
        abyss.add_plugin(Plugger.new())
    end

    it 'has an adapter for configurators' do
        heart = Heart.new()
        abyss = described_class.new(heart)
        abyss.add_configurator(Configurator.new())
    end
    
    it 'has an adapter for loggers' do
        heart = Heart.new()
        abyss = described_class.new(heart)
        abyss.add_logger(Logger.new())
    end
end