class PagesController < ApplicationController
  before_action :authenticate_user!
  def home
    @search = current_user.searches.new
    @searches = current_user.searches.not_deleted.with_items_info
  end
end
