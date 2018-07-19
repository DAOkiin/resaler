require 'rails_helper'

RSpec.describe Item, type: :model do
  context 'Associations' do
    it 'belongs_to search' do
      association = described_class.reflect_on_association(:search).macro
      expect(association).to eq :belongs_to
    end

    it 'has_many prices' do
      association = described_class.reflect_on_association(:prices)
      expect(association.macro).to eq :has_many
    end
  end
end
