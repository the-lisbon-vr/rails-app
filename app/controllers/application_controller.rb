class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # * Skipping this for now so that you can log in to
  # * Casein without logging in to the website first
  # before_action :authenticate_user!
  # * Need to work out how to skip it on casein pages
  # * because I can't see the controller action in
  # * pages_controller.rb
end
