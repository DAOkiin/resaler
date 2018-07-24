require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:user) { create :user }
  let(:search) { create(:search, user: user) }

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

  context 'Validations' do
    it do
      should validate_presence_of :product_id
      should validate_inclusion_of(:source).in_array(%i[youla avito])
    end
  end

  context 'enum' do
    it 'is real enum' do
      foo = described_class.new(search_id: search.id, source: :youla)
      bar = described_class.new(search_id: search.id, source: :avito)
      baz = described_class.new(search_id: search.id, source: :foobar)
      expect(foo.source).to eq('youla')
      expect(bar.source).to eq('avito')
      expect(baz.source).to eq(nil)
    end
  end
end
