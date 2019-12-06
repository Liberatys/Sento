# frozen_string_literal: true

require_relative '../../lib/Sento.rb'
describe Sonol do
  it 'parse plugin content and plugin name' do
    content = <<-SONOL
    [root | gogole]
    dasd
    [bottom]
    adsasd
    adsd
    [upper.go.test]
    dasdad
    SONOL
    parser = FileConverter.new(content)
    sonol_obj = parser.parse_to_sonol
    sonol_obj.build_plugin_calls
    var = sonol_obj.get_plugin_calls
    expect(var[0].get_plugin_method).to eq("gogole")
    expect(var[1].get_plugin_method).to eq("install")
    expect(var[1].get_name).to eq("bottom")
    expect(var[0].get_arguments).to eq(["dasd"])
    expect(var[1].get_arguments).to eq(["adsasd","adsd"])
  end
end
