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
    @category = :category_id_eq_any

    # 親セレクトボックスの初期値(配列)
    @category_parent_array = ["---"]
    # categoriesテーブルから親カテゴリーのみを抽出、配列に格納
    Category.where(ancestry: nil).each do |parent|
    @category_parent_array << parent.name
    end

    @category_child_array = ["---"]
    Category.where(ancestry: 1).each do |child|
    @category_child_array << child.name
    end

    # itemに紐づいていいる孫カテゴリーが属している孫カテゴリーの一覧を配列で取得
    @category_grandchild_array = ["---"]
    Category.where(ancestry: nil).each do |grandchild|
    @category_grandchild_array << grandchild.name
    end

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
