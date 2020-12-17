class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params

    redirect_to categories_path if @category.save
  end

  def show
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      redirect_to categories_url, notice: 'Category was successfully destroyed.'
    end
  end

  def category_params
    params.require(:category).permit(:name, :author, :publisher, :price)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name, :description)
    end
end
