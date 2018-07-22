require 'rails_helper'

RSpec.describe Scraper::YoulaService do
  let(:scraper) { described_class.new(query: 'Foo Bar') }
  let(:item_keys) { %i[title url product_id source] }
  let(:expected_url) { 'https://youla.ru/moskva?q=Foo%20Bar' }
  let(:item_data) do
    { 'id' => {
      title: 'title',
      url: 'url',
      product_id: 'id',
      source: :youla
    } }
  end

  context 'As usual' do
    it 'shoud construct right URL' do
      expect(scraper.url).to eq(expected_url)
    end
    it 'should return correct object' do
      allow_any_instance_of(described_class)
        .to receive(:parse_data_from_page)
        .and_return(item_data)
      responce = scraper.call.first[1].keys
      expect(responce).to match_array(item_keys)
    end
  end
end
