class CategoriesController < ApplicationController

  def index
    @category_genders = CategoryGenger.all.order("name ASC")
    @category_blands = CategoryBland.all.order("name ASC")
    @category_genre_ones = CategoryGenreOne.all.order("name ASC")
    @category_genre_twos = CategoryGenreTwo.all.order("name ASC")
  end

  def new
    @categores = Category.all.order("name ASC")
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def destroy
    
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end