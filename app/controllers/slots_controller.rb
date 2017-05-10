class SlotsController < ApplicationController
    before_action :find_slot

    def index
      @slots = Slot.all
    end

    def update
      @slot.user_id = current_user.id
      @slot.save
      flash[:notice] = 'Session booked'
      redirect_to event_path(id: @slot.event.id)
    end

    private
    def find_slot
      @slot = Slot.find(params[:id])
    end
end
