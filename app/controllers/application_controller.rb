class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  # * Skipping this for now so that you can log in to
  # * Casein without logging in to the website first
  # before_action :authenticate_user!
  # * Need to work out how to skip it on casein pages
  # * because I can't see the controller action in
  # * pages_controller.rb

  def set_locale
    I18n.locale = params[:locale].to_sym || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end
end
