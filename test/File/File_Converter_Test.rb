# frozen_string_literal: true

require_relative '../../lib/Sento.rb'
describe FileConverter do
  
  it 'parses string into sonol object' do
    content = <<-SONOL
    [root]
    dasd
    [bottom]
    adsasd
    [upper.go.test]
    dasdad
    SONOL
    parser = described_class.new(content)
    sonol_obj = parser.parse_to_sonol
    expect(sonol_obj.is_a?(Sonol)).to eq(true)
    expect(sonol_obj.get_plugin_paths).to eq(["root", "bottom", "upper.go.test"])
  end

end
