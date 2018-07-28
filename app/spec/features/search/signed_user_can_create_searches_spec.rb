require 'rails_helper'

RSpec.feature 'Signed user can create new searches', type: :feature do
  let(:user) { create :user }

  before do
    sign_in user
    visit root_path
  end

  scenario 'as usual', js: true do
    find('#new-search').click
    find('#search_query').set('First query')
    find('#search_min_price').set('500')
    find('#search_max_price').set('1000')
    find('#create-search').click
    expect(page).to have_css('#searches .search-card .card-header',
                             text: 'First query')
  end
end
