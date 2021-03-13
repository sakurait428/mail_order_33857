class ItemsController < ApplicationController

  def index
    @items = Item.all.order("created_at DESC")
  end

  def show
    @item = Item.find(params[:id])
    @items = Item.includes(:category).order("created_at DESC")
  end

  def new
    @item = Item.new
      #セレクトボックスの初期値設定
      @category_parent_array = ["---"]
     #データベースから、親カテゴリーのみ抽出し、配列化
      Category.where(ancestry: nil).each do |parent|
         @category_parent_array << parent.name
      end
   end

   # 以下全て、formatはjsonのみ
   # 親カテゴリーが選択された後に動くアクション
   def get_category_children
      #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
      @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
   end

   # 子カテゴリーが選択された後に動くアクション
   def get_category_grandchildren
     #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
      @category_grandchildren = Category.find("#{params[:child_id]}").children
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
    @category = Item.find(params[:id])
    @items = Item.includes(:category).order("created_at DESC")
  end

  private

  def item_params
    params.require(:item).permit(:name, :info_product, :price, :info_brand, :info_material, :info_size, :gender, :category_id, images: [])
  end

end
