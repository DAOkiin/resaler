require 'rails_helper'

RSpec.describe Price, type: :model do
  context 'Associations' do
    it 'belongs_to item' do
      association = described_class.reflect_on_association(:item).macro
      expect(association).to eq :belongs_to
    end
  end
end
