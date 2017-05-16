class SlotsController < ApplicationController
    before_action :find_slot, only: [ :update, :cancel_session ]
    before_action :authenticate_user!

    def update
      if !@slot.user_id.nil?
        flash[:alert] = 'This session has already been booked'
        redirect_to event_path(id: @slot.event.id)
      elsif current_user.id.nil?
        flash[:alert] = 'You must be signed in to book'
        redirect_to event_path(id: @slot.event.id)
      else
        @slot.user_id = current_user.id
        @slot.save
        flash[:notice] = 'Session booked'
        redirect_to event_path(id: @slot.event.id)
      end
    end

    # only including this show method for the sake of the cancelling a session
    # it shouldn't be actually accessible as a page (because there's no need)
    def show
      redirect_to root_path
    end

    private

    def find_slot
      @slot = Slot.find(params[:id])
    end
end
