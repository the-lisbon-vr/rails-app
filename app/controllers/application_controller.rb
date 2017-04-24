class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  before_action :authenticate_user!
  # * Need to work out how to skip this on casein pages
  # *** I don't know where the controller action comes
  # *** from (it's not in pages_controller.rb)

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end
end
