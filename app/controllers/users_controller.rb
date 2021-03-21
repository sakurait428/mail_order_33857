class UsersController < ApplicationController
  def edit
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    if user_signed_in?
      card = Card.find_by(user_id: current_user.id)
    end
 
    redirect_to new_card_path and return unless card.present?
 
    customer = Payjp::Customer.retrieve(card.customer_token)
    @card = customer.cards.first
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      redirect_to "show"
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :user_birth_date, :postal_code, :prefecture_id, :city, :block, :phone_number, :email)
  end

end
