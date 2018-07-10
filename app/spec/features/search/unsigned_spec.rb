require 'rails_helper'

RSpec.feature 'Unsigned', type: :feature do
  let(:user) { create :user }
  let!(:search) { create(:search, user: user) }

  scenario 'Unsigned user navigate to home page', js: true do
    visit root_path
    expect(page).to_not have_selector('.search-card')
    expect(page).to have_selector('.need-login')
  end
end
