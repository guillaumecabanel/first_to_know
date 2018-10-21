class SearchesController < ApplicationController
  def index
    @searches = current_user.searches.order(created_at: :desc)
  end

  def show
    @search = current_user.searches.find(params[:id])
  end

  def new
    @search     = Search.new
    @categories = Category.all.order(:title)
  end

  def create
    @search      = Search.new(search_params)
    @search.user = current_user

    if @search.save
      redirect_to searches_path
    else
      @categories = Category.all.order(:title)
      render :new
    end
  end

  private

  def search_params
    params.require(:search).permit(:query, :zip_code, :category_id)
  end
end
