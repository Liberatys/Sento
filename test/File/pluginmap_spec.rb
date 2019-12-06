# frozen_string_literal: true

require_relative '../../lib/Sento.rb'
describe PluginMap do

  it 'validate the count of start and end' do
        maper = described_class.new
        maper.add_start(1)
        maper.add_end(3)
        expect(maper.is_valid_brackets_count()).to eq(true)
        maper.add_end(3)
        expect(maper.is_valid_brackets_count()).to eq(false)
    end
end
