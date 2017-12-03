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
    store_location
    super(opts)
  end

  def store_location
    session[:return_to] = request.url
  end

  rescue_from CanCan::AccessDenied do |_exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to root_url, alert: t('exception.message') }
      format.js { head :forbidden, content_type: 'text/html' }
    end
  end

  def render_404
    respond_to do |format|
      format.html { render template: "/errors/404", handler: [:erb], status: status, layout: "application" }
      format.all  { render nothing: true, status: status }
    end
  end

  def update_related_assets
    session[:asset_ids].each do |asset_id|
      @asset = Kindeditor::Asset.find(asset_id)
      @asset.owner_id = @topic.id
      @asset.owner_type = @topic.class.name
      @asset.save
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: KEYS_ARRAY)
  end
end
