# Create and list user searches
class SearchesController < ApplicationController
  before_action :authenticate_user!
  def index
    current_user.searches
  end

  def show
    @search = Search.find(params[:id])
    @items = Item.with_actual_price(params[:id]).sort_by(&:price_date)

    respond_to do |format|
      format.html
    end
  end

  def create
    @search = current_user.searches.new(searches_params)
    respond_to do |format|
      format.js do
        flash.now[:notice] = if @search.save
                               'Запрос успешно добавлен'
                             else
                               'Some error on create'
                             end
      end
    end
  end

  def destroy
    @search = Search.find(params[:id])
    @search.destroy
    respond_to do |format|
      format.js do
        flash.now[:notice] = if @search.deleted?
                               'Запрос успешно удален'
                             else
                               'Some error on destroy'
                             end
      end
    end
  end

  private

  def searches_params
    params.require(:search).permit(:query, :min_price, :max_price)
  end
end
