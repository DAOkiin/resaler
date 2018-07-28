require 'rails_helper'

RSpec.describe ItemsService do
  let(:user) { create :user }
  let(:search) { create(:search, user: user) }
  let(:old_item) { create(:item, search: search) }
  let(:items_data) { DataSupport.parsed_items }

  context 'as usual' do
    it 'create new items and prices' do
      expect do
        described_class.call(search_id: search.id, data: items_data)
      end.to change { Item.count }.by(1)
                                  .and change { Price.count }.by(1)
    end

    it 'update old items and create prices' do
      items_data = DataSupport.parsed_items(init_id: old_item.id)
      expect(old_item.product_id).to eq(items_data.keys.first)
      expect do
        described_class.call(search_id: search.id,
                             data: items_data)
      end.to change { Item.first.updated_at }
        .and change { Price.count }.by(1)
    end
  end
end
