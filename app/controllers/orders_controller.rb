class OrdersController < ApplicationController

  def index
    @orders = Order.includes(:cart_items)
    @carts = Cart.all
  end

  def new
    @cart = current_cart
    @order = Order.new

    respond_to do |format|
      format.html
      format.json { render json: @order }
    end

  end

  def create
    @order = Order.new(order_params)
    @order.add_items(current_cart)
    respond_to do |format|
      if @order.save
      	Cart.destroy(session[:cart_id])
      	session[:cart_id] = nil
        format.html { redirect_to root_path, notice: 'ご注文ありがとうございました。' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
       end
     end
  end

  private

    def order_params
      params.require(:order).permit(:name, :postal_code, :address, :email, :phone_number).merge(user_id: current_user.id)
    end

end
