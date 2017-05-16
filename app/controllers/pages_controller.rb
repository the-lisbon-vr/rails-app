class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:account]

  def home
  end

  def about
  end

  def contact
  end

  def account
    @my_slots = Slot.where(user_id: current_user.id)
  end
end
