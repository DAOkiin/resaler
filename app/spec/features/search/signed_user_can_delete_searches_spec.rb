require 'rails_helper'

RSpec.feature 'Signed user can delete new searches(/pages/home)' do
  let(:user) { create :user }
  let!(:search) { create(:search, user: user) }

  before do
    sign_in user
    visit root_path
  end

  scenario 'as usual', js: true do
    page.save_screenshot('image.png')
    expect(page).to have_selector("#search-#{search.id}")
    find("#delete-search-#{search.id}").click
    page.accept_alert
    expect(page).to_not have_selector("#search-#{search.id}")
  end
end
