# frozen_string_literal: true

require_relative '../../lib/Sento.rb'
describe FileConverter do
  it 'parses string into toml object' do
    content = <<-SONOL
    [testing]
    dasd
    [good]
    adsasd
    [better]
    dasdad
    SONOL
    parser = described_class.new(content)
    expect(parser.parse_to_sonol.is_a?(Sonol)).to eq(true)
  end

end
