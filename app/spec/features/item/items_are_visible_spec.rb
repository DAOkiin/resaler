require 'rails_helper'

RSpec.feature 'Items are vivisble on searches#show', type: :feature do
  let(:user) { create :user }
  let(:search) { create(:search, user: user) }
  let!(:item) { create(:item, search: search) }

  before do
    sign_in user
    visit search_path(search)
  end

  scenario 'as usual', js: true do
    expect(page).to have_selector("#item_#{item.id}")
  end
end
