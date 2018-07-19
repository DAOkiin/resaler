class PagesController < ApplicationController
  before_action :authenticate_user!
  def home
    @search = current_user.searches.new
    @searches = current_user.searches.not_deleted
  end
end
