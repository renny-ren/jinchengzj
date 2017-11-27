class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_local
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action do
    User.current = current_user
  end

  KEYS_ARRAY = %i(username nickname email gender city qq wechat password password_confirmation 
  current_password avatar signature school department major )

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

  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to root_path, alert: "操作被拒绝"
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: KEYS_ARRAY)
  end
end
