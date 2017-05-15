class SlotsController < ApplicationController
    before_action :find_slot

    def index
      @slots = Slot.all
    end

    def update
      if @slot.user_id != nil
        flash[:alert] = 'This session has already been booked'
        redirect_to event_path(id: @slot.event.id)
      else
        @slot.user_id = current_user.id
        @slot.save
        flash[:notice] = 'Session booked'
        redirect_to event_path(id: @slot.event.id)
      end
    end

    def show
      @my_slots = []
      Slot.find_each do |slot|
        @my_slots << slot if slot.user = current_user
      end
      @my_slots
    end

    private

    def find_slot
      @slot = Slot.find(params[:id])
    end
end
