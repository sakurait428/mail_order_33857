class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  helper_method :current_cart

  def current_cart
    if session[:cart_id]
      current_cart = Cart.find_by(id: session[:cart_id])
      session[:cart_id] = current_cart.id
      current_cart
    else
      current_cart = Cart.create
      session[:cart_id] = current_cart.id
      current_cart = Cart.find_by(id: session[:cart_id])
      current_cart
    end
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :last_name, :user_birth_date, :postal_code, :prefecture_id, :city, :address, :phone_number, :accepted])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"] 
    end
  end

end
