class OrdersController < ApplicationController

  def index
    @orders = Order.includes(:cart_items)
    @carts = Cart.all
  end

  def new
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    card = Card.find_by(user_id: current_user.id)
    redirect_to new_card_path and return unless card.present?
    
    @cart = current_cart
    @order = Order.new
    total_price =params[:total_price].to_s

    respond_to do |format|
      format.html
      format.json { render json: @order }
    end

    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]

    customer_token = current_user.card.customer_token
    Payjp::Charge.create(
      amount: total_price,
      customer: customer_token,
      currency: 'jpy'
      )
    if user_signed_in?
      card = Card.find_by(user_id: current_user.id)
    end

    redirect_to new_card_path and return unless card.present?

    customer = Payjp::Customer.retrieve(card.customer_token)
    @card = customer.cards.first

  end

  def create

    @order = Order.new(order_params)
    @order.add_items(current_cart)
    
    current_cart.cart_items.each do |item|

      order_item = Item.find(item.item.id)

      quantity = item.item.stock_quantity -= item.quantity
      order_item.update(stock_quantity: quantity)
    end
    
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
