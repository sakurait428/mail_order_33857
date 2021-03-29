class CardsController < ApplicationController

  before_action :transition_login

  def new
  end

  def create
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    customer = Payjp::Customer.create(
    description: 'test',
    card: params[:card_token]
    )

    card = Card.new(
      card_token: params[:card_token],
      customer_token: customer.id,
      user_id: current_user.id
    )
      if card.save
        redirect_to root_path
      else
        redirect_to new_card_path
      end
  end

  private

  def transition_login
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end
