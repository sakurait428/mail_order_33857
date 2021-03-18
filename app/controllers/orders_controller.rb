class OrdersController < ApplicationController

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
        format.html { redirect_to cart_url, notice: 'ご注文ありがとうございました。' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def order_params
      params.require(:order).permit(:name, :address, :email, :phone_number, :pay_type)
    end

end
