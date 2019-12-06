# frozen_string_literal: true

require_relative '../lib/Sento.rb'
describe Abyss do
  it 'has an adapter for pluggers' do
    heart = Heart.new
    abyss = described_class.new(heart)
    expect(abyss.add_plugger(Plugger.new("root"))).to eq(true)
    expect(abyss.add_plugin("root.main",Plugin.new("main"))).to eq(true)
  end

  it 'has an adapter for configurators' do
    heart = Heart.new
    abyss = described_class.new(heart)
    abyss.add_configurator(Configurator.new)
  end

  it 'has an adapter for loggers' do
    heart = Heart.new
    abyss = described_class.new(heart)
    abyss.add_logger(Logger.new)
  end
end
