class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :last_name, :user_birth_date, :postal_code, :prefecture_id, :city, :address, :phone_number, :accepted])
  end
end
