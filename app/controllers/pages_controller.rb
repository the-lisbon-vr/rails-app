class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:account, :cancel_session]

  def home
  end

  def about
  end

  def contact
  end

  def account
    my_slots = Slot.where(user_id: current_user.id)
    my_slots = my_slots.sort_by {|slot| slot.event.date}
    @slots_by_events = {}
    my_slots.each do |slot|
      @slots_by_events[slot.event.id] = [] if !@slots_by_events.has_key?(slot.event.id)
      @slots_by_events[slot.event.id] << slot
    end
  end

  def cancel_session
    slot = Slot.find(params[:slot_id])
    if slot.user == current_user
      slot.user_id = nil
      slot.save ? flash[:notice] = t(".session_cancelled") : flash[:alert] = t(".something_went_wrong")
      redirect_to account_path
    else
      flash[:alert] = "That's not your slot"
      redirect_to root_path
    end
  end
end
