class PagesController < ApplicationController
  def home
    @searches = current_user.searches if user_signed_in?
  end
end
