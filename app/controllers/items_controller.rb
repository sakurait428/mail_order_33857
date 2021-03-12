class ItemsController < ApplicationController

  def index
    @items = Item.all.order("created_at DESC")
  end

  def show
    @item = Item.find(params[:id])
    @items = Item.includes(:category_genre_two).order("created_at DESC")
  end

  def new
    @item = Item.new
    @categores = Category.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def category
    @item = Item.find(params[:id])
    @items = Item.includes(:category_genre_two).order("created_at DESC")
  end

  private

  def item_params
    params.require(:item).permit(:name, :info_product, :price, :info_brand, :info_material, :info_size, :category_bland_id, :category_gender_id, :category_genre_one_id, :category_genre_two_id, images: [])
  end

end
