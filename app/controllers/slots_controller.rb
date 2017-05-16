class SlotsController < ApplicationController
    before_action :find_slot, only: [ :update ]

    def index
      # @slots = Slot.all
    end

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

    def show
      @my_slots = Slot.where(user_id: current_user.id)
    end

    private

    def find_slot
      @slot = Slot.find(params[:id])
    end
end
