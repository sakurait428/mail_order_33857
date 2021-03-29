class ItemsController < ApplicationController

  before_action :authenticate_admin!, only: [:new, :create, :destroy, :purchase_record_admin, :get_category_children, :get_category_grandchildren]
  before_action :transition_login_page, only: [:purchase_record]

  def index
    @items = Item.all.order("created_at DESC")
    @cart_items = current_cart.cart_items
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
    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      redirect_to root_path
    end
  end

  def item_all
    @items = Item.all.order("created_at DESC")
  end

  def category_one
    @category = Category.find(params[:id])
    @params = params[:id]
    @categores = Category.all
    @items = Item.all.order("created_at DESC")
  end

  def category_two
    @category = Category.find(params[:id])
    @params = params[:id]
    @categores = Category.all
    @items = Item.all.order("created_at DESC")
  end

  def category_three
    @category = Category.find(params[:id])
    @params = params[:id]
    @categores = Category.all
    @items = Item.where(category_id: params[:id]).order("created_at DESC")
  end

  def purchase_record
    @orders = Order.where(user_id: current_user.id).order("created_at DESC")
  end

  def purchase_record_admin
    @orders = Order.all.order("created_at DESC")
  end

  def site_map
    
  end

  private

  def item_params
    params.require(:item).permit(:name, :info_product, :price, :info_brand, :info_material, :info_size, :gender, :category_id, :stock_quantity, images: [])
  end

  def transition_login_page
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end
