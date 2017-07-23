class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_local

  def set_local
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
