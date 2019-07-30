class ApplicationController < ActionController::Base
  before_action :set_locale
  protect_from_forgery with: :exception

  include AdminSessionsHelper

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def logged_in_admin
    return if logged_in?
    flash[:danger] = t "flash.please_login"
    redirect_to admin_login_url
  end

  helper_method :current_user

  def current_user
    return false if session[:user_id].nil?
    User.find(session[:user_id])
  end
end
