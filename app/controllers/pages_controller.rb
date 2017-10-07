class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:account, :cancel_session]
  before_action :get_my_slots, only: [:account, :confirm_my_bookings]

  def home
  end

  def about
  end

  def contact
  end

  def account
  end

  def confirm_my_bookings
    @confirmed_slots_by_event = {}
    @my_slots.each do |slot|
      if slot.event.date >= Date.today
        slot.confirmed = true
        if slot.save
          @confirmed_slots_by_event[slot.event.id.to_s] = [] if !@confirmed_slots_by_event.has_key?(slot.event.id.to_s)
          @confirmed_slots_by_event[slot.event.id.to_s] << slot.id
        end
      end
    end

    if !@confirmed_slots_by_event.empty?
      current_user.send_bookings_confirmation(@confirmed_slots_by_event)
      flash[:notice] = t(".bookings_confirmed")
    else
      flash[:alert] = t(".nothing_confirmed")
    end
    redirect_to account_path
  end

  private

  def get_my_slots
    @my_slots = Slot.where(user_id: current_user.id)
    @my_slots = @my_slots.sort_by {|slot| slot.event.date}
    @slots_by_events = {}
    @my_slots.each do |slot|
      @slots_by_events[slot.event.id] = [] if !@slots_by_events.has_key?(slot.event.id)
      @slots_by_events[slot.event.id] << slot
    end
  end
end
