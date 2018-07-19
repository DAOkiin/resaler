require 'rails_helper'

RSpec.feature 'Signed user can see their searches', type: :feature do
  let(:user) { create :user }
  let!(:search) { create(:search, user: user) }

  scenario 'Unsigned user navigate to home page', js: true do
    sign_in user
    visit root_path
    expect(page).to have_selector('.search-card')
    expect(page).to_not have_selector('.need-login')
  end
end
