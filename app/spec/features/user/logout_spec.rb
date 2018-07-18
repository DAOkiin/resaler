require 'rails_helper'

RSpec.feature 'Logout', type: :feature do
  let(:user) { create(:user) }

  scenario 'user successfully logs out', js: true do
    sign_in user
    visit root_path
    find('.navbar #user-settings').click
    find('.navbar a', text: 'Log out').click
    expect(page).to have_selector('.navbar a', text: 'Login')
  end
end
