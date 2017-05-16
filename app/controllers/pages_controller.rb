class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:account, :cancel_session]

  def home
  end

  def about
  end

  def contact
  end

  def account
    @my_slots = Slot.where(user_id: current_user.id)
  end

  def cancel_session
    slot = Slot.find(params[:slot_id])
    if slot.user == current_user
      slot.user_id = nil
      slot.save ? flash[:notice] = "Session cancelled" : flash[:alert] = "Oops, something went wrong..."
      redirect_to account_path
    else
      flash[:alert] = "That's not your slot"
      redirect_to root_path
    end
  end
end
