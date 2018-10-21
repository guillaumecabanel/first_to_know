class SearchesController < ApplicationController
  before_action :set_categories, only: [:index, :new, :create]

  def index
    @category = Category.find(params[:category_id]) unless params[:category_id].nil? || params[:category_id].empty?
    if @category
      @searches = current_user.searches.where(category: @category).order(created_at: :desc)
    else
      @searches = current_user.searches.order(created_at: :desc)
    end
  end

  def show
    @search = current_user.searches.find(params[:id])
  end

  def new
    @search     = Search.new
  end

  def create
    @search      = Search.new(search_params)
    @search.user = current_user

    if @search.save
      redirect_to searches_path
    else
      render :new
    end
  end

  def destroy
    @search = current_user.searches.find(params[:id])
    @search.destroy
    redirect_to searches_path
  end

  private

  def search_params
    params.require(:search).permit(:query, :zip_code, :category_id)
  end

  def set_categories
    @categories = Category.all.order(:title)
  end
end
