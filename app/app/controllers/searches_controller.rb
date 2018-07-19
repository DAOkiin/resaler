# Create and list user searches
class SearchesController < ApplicationController
  def index
    current_user.searches
  end

  def create
    @search = current_user.searches.new(searches_params)
    respond_to do |format|
      format.js do
        flash.now[:notice] = if @search.save
                               'Run was successfully created.'
                             else
                               'Some error'
                             end
      end
    end
  end

  private

  def searches_params
    params.require(:search).permit(:query, :min_price, :max_price)
  end
end
