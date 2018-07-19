require 'rails_helper'

RSpec.feature 'Unsigned user can not see any searches', type: :feature do
  let(:user) { create :user }
  let!(:search) { create(:search, user: user) }

  scenario 'Unsigned user navigate to home page', js: true do
    visit root_path
    expect(page).to have_selector('#flash_messages',
                                  text: I18n.t('devise.failure.unauthenticated'))
    expect(page).to_not have_selector('.search-card')
  end
end
