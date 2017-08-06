class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_local
  before_filter :configure_permitted_parameters, if: :devise_controller?

  KEYS_ARRAY = [%i(username nickname email password password_confirmation current_password avatar signature)].freeze

  def set_local
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def authenticate_user!(opts = {})
    return if current_user
    if turbolinks_app?
      render plain: '401 Unauthorized', status: 401
      return
    end

    store_location

    super(opts)
  end

  def store_location
    session[:return_to] = request.url
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: KEYS_ARRAY)
  end
end
