class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_local
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def set_local
    I18n.locale = params[:locale] || I18n.default_locale
  end

  protected

  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation])
   devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password, :password_confirmation])
   devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :password_confirmation, :current_password, :avatar])
  end
end
