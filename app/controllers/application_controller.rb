class ApplicationController < ActionController::Base
  before_action :set_locale

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  helper_method :current_user

  def current_user
    return false if session[:user_id].nil?
    User.find(session[:user_id])
  end
end
