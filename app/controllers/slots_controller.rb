class SlotsController < ApplicationController
    before_action :find_slot, only: [ :show, :update, :cancel_session ]
    before_action :authenticate_user!

    def update
      if !@slot.user_id.nil? && @slot.user_id != current_user.id
        render plain: t(".session_already_booked")
      elsif current_user.id.nil?
        flash[:alert] = t(".must_be_signed_in_to_book")
        redirect_to event_path(id: @slot.event.id)
      else
        @slot.update_attributes(user_id: current_user.id)
        # @slot.send_confirmation
        render plain: "ok"
      end
    end

    # only including this show method for the sake of the cancelling a session
    # it shouldn't be actually accessible as a page (because there's no need)
    # --update: also works as a way for someone to book a session by opening the link in a new tab. Woop!
    def show
      update
    end

    private

    def find_slot
      @slot = Slot.find(params[:id])
    end

end
